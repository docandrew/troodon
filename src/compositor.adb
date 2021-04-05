with Ada.Text_IO;
with Ada.Unchecked_Deallocation;
with Interfaces.C; use Interfaces.C;

with xcb;
with xproto;
with xcb_composite;

with Setup;

package body Compositor is

    overlay : xproto.xcb_window_t;

    type OverlayReplyPtr is access all xcb_composite.xcb_composite_get_overlay_window_reply_t;
    
    procedure initCompositor(c : access xcb_connection_t) is
        use xcb;
        use xproto;
        use xcb_composite;

        cookie     : xcb_void_cookie_t;
        error      : access xcb_generic_error_t;
        composite  : access constant xcb_query_extension_reply_t;
        root       : xcb_window_t := Setup.getRootWindow (c);
        updateMode : Interfaces.C.unsigned_char := xcb_composite_redirect_t'Pos(XCB_COMPOSITE_REDIRECT_AUTOMATIC);
        
        cookieOvly : xcb_composite_get_overlay_window_cookie_t;
        replyOvly  : OverlayReplyPtr;
        errorOvly  : aliased xcb_generic_error_t;

        procedure free is new Ada.Unchecked_Deallocation (Object => xcb_composite_get_overlay_window_reply_t,
                                                          Name   => OverlayReplyPtr);
    begin
        composite := xcb_get_extension_data (c, xcb_composite_id'Access);

        if composite.present /= 0 then
            Ada.Text_IO.Put_Line ("Troodon: (compositor) Composite Extension Present!");
        end if;

        -- @TODO probably want to grab server before doing this or do this in Setup while
        -- we have it grabbed.
        -- Enable basic server-side compositing for now
        cookie := xcb_composite_redirect_subwindows_checked (c      => c,
                                                             window => root,
                                                             update => updateMode);

        error := xcb_request_check (c, cookie);

        if error /= null then
            Ada.Text_IO.Put_Line ("Troodon: (compositor) Error redirecting subwindows:" & error.error_code'Image);
            return;
        end if;

        -- Get the overlay window, create a GLX drawable for it.
        -- @TODO note if we can get the GLX context here, we don't need to do that check in Frame anymore
        cookieOvly := xcb_composite_get_overlay_window (c, root);
        replyOvly  := xcb_composite_get_overlay_window_reply (c, cookieOvly, error'Address);

        if error /= null then
            Ada.Text_IO.Put_Line ("Troodon: (compositor) Error getting overlay window:" & error.error_code'Image);
        end if;

        Ada.Text_IO.Put_Line ("Troodon: (compositor) Received overlay window:" & replyOvly.overlay_win'Image);

        free (replyOvly);
    end initCompositor;

end Compositor;