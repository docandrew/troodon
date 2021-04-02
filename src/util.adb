with Ada.Text_IO;
with Ada.Unchecked_Deallocation;
with GNAT.OS_Lib;
with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings; use Interfaces.C.Strings;
with System;

package body util is

    ---------------------------------------------------------------------------
    -- checkFatal
    -- Given a connection and the cookie from an xcb request, if the request
    -- failed, disconnect from the X Server, print the given error message, and
    -- terminate the window server, exiting the program.
    -- @TODO make sure Xlib display is closed out
    ---------------------------------------------------------------------------
    procedure checkFatal(connection : access xcb_connection_t;
                         cookie     : xcb_void_cookie_t;
                         message    : String)
    is
        error : access xcb_generic_error_t := xcb_request_check(connection, cookie);
    begin
        if error /= null then
            Ada.Text_IO.Put_Line("Troodon: " & message & " error code:" & error.error_code'Image);
            xcb_disconnect(connection);
            GNAT.OS_Lib.OS_Exit(1);
        end if;
    end checkFatal;

    --------------------------------------------------------------------------
    -- checkCritical
    -- Given a connection and the cookie from an xcb request, if the request
    -- failed, return False. Otherwise, return True.
    --------------------------------------------------------------------------
    -- function checkCritical(connection : access xcb_connection_t;
    --                        cookie     : xcb_void_cookie_t) return Boolean
    -- is
    --     error : access xcb_generic_error_t := xcb_request_check(connection, cookie);
    -- begin
    --     return (error /= null);
    -- end checkCritical;

    ---------------------------------------------------------------------------
    -- charsToUBS
    ---------------------------------------------------------------------------
    -- function charsToUBS(charPtr : Interfaces.C.Strings.chars_ptr;
    --                     len : Interfaces.C.unsigned) return Unbounded_String
    -- is
    -- begin
    --     if len <= 0 then
    --         return To_Unbounded_String("");
    --     else
    --         return To_Unbounded_String(Interfaces.C.Strings.Value (charPtr, size_t(len)));
    --     end if;
    -- end charsToUBS;

    function charsToUBS(charPtr : System.Address;
                        len : Interfaces.C.int) return Unbounded_String
    is
        chars : Interfaces.C.char_array(1..size_t(len))
            with Import, Address => charPtr;

        adaStr : String := Interfaces.C.To_Ada(Item => chars, Trim_Nul => False);
    begin
        --Ada.Text_IO.Put_Line("charsToUBS: addr:" & unsigned(charPtr)'Image);
        --Ada.Text_IO.Put_Line(adaStr);
        return To_Unbounded_String (adaStr);
    end charsToUBS;

    ---------------------------------------------------------------------------
    -- getStringProperty
    ---------------------------------------------------------------------------
    function getStringProperty(connection : access xcb_connection_t;
                               window     : xcb_window_t;
                               name       : xcb_atom_t) return Unbounded_String is

        type PropertyReplyPtr is access all xcb_get_property_reply_t;
        procedure free is new Ada.Unchecked_Deallocation(Object => xcb_get_property_reply_t, Name => PropertyReplyPtr);
        
        propCookie : xcb_get_property_cookie_t;
        reply : access xcb_get_property_reply_t;
        len : Interfaces.C.int;
        ret : Unbounded_String;
        err : access xcb_generic_error_t;
    begin
        propCookie := xcb_get_property (c => connection,
                                        u_delete => 0,
                                        window => window,
                                        property => name,
                                        c_type => XCB_ATOM_STRING,
                                        long_offset => 0,
                                        long_length => 16#FFFF_FFFF#);

        -- Ada.Text_IO.Put_Line("propCookie: " & propCookie.sequence'Image);
    
        reply := xcb_get_property_reply(connection, propCookie, err'Address);

        if err /= null then
            Ada.Text_IO.Put_Line("Error during get_property: " & err.error_code'Image);
            return To_Unbounded_String("");
        end if;

        if reply /= null and then reply.length > 0 then
            -- Ada.Text_IO.Put_Line("Got property" & reply.response_type'Image & " reply length:" & reply.length'Image & " type:" & Integer(reply.c_type)'Image); 
            -- Ada.Text_IO.Put_Line(" Property Value length: " & xcb_get_property_value_length(reply)'Image & " reply.value_len:" & reply.value_len'Image);
            -- Ada.Text_IO.Put_Line("A");
            ret := charsToUBS (xcb_get_property_value(reply), xcb_get_property_value_length(reply));
            -- Ada.Text_IO.Put_Line("B");
            -- Ada.Text_IO.Put_Line(" received: " & To_String(ret));
            free(PropertyReplyPtr(reply));
        else
            -- Ada.Text_IO.Put_Line("Error getting string property");
            return To_Unbounded_String("");
        end if;

        return ret;
    end getStringProperty;

    ---------------------------------------------------------------------------
    -- getAtomProperty
    ---------------------------------------------------------------------------
    function getAtomProperty(connection : access xcb_connection_t;
                             window     : xcb_window_t;
                             name       : xcb_atom_t) return xcb_atom_t is

        type PropertyReplyPtr is access all xcb_get_property_reply_t;
        procedure free is new Ada.Unchecked_Deallocation(Object => xcb_get_property_reply_t, Name => PropertyReplyPtr);
        
        propCookie : xcb_get_property_cookie_t;
        reply : access xcb_get_property_reply_t;
        len : Interfaces.C.int;
        ret : xcb_atom_t;
        err : access xcb_generic_error_t;
    begin
        propCookie := xcb_get_property (c           => connection,
                                        u_delete    => 0,
                                        window      => window,
                                        property    => name,
                                        c_type      => XCB_ATOM_ATOM,
                                        long_offset => 0,
                                        long_length => 4);

        -- Ada.Text_IO.Put_Line("propCookie: " & propCookie.sequence'Image);
    
        reply := xcb_get_property_reply(connection, propCookie, err'Address);

        if err /= null then
            Ada.Text_IO.Put_Line("Error during getAtomProperty: " & err.error_code'Image);
            return XCB_ATOM_NONE;
        end if;

        if reply /= null and then reply.length > 0 then
            declare
                atomCopy : xcb_atom_t with Import, Address => xcb_get_property_value(reply);
            begin
                ret := atomCopy;
            end;

            free(PropertyReplyPtr(reply));
        else
            return XCB_ATOM_NONE;
        end if;

        return ret;
    end getAtomProperty;

    ---------------------------------------------------------------------------
    -- getWindowGeometry
    --  convenience function for getting a geometry struct
    -- @param error - out access xcb_generic_error_t, if necessary for checking
    ---------------------------------------------------------------------------
    function getWindowGeometry(connection : access xcb_connection_t;
                               window     : xcb_window_t;
                               error      : out errorPtr) return xcb_get_geometry_reply_t is
        type geomPtr is access all xcb_get_geometry_reply_t;
        geom : geomPtr;
        -- @TODO consider using the response_type field as a marker if this call was successful or not.
        ret : xcb_get_geometry_reply_t := (x      => 0,
                                           y      => 0,
                                           width  => 0,
                                           height => 0,
                                           others => <>);
        
        procedure free is new Ada.Unchecked_Deallocation (Object => xcb_get_geometry_reply_t, Name => geomPtr);
    begin
        -- consider checking this
        -- Ada.Text_IO.Put_Line("getting geometry for" & window'Image);
        geom := xcb_get_geometry_reply (connection, xcb_get_geometry (connection, window), error'Address);
        ret := xcb_get_geometry_reply_t (geom.all);
        free(geom);

        return ret;
    end getWindowGeometry;

    ---------------------------------------------------------------------------
    -- getWindowGeometry
    --  convenience function for getting a geometry struct
    ---------------------------------------------------------------------------
    function getWindowGeometry (connection : access xcb_connection_t;
                                window     : xcb_window_t) return xcb_get_geometry_reply_t is
        dummyError : errorPtr;
    begin
        return getWindowGeometry (connection, window, dummyError);
    end getWindowGeometry;
end util;