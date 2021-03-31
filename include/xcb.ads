pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with System;
with bits_stdint_uintn_h;
with Interfaces.C.Strings;
limited with xproto;

package xcb is

   --  unsupported macro: XCB_PACKED __attribute__((__packed__))
   X_TCP_PORT : constant := 6000;  --  /usr/include/xcb/xcb.h:72

   XCB_CONN_ERROR : constant := 1;  --  /usr/include/xcb/xcb.h:75

   XCB_CONN_CLOSED_EXT_NOTSUPPORTED : constant := 2;  --  /usr/include/xcb/xcb.h:78

   XCB_CONN_CLOSED_MEM_INSUFFICIENT : constant := 3;  --  /usr/include/xcb/xcb.h:81

   XCB_CONN_CLOSED_REQ_LEN_EXCEED : constant := 4;  --  /usr/include/xcb/xcb.h:84

   XCB_CONN_CLOSED_PARSE_ERR : constant := 5;  --  /usr/include/xcb/xcb.h:87

   XCB_CONN_CLOSED_INVALID_SCREEN : constant := 6;  --  /usr/include/xcb/xcb.h:90

   XCB_CONN_CLOSED_FDPASSING_FAILED : constant := 7;  --  /usr/include/xcb/xcb.h:93
   --  arg-macro: function XCB_TYPE_PAD (T, I)
   --    return -(I) and (sizeof(T) > 4 ? 3 : sizeof(T) - 1);

   XCB_NONE : constant := 0;  --  /usr/include/xcb/xcb.h:209

   XCB_COPY_FROM_PARENT : constant := 0;  --  /usr/include/xcb/xcb.h:212

   XCB_CURRENT_TIME : constant := 0;  --  /usr/include/xcb/xcb.h:215

   XCB_NO_SYMBOL : constant := 0;  --  /usr/include/xcb/xcb.h:218

  -- * Copyright (C) 2001-2006 Bart Massey, Jamey Sharp, and Josh Triplett.
  -- * All Rights Reserved.
  -- *
  -- * Permission is hereby granted, free of charge, to any person obtaining a
  -- * copy of this software and associated documentation files (the "Software"),
  -- * to deal in the Software without restriction, including without limitation
  -- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
  -- * and/or sell copies of the Software, and to permit persons to whom the
  -- * Software is furnished to do so, subject to the following conditions:
  -- *
  -- * The above copyright notice and this permission notice shall be included in
  -- * all copies or substantial portions of the Software.
  -- *
  -- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
  -- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
  -- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
  -- * AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
  -- * ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
  -- * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
  -- *
  -- * Except as contained in this notice, the names of the authors or their
  -- * institutions shall not be used in advertising or otherwise to promote the
  -- * sale, use or other dealings in this Software without prior written
  -- * authorization from the authors.
  --  

  --*
  -- * @file xcb.h
  --  

  --*
  -- * @defgroup XCB_Core_API XCB Core API
  -- * @brief Core API of the XCB library.
  -- *
  -- * @{
  --  

  -- Pre-defined constants  
  --* Current protocol version  
  --* Current minor version  
  --* X_TCP_PORT + display number = server port for TCP transport  
  --* xcb connection errors because of socket, pipe and other stream errors.  
  --* xcb connection shutdown because of extension not supported  
  --* malloc(), calloc() and realloc() error upon failure, for eg ENOMEM  
  --* Connection closed, exceeding request length that server accepts.  
  --* Connection closed, error during parsing display string.  
  --* Connection closed because the server does not have a screen matching the display.  
  --* Connection closed because some FD passing operation failed  
  -- Opaque structures  
  --*
  -- * @brief XCB Connection structure.
  -- *
  -- * A structure that contain all data that  XCB needs to communicate with an X server.
  --  

  --*< Opaque structure containing all data that  XCB needs to communicate with an X server.  
   type xcb_connection_t is null record;   -- incomplete struct

  -- Other types  
  --*
  -- * @brief Generic iterator.
  -- *
  -- * A generic iterator structure.
  --  

  --*< Data of the current iterator  
   --  skipped anonymous struct anon_28

   type xcb_generic_iterator_t is record
      data : System.Address;  -- /usr/include/xcb/xcb.h:115
      c_rem : aliased int;  -- /usr/include/xcb/xcb.h:116
      index : aliased int;  -- /usr/include/xcb/xcb.h:117
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xcb.h:118

  --*< remaining elements  
  --*< index of the current iterator  
  --*
  -- * @brief Generic reply.
  -- *
  -- * A generic reply structure.
  --  

  --*< Type of the response  
   --  skipped anonymous struct anon_29

   type xcb_generic_reply_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xcb.h:126
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xcb.h:127
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xcb.h:128
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xcb.h:129
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xcb.h:130

  --*< Padding  
  --*< Sequence number  
  --*< Length of the response  
  --*
  -- * @brief Generic event.
  -- *
  -- * A generic event structure.
  --  

  --*< Type of the response  
   --  skipped anonymous struct anon_30

   type xcb_generic_event_t_array1650 is array (0 .. 6) of aliased bits_stdint_uintn_h.uint32_t;
   type xcb_generic_event_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xcb.h:138
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xcb.h:139
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xcb.h:140
      pad : aliased xcb_generic_event_t_array1650;  -- /usr/include/xcb/xcb.h:141
      full_sequence : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xcb.h:142
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xcb.h:143

  --*< Padding  
  --*< Sequence number  
  --*< Padding  
  --*< full sequence  
  --*
  -- * @brief Raw Generic event.
  -- *
  -- * A generic event structure as used on the wire, i.e., without the full_sequence field
  --  

  --*< Type of the response  
   --  skipped anonymous struct anon_31

   type xcb_raw_generic_event_t_array1650 is array (0 .. 6) of aliased bits_stdint_uintn_h.uint32_t;
   type xcb_raw_generic_event_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xcb.h:151
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xcb.h:152
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xcb.h:153
      pad : aliased xcb_raw_generic_event_t_array1650;  -- /usr/include/xcb/xcb.h:154
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xcb.h:155

  --*< Padding  
  --*< Sequence number  
  --*< Padding  
  --*
  -- * @brief GE event
  -- *
  -- * An event as sent by the XGE extension. The length field specifies the
  -- * number of 4-byte blocks trailing the struct.
  -- *
  -- * @deprecated Since some fields in this struct have unfortunate names, it is
  -- * recommended to use xcb_ge_generic_event_t instead.
  --  

  --*< Type of the response  
   --  skipped anonymous struct anon_32

   type xcb_ge_event_t_array1657 is array (0 .. 4) of aliased bits_stdint_uintn_h.uint32_t;
   type xcb_ge_event_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xcb.h:167
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xcb.h:168
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xcb.h:169
      length : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xcb.h:170
      event_type : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xcb.h:171
      pad1 : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xcb.h:172
      pad : aliased xcb_ge_event_t_array1657;  -- /usr/include/xcb/xcb.h:173
      full_sequence : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xcb.h:174
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xcb.h:175

  --*< Padding  
  --*< Sequence number  
  --*< Padding  
  --*< full sequence  
  --*
  -- * @brief Generic error.
  -- *
  -- * A generic error structure.
  --  

  --*< Type of the response  
   --  skipped anonymous struct anon_33

   type xcb_generic_error_t_array1657 is array (0 .. 4) of aliased bits_stdint_uintn_h.uint32_t;
   type xcb_generic_error_t is record
      response_type : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xcb.h:183
      error_code : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xcb.h:184
      sequence : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xcb.h:185
      resource_id : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xcb.h:186
      minor_code : aliased bits_stdint_uintn_h.uint16_t;  -- /usr/include/xcb/xcb.h:187
      major_code : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xcb.h:188
      pad0 : aliased bits_stdint_uintn_h.uint8_t;  -- /usr/include/xcb/xcb.h:189
      pad : aliased xcb_generic_error_t_array1657;  -- /usr/include/xcb/xcb.h:190
      full_sequence : aliased bits_stdint_uintn_h.uint32_t;  -- /usr/include/xcb/xcb.h:191
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xcb.h:192

  --*< Error code  
  --*< Sequence number  
  --* < Resource ID for requests with side effects only  
  --* < Minor opcode of the failed request  
  --* < Major opcode of the failed request  
  --*< Padding  
  --*< full sequence  
  --*
  -- * @brief Generic cookie.
  -- *
  -- * A generic cookie structure.
  --  

  --*< Sequence number  
  -- * Copyright (C) 2001-2006 Bart Massey, Jamey Sharp, and Josh Triplett.
  -- * All Rights Reserved.
  -- *
  -- * Permission is hereby granted, free of charge, to any person obtaining a
  -- * copy of this software and associated documentation files (the "Software"),
  -- * to deal in the Software without restriction, including without limitation
  -- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
  -- * and/or sell copies of the Software, and to permit persons to whom the
  -- * Software is furnished to do so, subject to the following conditions:
  -- *
  -- * The above copyright notice and this permission notice shall be included in
  -- * all copies or substantial portions of the Software.
  -- *
  -- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
  -- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
  -- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
  -- * AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
  -- * ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
  -- * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
  -- *
  -- * Except as contained in this notice, the names of the authors or their
  -- * institutions shall not be used in advertising or otherwise to promote the
  -- * sale, use or other dealings in this Software without prior written
  -- * authorization from the authors.
  --  

   --  skipped anonymous struct anon_34

   type xcb_void_cookie_t is record
      sequence : aliased unsigned;  -- /usr/include/xcb/xcb.h:200
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xcb.h:201

  --* XCB_NONE is the universal null resource or null atom parameter value for many core X requests  
  --* XCB_COPY_FROM_PARENT can be used for many xcb_create_window parameters  
  --* XCB_CURRENT_TIME can be used in most requests that take an xcb_timestamp_t  
  --* XCB_NO_SYMBOL fills in unused entries in xcb_keysym_t tables  
  -- xcb_auth.c  
  --*
  -- * @brief Container for authorization information.
  -- *
  -- * A container for authorization information to be sent to the X server.
  --  

  --*< Length of the string name (as returned by strlen).  
   type xcb_auth_info_t is record
      namelen : aliased int;  -- /usr/include/xcb/xcb.h:229
      name : Interfaces.C.Strings.chars_ptr;  -- /usr/include/xcb/xcb.h:230
      datalen : aliased int;  -- /usr/include/xcb/xcb.h:231
      data : Interfaces.C.Strings.chars_ptr;  -- /usr/include/xcb/xcb.h:232
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/xcb/xcb.h:228

  --*< String containing the authentication protocol name, such as "MIT-MAGIC-COOKIE-1" or "XDM-AUTHORIZATION-1".  
  --*< Length of the data member.  
  --*< Data interpreted in a protocol-specific manner.  
  -- xcb_out.c  
  --*
  -- * @brief Forces any buffered output to be written to the server.
  -- * @param c The connection to the X server.
  -- * @return > @c 0 on success, <= @c 0 otherwise.
  -- *
  -- * Forces any buffered output to be written to the server. Blocks
  -- * until the write is complete.
  --  

   function xcb_flush (c : access xcb_connection_t) return int  -- /usr/include/xcb/xcb.h:246
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_flush";

  --*
  -- * @brief Returns the maximum request length that this server accepts.
  -- * @param c The connection to the X server.
  -- * @return The maximum request length field.
  -- *
  -- * In the absence of the BIG-REQUESTS extension, returns the
  -- * maximum request length field from the connection setup data, which
  -- * may be as much as 65535. If the server supports BIG-REQUESTS, then
  -- * the maximum request length field from the reply to the
  -- * BigRequestsEnable request will be returned instead.
  -- *
  -- * Note that this length is measured in four-byte units, making the
  -- * theoretical maximum lengths roughly 256kB without BIG-REQUESTS and
  -- * 16GB with.
  --  

   function xcb_get_maximum_request_length (c : access xcb_connection_t) return bits_stdint_uintn_h.uint32_t  -- /usr/include/xcb/xcb.h:263
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_get_maximum_request_length";

  --*
  -- * @brief Prefetch the maximum request length without blocking.
  -- * @param c The connection to the X server.
  -- *
  -- * Without blocking, does as much work as possible toward computing
  -- * the maximum request length accepted by the X server.
  -- *
  -- * Invoking this function may cause a call to xcb_big_requests_enable,
  -- * but will not block waiting for the reply.
  -- * xcb_get_maximum_request_length will return the prefetched data
  -- * after possibly blocking while the reply is retrieved.
  -- *
  -- * Note that in order for this function to be fully non-blocking, the
  -- * application must previously have called
  -- * xcb_prefetch_extension_data(c, &xcb_big_requests_id) and the reply
  -- * must have already arrived.
  --  

   procedure xcb_prefetch_maximum_request_length (c : access xcb_connection_t)  -- /usr/include/xcb/xcb.h:282
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_prefetch_maximum_request_length";

  -- xcb_in.c  
  --*
  -- * @brief Returns the next event or error from the server.
  -- * @param c The connection to the X server.
  -- * @return The next event from the server.
  -- *
  -- * Returns the next event or error from the server, or returns null in
  -- * the event of an I/O error. Blocks until either an event or error
  -- * arrive, or an I/O error occurs.
  --  

   function xcb_wait_for_event (c : access xcb_connection_t) return access xcb_generic_event_t  -- /usr/include/xcb/xcb.h:296
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_wait_for_event";

  --*
  -- * @brief Returns the next event or error from the server.
  -- * @param c The connection to the X server.
  -- * @return The next event from the server.
  -- *
  -- * Returns the next event or error from the server, if one is
  -- * available, or returns @c NULL otherwise. If no event is available, that
  -- * might be because an I/O error like connection close occurred while
  -- * attempting to read the next event, in which case the connection is
  -- * shut down when this function returns.
  --  

   function xcb_poll_for_event (c : access xcb_connection_t) return access xcb_generic_event_t  -- /usr/include/xcb/xcb.h:309
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_poll_for_event";

  --*
  -- * @brief Returns the next event without reading from the connection.
  -- * @param c The connection to the X server.
  -- * @return The next already queued event from the server.
  -- *
  -- * This is a version of xcb_poll_for_event that only examines the
  -- * event queue for new events. The function doesn't try to read new
  -- * events from the connection if no queued events are found.
  -- *
  -- * This function is useful for callers that know in advance that all
  -- * interesting events have already been read from the connection. For
  -- * example, callers might use xcb_wait_for_reply and be interested
  -- * only of events that preceded a specific reply.
  --  

   function xcb_poll_for_queued_event (c : access xcb_connection_t) return access xcb_generic_event_t  -- /usr/include/xcb/xcb.h:325
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_poll_for_queued_event";

   type xcb_special_event is null record;   -- incomplete struct

   subtype xcb_special_event_t is xcb_special_event;  -- /usr/include/xcb/xcb.h:327

  --*
  -- * @brief Returns the next event from a special queue
  --  

   function xcb_poll_for_special_event (c : access xcb_connection_t; se : access xcb_special_event_t) return access xcb_generic_event_t  -- /usr/include/xcb/xcb.h:332
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_poll_for_special_event";

  --*
  -- * @brief Returns the next event from a special queue, blocking until one arrives
  --  

   function xcb_wait_for_special_event (c : access xcb_connection_t; se : access xcb_special_event_t) return access xcb_generic_event_t  -- /usr/include/xcb/xcb.h:338
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_wait_for_special_event";

  --*
  -- * @typedef typedef struct xcb_extension_t xcb_extension_t
  --  

  --*< Opaque structure used as key for xcb_get_extension_data_t.  
   type xcb_extension_t is null record;   -- incomplete struct

  --*
  -- * @brief Listen for a special event
  --  

   function xcb_register_for_special_xge
     (c : access xcb_connection_t;
      ext : access xcb_extension_t;
      eid : bits_stdint_uintn_h.uint32_t;
      stamp : access bits_stdint_uintn_h.uint32_t) return access xcb_special_event_t  -- /usr/include/xcb/xcb.h:348
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_register_for_special_xge";

  --*
  -- * @brief Stop listening for a special event
  --  

   procedure xcb_unregister_for_special_event (c : access xcb_connection_t; se : access xcb_special_event_t)  -- /usr/include/xcb/xcb.h:356
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_unregister_for_special_event";

  --*
  -- * @brief Return the error for a request, or NULL if none can ever arrive.
  -- * @param c The connection to the X server.
  -- * @param cookie The request cookie.
  -- * @return The error for the request, or NULL if none can ever arrive.
  -- *
  -- * The xcb_void_cookie_t cookie supplied to this function must have resulted
  -- * from a call to xcb_[request_name]_checked().  This function will block
  -- * until one of two conditions happens.  If an error is received, it will be
  -- * returned.  If a reply to a subsequent request has already arrived, no error
  -- * can arrive for this request, so this function will return NULL.
  -- *
  -- * Note that this function will perform a sync if needed to ensure that the
  -- * sequence number will advance beyond that provided in cookie; this is a
  -- * convenience to avoid races in determining whether the sync is needed.
  --  

   function xcb_request_check (c : access xcb_connection_t; cookie : xcb_void_cookie_t) return access xcb_generic_error_t  -- /usr/include/xcb/xcb.h:375
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_request_check";

  --*
  -- * @brief Discards the reply for a request.
  -- * @param c The connection to the X server.
  -- * @param sequence The request sequence number from a cookie.
  -- *
  -- * Discards the reply for a request. Additionally, any error generated
  -- * by the request is also discarded (unless it was an _unchecked request
  -- * and the error has already arrived).
  -- *
  -- * This function will not block even if the reply is not yet available.
  -- *
  -- * Note that the sequence really does have to come from an xcb cookie;
  -- * this function is not designed to operate on socket-handoff replies.
  --  

   procedure xcb_discard_reply (c : access xcb_connection_t; sequence : unsigned)  -- /usr/include/xcb/xcb.h:391
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_discard_reply";

  --*
  -- * @brief Discards the reply for a request, given by a 64bit sequence number
  -- * @param c The connection to the X server.
  -- * @param sequence 64-bit sequence number as returned by xcb_send_request64().
  -- *
  -- * Discards the reply for a request. Additionally, any error generated
  -- * by the request is also discarded (unless it was an _unchecked request
  -- * and the error has already arrived).
  -- *
  -- * This function will not block even if the reply is not yet available.
  -- *
  -- * Note that the sequence really does have to come from xcb_send_request64();
  -- * the cookie sequence number is defined as "unsigned" int and therefore
  -- * not 64-bit on all platforms.
  -- * This function is not designed to operate on socket-handoff replies.
  -- *
  -- * Unlike its xcb_discard_reply() counterpart, the given sequence number is not
  -- * automatically "widened" to 64-bit.
  --  

   procedure xcb_discard_reply64 (c : access xcb_connection_t; sequence : bits_stdint_uintn_h.uint64_t)  -- /usr/include/xcb/xcb.h:412
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_discard_reply64";

  -- xcb_ext.c  
  --*
  -- * @brief Caches reply information from QueryExtension requests.
  -- * @param c The connection.
  -- * @param ext The extension data.
  -- * @return A pointer to the xcb_query_extension_reply_t for the extension.
  -- *
  -- * This function is the primary interface to the "extension cache",
  -- * which caches reply information from QueryExtension
  -- * requests. Invoking this function may cause a call to
  -- * xcb_query_extension to retrieve extension information from the
  -- * server, and may block until extension data is received from the
  -- * server.
  -- *
  -- * The result must not be freed. This storage is managed by the cache
  -- * itself.
  --  

   function xcb_get_extension_data (c : access xcb_connection_t; ext : access xcb_extension_t) return access constant xproto.xcb_query_extension_reply_t  -- /usr/include/xcb/xcb.h:432
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_get_extension_data";

  --*
  -- * @brief Prefetch of extension data into the extension cache
  -- * @param c The connection.
  -- * @param ext The extension data.
  -- *
  -- * This function allows a "prefetch" of extension data into the
  -- * extension cache. Invoking the function may cause a call to
  -- * xcb_query_extension, but will not block waiting for the
  -- * reply. xcb_get_extension_data will return the prefetched data after
  -- * possibly blocking while it is retrieved.
  --  

   procedure xcb_prefetch_extension_data (c : access xcb_connection_t; ext : access xcb_extension_t)  -- /usr/include/xcb/xcb.h:445
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_prefetch_extension_data";

  -- xcb_conn.c  
  --*
  -- * @brief Access the data returned by the server.
  -- * @param c The connection.
  -- * @return A pointer to an xcb_setup_t structure.
  -- *
  -- * Accessor for the data returned by the server when the xcb_connection_t
  -- * was initialized. This data includes
  -- * - the server's required format for images,
  -- * - a list of available visuals,
  -- * - a list of available screens,
  -- * - the server's maximum request length (in the absence of the
  -- * BIG-REQUESTS extension),
  -- * - and other assorted information.
  -- *
  -- * See the X protocol specification for more details.
  -- *
  -- * The result must not be freed.
  --  

   function xcb_get_setup (c : access xcb_connection_t) return access constant xproto.xcb_setup_t  -- /usr/include/xcb/xcb.h:468
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_get_setup";

  --*
  -- * @brief Access the file descriptor of the connection.
  -- * @param c The connection.
  -- * @return The file descriptor.
  -- *
  -- * Accessor for the file descriptor that was passed to the
  -- * xcb_connect_to_fd call that returned @p c.
  --  

   function xcb_get_file_descriptor (c : access xcb_connection_t) return int  -- /usr/include/xcb/xcb.h:478
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_get_file_descriptor";

  --*
  -- * @brief Test whether the connection has shut down due to a fatal error.
  -- * @param c The connection.
  -- * @return > 0 if the connection is in an error state; 0 otherwise.
  -- *
  -- * Some errors that occur in the context of an xcb_connection_t
  -- * are unrecoverable. When such an error occurs, the
  -- * connection is shut down and further operations on the
  -- * xcb_connection_t have no effect, but memory will not be freed until
  -- * xcb_disconnect() is called on the xcb_connection_t.
  -- *
  -- * @return XCB_CONN_ERROR, because of socket errors, pipe errors or other stream errors.
  -- * @return XCB_CONN_CLOSED_EXT_NOTSUPPORTED, when extension not supported.
  -- * @return XCB_CONN_CLOSED_MEM_INSUFFICIENT, when memory not available.
  -- * @return XCB_CONN_CLOSED_REQ_LEN_EXCEED, exceeding request length that server accepts.
  -- * @return XCB_CONN_CLOSED_PARSE_ERR, error during parsing display string.
  -- * @return XCB_CONN_CLOSED_INVALID_SCREEN, because the server does not have a screen matching the display.
  --  

   function xcb_connection_has_error (c : access xcb_connection_t) return int  -- /usr/include/xcb/xcb.h:498
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_connection_has_error";

  --*
  -- * @brief Connects to the X server.
  -- * @param fd The file descriptor.
  -- * @param auth_info Authentication data.
  -- * @return A newly allocated xcb_connection_t structure.
  -- *
  -- * Connects to an X server, given the open socket @p fd and the
  -- * xcb_auth_info_t @p auth_info. The file descriptor @p fd is
  -- * bidirectionally connected to an X server. If the connection
  -- * should be unauthenticated, @p auth_info must be @c
  -- * NULL.
  -- *
  -- * Always returns a non-NULL pointer to a xcb_connection_t, even on failure.
  -- * Callers need to use xcb_connection_has_error() to check for failure.
  -- * When finished, use xcb_disconnect() to close the connection and free
  -- * the structure.
  --  

   function xcb_connect_to_fd (fd : int; auth_info : access xcb_auth_info_t) return access xcb_connection_t  -- /usr/include/xcb/xcb.h:517
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_connect_to_fd";

  --*
  -- * @brief Closes the connection.
  -- * @param c The connection.
  -- *
  -- * Closes the file descriptor and frees all memory associated with the
  -- * connection @c c. If @p c is @c NULL, nothing is done.
  --  

   procedure xcb_disconnect (c : access xcb_connection_t)  -- /usr/include/xcb/xcb.h:526
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_disconnect";

  -- xcb_util.c  
  --*
  -- * @brief Parses a display string name in the form documented by X(7x).
  -- * @param name The name of the display.
  -- * @param host A pointer to a malloc'd copy of the hostname.
  -- * @param display A pointer to the display number.
  -- * @param screen A pointer to the screen number.
  -- * @return 0 on failure, non 0 otherwise.
  -- *
  -- * Parses the display string name @p display_name in the form
  -- * documented by X(7x). Has no side effects on failure. If
  -- * @p displayname is @c NULL or empty, it uses the environment
  -- * variable DISPLAY. @p hostp is a pointer to a newly allocated string
  -- * that contain the host name. @p displayp is set to the display
  -- * number and @p screenp to the preferred screen number. @p screenp
  -- * can be @c NULL. If @p displayname does not contain a screen number,
  -- * it is set to @c 0.
  --  

   function xcb_parse_display
     (name : Interfaces.C.Strings.chars_ptr;
      host : System.Address;
      display : access int;
      screen : access int) return int  -- /usr/include/xcb/xcb.h:548
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_parse_display";

  --*
  -- * @brief Connects to the X server.
  -- * @param displayname The name of the display.
  -- * @param screenp A pointer to a preferred screen number.
  -- * @return A newly allocated xcb_connection_t structure.
  -- *
  -- * Connects to the X server specified by @p displayname. If @p
  -- * displayname is @c NULL, uses the value of the DISPLAY environment
  -- * variable. If a particular screen on that server is preferred, the
  -- * int pointed to by @p screenp (if not @c NULL) will be set to that
  -- * screen; otherwise the screen will be set to 0.
  -- *
  -- * Always returns a non-NULL pointer to a xcb_connection_t, even on failure.
  -- * Callers need to use xcb_connection_has_error() to check for failure.
  -- * When finished, use xcb_disconnect() to close the connection and free
  -- * the structure.
  --  

   function xcb_connect (displayname : Interfaces.C.Strings.chars_ptr; screenp : access int) return access xcb_connection_t  -- /usr/include/xcb/xcb.h:567
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_connect";

  --*
  -- * @brief Connects to the X server, using an authorization information.
  -- * @param display The name of the display.
  -- * @param auth The authorization information.
  -- * @param screen A pointer to a preferred screen number.
  -- * @return A newly allocated xcb_connection_t structure.
  -- *
  -- * Connects to the X server specified by @p displayname, using the
  -- * authorization @p auth. If a particular screen on that server is
  -- * preferred, the int pointed to by @p screenp (if not @c NULL) will
  -- * be set to that screen; otherwise @p screenp will be set to 0.
  -- *
  -- * Always returns a non-NULL pointer to a xcb_connection_t, even on failure.
  -- * Callers need to use xcb_connection_has_error() to check for failure.
  -- * When finished, use xcb_disconnect() to close the connection and free
  -- * the structure.
  --  

   function xcb_connect_to_display_with_auth_info
     (display : Interfaces.C.Strings.chars_ptr;
      auth : access xcb_auth_info_t;
      screen : access int) return access xcb_connection_t  -- /usr/include/xcb/xcb.h:586
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_connect_to_display_with_auth_info";

  -- xcb_xid.c  
  --*
  -- * @brief Allocates an XID for a new object.
  -- * @param c The connection.
  -- * @return A newly allocated XID.
  -- *
  -- * Allocates an XID for a new object. Typically used just prior to
  -- * various object creation functions, such as xcb_create_window.
  --  

   function xcb_generate_id (c : access xcb_connection_t) return bits_stdint_uintn_h.uint32_t  -- /usr/include/xcb/xcb.h:599
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_generate_id";

  --*
  -- * @brief Obtain number of bytes read from the connection.
  -- * @param c The connection
  -- * @return Number of bytes read from the server.
  -- *
  -- * Returns cumulative number of bytes received from the connection.
  -- *
  -- * This retrieves the total number of bytes read from this connection,
  -- * to be used for diagnostic/monitoring/informative purposes.
  --  

   function xcb_total_read (c : access xcb_connection_t) return bits_stdint_uintn_h.uint64_t  -- /usr/include/xcb/xcb.h:614
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_total_read";

  --*
  -- *
  -- * @brief Obtain number of bytes written to the connection.
  -- * @param c The connection
  -- * @return Number of bytes written to the server.
  -- *
  -- * Returns cumulative number of bytes sent to the connection.
  -- *
  -- * This retrieves the total number of bytes written to this connection,
  -- * to be used for diagnostic/monitoring/informative purposes.
  --  

   function xcb_total_written (c : access xcb_connection_t) return bits_stdint_uintn_h.uint64_t  -- /usr/include/xcb/xcb.h:629
   with Import => True, 
        Convention => C, 
        External_Name => "xcb_total_written";

  --*
  -- * @}
  --  

end xcb;
