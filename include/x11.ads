pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;

-- Troodon: renamed this to X11 to deconflict with the use of 'x' as coordinate
package X11 is

   X_PROTOCOL : constant := 11;  --  /usr/include/X11/X.h:53
   X_PROTOCOL_REVISION : constant := 0;  --  /usr/include/X11/X.h:54

   None : constant := 0;  --  /usr/include/X11/X.h:115

   ParentRelative : constant := 1;  --  /usr/include/X11/X.h:118

   CopyFromParent : constant := 0;  --  /usr/include/X11/X.h:121

   PointerWindow : constant := 0;  --  /usr/include/X11/X.h:126
   InputFocus : constant := 1;  --  /usr/include/X11/X.h:127

   PointerRoot : constant := 1;  --  /usr/include/X11/X.h:129

   AnyPropertyType : constant := 0;  --  /usr/include/X11/X.h:131

   AnyKey : constant := 0;  --  /usr/include/X11/X.h:133

   AnyButton : constant := 0;  --  /usr/include/X11/X.h:135

   AllTemporary : constant := 0;  --  /usr/include/X11/X.h:137

   CurrentTime : constant := 0;  --  /usr/include/X11/X.h:139

   NoSymbol : constant := 0;  --  /usr/include/X11/X.h:141

   NoEventMask : constant := 0;  --  /usr/include/X11/X.h:150
   KeyPressMask : constant := (2**0);  --  /usr/include/X11/X.h:151
   KeyReleaseMask : constant := (2**1);  --  /usr/include/X11/X.h:152
   ButtonPressMask : constant := (2**2);  --  /usr/include/X11/X.h:153
   ButtonReleaseMask : constant := (2**3);  --  /usr/include/X11/X.h:154
   EnterWindowMask : constant := (2**4);  --  /usr/include/X11/X.h:155
   LeaveWindowMask : constant := (2**5);  --  /usr/include/X11/X.h:156
   PointerMotionMask : constant := (2**6);  --  /usr/include/X11/X.h:157
   PointerMotionHintMask : constant := (2**7);  --  /usr/include/X11/X.h:158
   Button1MotionMask : constant := (2**8);  --  /usr/include/X11/X.h:159
   Button2MotionMask : constant := (2**9);  --  /usr/include/X11/X.h:160
   Button3MotionMask : constant := (2**10);  --  /usr/include/X11/X.h:161
   Button4MotionMask : constant := (2**11);  --  /usr/include/X11/X.h:162
   Button5MotionMask : constant := (2**12);  --  /usr/include/X11/X.h:163
   ButtonMotionMask : constant := (2**13);  --  /usr/include/X11/X.h:164
   KeymapStateMask : constant := (2**14);  --  /usr/include/X11/X.h:165
   ExposureMask : constant := (2**15);  --  /usr/include/X11/X.h:166
   VisibilityChangeMask : constant := (2**16);  --  /usr/include/X11/X.h:167
   StructureNotifyMask : constant := (2**17);  --  /usr/include/X11/X.h:168
   ResizeRedirectMask : constant := (2**18);  --  /usr/include/X11/X.h:169
   SubstructureNotifyMask : constant := (2**19);  --  /usr/include/X11/X.h:170
   SubstructureRedirectMask : constant := (2**20);  --  /usr/include/X11/X.h:171
   FocusChangeMask : constant := (2**21);  --  /usr/include/X11/X.h:172
   PropertyChangeMask : constant := (2**22);  --  /usr/include/X11/X.h:173
   ColormapChangeMask : constant := (2**23);  --  /usr/include/X11/X.h:174
   OwnerGrabButtonMask : constant := (2**24);  --  /usr/include/X11/X.h:175

   KeyPress : constant := 2;  --  /usr/include/X11/X.h:181
   KeyRelease : constant := 3;  --  /usr/include/X11/X.h:182
   ButtonPress : constant := 4;  --  /usr/include/X11/X.h:183
   ButtonRelease : constant := 5;  --  /usr/include/X11/X.h:184
   MotionNotify : constant := 6;  --  /usr/include/X11/X.h:185
   EnterNotify : constant := 7;  --  /usr/include/X11/X.h:186
   LeaveNotify : constant := 8;  --  /usr/include/X11/X.h:187
   FocusIn : constant := 9;  --  /usr/include/X11/X.h:188
   FocusOut : constant := 10;  --  /usr/include/X11/X.h:189
   KeymapNotify : constant := 11;  --  /usr/include/X11/X.h:190
   Expose : constant := 12;  --  /usr/include/X11/X.h:191
   GraphicsExpose : constant := 13;  --  /usr/include/X11/X.h:192
   NoExpose : constant := 14;  --  /usr/include/X11/X.h:193
   VisibilityNotify : constant := 15;  --  /usr/include/X11/X.h:194
   CreateNotify : constant := 16;  --  /usr/include/X11/X.h:195
   DestroyNotify : constant := 17;  --  /usr/include/X11/X.h:196
   UnmapNotify : constant := 18;  --  /usr/include/X11/X.h:197
   MapNotify : constant := 19;  --  /usr/include/X11/X.h:198
   MapRequest : constant := 20;  --  /usr/include/X11/X.h:199
   ReparentNotify : constant := 21;  --  /usr/include/X11/X.h:200
   ConfigureNotify : constant := 22;  --  /usr/include/X11/X.h:201
   ConfigureRequest : constant := 23;  --  /usr/include/X11/X.h:202
   GravityNotify : constant := 24;  --  /usr/include/X11/X.h:203
   ResizeRequest : constant := 25;  --  /usr/include/X11/X.h:204
   CirculateNotify : constant := 26;  --  /usr/include/X11/X.h:205
   CirculateRequest : constant := 27;  --  /usr/include/X11/X.h:206
   PropertyNotify : constant := 28;  --  /usr/include/X11/X.h:207
   SelectionClear : constant := 29;  --  /usr/include/X11/X.h:208
   SelectionRequest : constant := 30;  --  /usr/include/X11/X.h:209
   SelectionNotify : constant := 31;  --  /usr/include/X11/X.h:210
   ColormapNotify : constant := 32;  --  /usr/include/X11/X.h:211
   ClientMessage : constant := 33;  --  /usr/include/X11/X.h:212
   MappingNotify : constant := 34;  --  /usr/include/X11/X.h:213
   GenericEvent : constant := 35;  --  /usr/include/X11/X.h:214
   LASTEvent : constant := 36;  --  /usr/include/X11/X.h:215

   ShiftMask : constant := (2**0);  --  /usr/include/X11/X.h:221
   LockMask : constant := (2**1);  --  /usr/include/X11/X.h:222
   ControlMask : constant := (2**2);  --  /usr/include/X11/X.h:223
   Mod1Mask : constant := (2**3);  --  /usr/include/X11/X.h:224
   Mod2Mask : constant := (2**4);  --  /usr/include/X11/X.h:225
   Mod3Mask : constant := (2**5);  --  /usr/include/X11/X.h:226
   Mod4Mask : constant := (2**6);  --  /usr/include/X11/X.h:227
   Mod5Mask : constant := (2**7);  --  /usr/include/X11/X.h:228

   ShiftMapIndex : constant := 0;  --  /usr/include/X11/X.h:233
   LockMapIndex : constant := 1;  --  /usr/include/X11/X.h:234
   ControlMapIndex : constant := 2;  --  /usr/include/X11/X.h:235
   Mod1MapIndex : constant := 3;  --  /usr/include/X11/X.h:236
   Mod2MapIndex : constant := 4;  --  /usr/include/X11/X.h:237
   Mod3MapIndex : constant := 5;  --  /usr/include/X11/X.h:238
   Mod4MapIndex : constant := 6;  --  /usr/include/X11/X.h:239
   Mod5MapIndex : constant := 7;  --  /usr/include/X11/X.h:240

   Button1Mask : constant := (2**8);  --  /usr/include/X11/X.h:246
   Button2Mask : constant := (2**9);  --  /usr/include/X11/X.h:247
   Button3Mask : constant := (2**10);  --  /usr/include/X11/X.h:248
   Button4Mask : constant := (2**11);  --  /usr/include/X11/X.h:249
   Button5Mask : constant := (2**12);  --  /usr/include/X11/X.h:250

   AnyModifier : constant := (2**15);  --  /usr/include/X11/X.h:252

   Button1 : constant := 1;  --  /usr/include/X11/X.h:259
   Button2 : constant := 2;  --  /usr/include/X11/X.h:260
   Button3 : constant := 3;  --  /usr/include/X11/X.h:261
   Button4 : constant := 4;  --  /usr/include/X11/X.h:262
   Button5 : constant := 5;  --  /usr/include/X11/X.h:263

   NotifyNormal : constant := 0;  --  /usr/include/X11/X.h:267
   NotifyGrab : constant := 1;  --  /usr/include/X11/X.h:268
   NotifyUngrab : constant := 2;  --  /usr/include/X11/X.h:269
   NotifyWhileGrabbed : constant := 3;  --  /usr/include/X11/X.h:270

   NotifyHint : constant := 1;  --  /usr/include/X11/X.h:272

   NotifyAncestor : constant := 0;  --  /usr/include/X11/X.h:276
   NotifyVirtual : constant := 1;  --  /usr/include/X11/X.h:277
   NotifyInferior : constant := 2;  --  /usr/include/X11/X.h:278
   NotifyNonlinear : constant := 3;  --  /usr/include/X11/X.h:279
   NotifyNonlinearVirtual : constant := 4;  --  /usr/include/X11/X.h:280
   NotifyPointer : constant := 5;  --  /usr/include/X11/X.h:281
   NotifyPointerRoot : constant := 6;  --  /usr/include/X11/X.h:282
   NotifyDetailNone : constant := 7;  --  /usr/include/X11/X.h:283

   VisibilityUnobscured : constant := 0;  --  /usr/include/X11/X.h:287
   VisibilityPartiallyObscured : constant := 1;  --  /usr/include/X11/X.h:288
   VisibilityFullyObscured : constant := 2;  --  /usr/include/X11/X.h:289

   PlaceOnTop : constant := 0;  --  /usr/include/X11/X.h:293
   PlaceOnBottom : constant := 1;  --  /usr/include/X11/X.h:294

   FamilyInternet : constant := 0;  --  /usr/include/X11/X.h:298
   FamilyDECnet : constant := 1;  --  /usr/include/X11/X.h:299
   FamilyChaos : constant := 2;  --  /usr/include/X11/X.h:300
   FamilyInternet6 : constant := 6;  --  /usr/include/X11/X.h:301

   FamilyServerInterpreted : constant := 5;  --  /usr/include/X11/X.h:304

   PropertyNewValue : constant := 0;  --  /usr/include/X11/X.h:308
   PropertyDelete : constant := 1;  --  /usr/include/X11/X.h:309

   ColormapUninstalled : constant := 0;  --  /usr/include/X11/X.h:313
   ColormapInstalled : constant := 1;  --  /usr/include/X11/X.h:314

   GrabModeSync : constant := 0;  --  /usr/include/X11/X.h:318
   GrabModeAsync : constant := 1;  --  /usr/include/X11/X.h:319

   GrabSuccess : constant := 0;  --  /usr/include/X11/X.h:323
   AlreadyGrabbed : constant := 1;  --  /usr/include/X11/X.h:324
   GrabInvalidTime : constant := 2;  --  /usr/include/X11/X.h:325
   GrabNotViewable : constant := 3;  --  /usr/include/X11/X.h:326
   GrabFrozen : constant := 4;  --  /usr/include/X11/X.h:327

   AsyncPointer : constant := 0;  --  /usr/include/X11/X.h:331
   SyncPointer : constant := 1;  --  /usr/include/X11/X.h:332
   ReplayPointer : constant := 2;  --  /usr/include/X11/X.h:333
   AsyncKeyboard : constant := 3;  --  /usr/include/X11/X.h:334
   SyncKeyboard : constant := 4;  --  /usr/include/X11/X.h:335
   ReplayKeyboard : constant := 5;  --  /usr/include/X11/X.h:336
   AsyncBoth : constant := 6;  --  /usr/include/X11/X.h:337
   SyncBoth : constant := 7;  --  /usr/include/X11/X.h:338
   --  unsupported macro: RevertToNone (int)None
   --  unsupported macro: RevertToPointerRoot (int)PointerRoot

   RevertToParent : constant := 2;  --  /usr/include/X11/X.h:344

   Success : constant := 0;  --  /usr/include/X11/X.h:350
   BadRequest : constant := 1;  --  /usr/include/X11/X.h:351
   BadValue : constant := 2;  --  /usr/include/X11/X.h:352
   BadWindow : constant := 3;  --  /usr/include/X11/X.h:353
   BadPixmap : constant := 4;  --  /usr/include/X11/X.h:354
   BadAtom : constant := 5;  --  /usr/include/X11/X.h:355
   BadCursor : constant := 6;  --  /usr/include/X11/X.h:356
   BadFont : constant := 7;  --  /usr/include/X11/X.h:357
   BadMatch : constant := 8;  --  /usr/include/X11/X.h:358
   BadDrawable : constant := 9;  --  /usr/include/X11/X.h:359
   BadAccess : constant := 10;  --  /usr/include/X11/X.h:360

   BadAlloc : constant := 11;  --  /usr/include/X11/X.h:369
   BadColor : constant := 12;  --  /usr/include/X11/X.h:370
   BadGC : constant := 13;  --  /usr/include/X11/X.h:371
   BadIDChoice : constant := 14;  --  /usr/include/X11/X.h:372
   BadName : constant := 15;  --  /usr/include/X11/X.h:373
   BadLength : constant := 16;  --  /usr/include/X11/X.h:374
   BadImplementation : constant := 17;  --  /usr/include/X11/X.h:375

   FirstExtensionError : constant := 128;  --  /usr/include/X11/X.h:377
   LastExtensionError : constant := 255;  --  /usr/include/X11/X.h:378

   InputOutput : constant := 1;  --  /usr/include/X11/X.h:387
   InputOnly : constant := 2;  --  /usr/include/X11/X.h:388

   CWBackPixmap : constant := (2**0);  --  /usr/include/X11/X.h:392
   CWBackPixel : constant := (2**1);  --  /usr/include/X11/X.h:393
   CWBorderPixmap : constant := (2**2);  --  /usr/include/X11/X.h:394
   CWBorderPixel : constant := (2**3);  --  /usr/include/X11/X.h:395
   CWBitGravity : constant := (2**4);  --  /usr/include/X11/X.h:396
   CWWinGravity : constant := (2**5);  --  /usr/include/X11/X.h:397
   CWBackingStore : constant := (2**6);  --  /usr/include/X11/X.h:398
   CWBackingPlanes : constant := (2**7);  --  /usr/include/X11/X.h:399
   CWBackingPixel : constant := (2**8);  --  /usr/include/X11/X.h:400
   CWOverrideRedirect : constant := (2**9);  --  /usr/include/X11/X.h:401
   CWSaveUnder : constant := (2**10);  --  /usr/include/X11/X.h:402
   CWEventMask : constant := (2**11);  --  /usr/include/X11/X.h:403
   CWDontPropagate : constant := (2**12);  --  /usr/include/X11/X.h:404
   CWColormap : constant := (2**13);  --  /usr/include/X11/X.h:405
   CWCursor : constant := (2**14);  --  /usr/include/X11/X.h:406

   CWX : constant := (2**0);  --  /usr/include/X11/X.h:410
   CWY : constant := (2**1);  --  /usr/include/X11/X.h:411
   CWWidth : constant := (2**2);  --  /usr/include/X11/X.h:412
   CWHeight : constant := (2**3);  --  /usr/include/X11/X.h:413
   CWBorderWidth : constant := (2**4);  --  /usr/include/X11/X.h:414
   CWSibling : constant := (2**5);  --  /usr/include/X11/X.h:415
   CWStackMode : constant := (2**6);  --  /usr/include/X11/X.h:416

   ForgetGravity : constant := 0;  --  /usr/include/X11/X.h:421
   NorthWestGravity : constant := 1;  --  /usr/include/X11/X.h:422
   NorthGravity : constant := 2;  --  /usr/include/X11/X.h:423
   NorthEastGravity : constant := 3;  --  /usr/include/X11/X.h:424
   WestGravity : constant := 4;  --  /usr/include/X11/X.h:425
   CenterGravity : constant := 5;  --  /usr/include/X11/X.h:426
   EastGravity : constant := 6;  --  /usr/include/X11/X.h:427
   SouthWestGravity : constant := 7;  --  /usr/include/X11/X.h:428
   SouthGravity : constant := 8;  --  /usr/include/X11/X.h:429
   SouthEastGravity : constant := 9;  --  /usr/include/X11/X.h:430
   StaticGravity : constant := 10;  --  /usr/include/X11/X.h:431

   UnmapGravity : constant := 0;  --  /usr/include/X11/X.h:435

   NotUseful : constant := 0;  --  /usr/include/X11/X.h:439
   WhenMapped : constant := 1;  --  /usr/include/X11/X.h:440
   Always : constant := 2;  --  /usr/include/X11/X.h:441

   IsUnmapped : constant := 0;  --  /usr/include/X11/X.h:445
   IsUnviewable : constant := 1;  --  /usr/include/X11/X.h:446
   IsViewable : constant := 2;  --  /usr/include/X11/X.h:447

   SetModeInsert : constant := 0;  --  /usr/include/X11/X.h:451
   SetModeDelete : constant := 1;  --  /usr/include/X11/X.h:452

   DestroyAll : constant := 0;  --  /usr/include/X11/X.h:456
   RetainPermanent : constant := 1;  --  /usr/include/X11/X.h:457
   RetainTemporary : constant := 2;  --  /usr/include/X11/X.h:458

   Above : constant := 0;  --  /usr/include/X11/X.h:462
   Below : constant := 1;  --  /usr/include/X11/X.h:463
   TopIf : constant := 2;  --  /usr/include/X11/X.h:464
   BottomIf : constant := 3;  --  /usr/include/X11/X.h:465
   Opposite : constant := 4;  --  /usr/include/X11/X.h:466

   RaiseLowest : constant := 0;  --  /usr/include/X11/X.h:470
   LowerHighest : constant := 1;  --  /usr/include/X11/X.h:471

   PropModeReplace : constant := 0;  --  /usr/include/X11/X.h:475
   PropModePrepend : constant := 1;  --  /usr/include/X11/X.h:476
   PropModeAppend : constant := 2;  --  /usr/include/X11/X.h:477

   GXclear : constant := 16#0#;  --  /usr/include/X11/X.h:485
   GXand : constant := 16#1#;  --  /usr/include/X11/X.h:486
   GXandReverse : constant := 16#2#;  --  /usr/include/X11/X.h:487
   GXcopy : constant := 16#3#;  --  /usr/include/X11/X.h:488
   GXandInverted : constant := 16#4#;  --  /usr/include/X11/X.h:489
   GXnoop : constant := 16#5#;  --  /usr/include/X11/X.h:490
   GXxor : constant := 16#6#;  --  /usr/include/X11/X.h:491
   GXor : constant := 16#7#;  --  /usr/include/X11/X.h:492
   GXnor : constant := 16#8#;  --  /usr/include/X11/X.h:493
   GXequiv : constant := 16#9#;  --  /usr/include/X11/X.h:494
   GXinvert : constant := 16#a#;  --  /usr/include/X11/X.h:495
   GXorReverse : constant := 16#b#;  --  /usr/include/X11/X.h:496
   GXcopyInverted : constant := 16#c#;  --  /usr/include/X11/X.h:497
   GXorInverted : constant := 16#d#;  --  /usr/include/X11/X.h:498
   GXnand : constant := 16#e#;  --  /usr/include/X11/X.h:499
   GXset : constant := 16#f#;  --  /usr/include/X11/X.h:500

   LineSolid : constant := 0;  --  /usr/include/X11/X.h:504
   LineOnOffDash : constant := 1;  --  /usr/include/X11/X.h:505
   LineDoubleDash : constant := 2;  --  /usr/include/X11/X.h:506

   CapNotLast : constant := 0;  --  /usr/include/X11/X.h:510
   CapButt : constant := 1;  --  /usr/include/X11/X.h:511
   CapRound : constant := 2;  --  /usr/include/X11/X.h:512
   CapProjecting : constant := 3;  --  /usr/include/X11/X.h:513

   JoinMiter : constant := 0;  --  /usr/include/X11/X.h:517
   JoinRound : constant := 1;  --  /usr/include/X11/X.h:518
   JoinBevel : constant := 2;  --  /usr/include/X11/X.h:519

   FillSolid : constant := 0;  --  /usr/include/X11/X.h:523
   FillTiled : constant := 1;  --  /usr/include/X11/X.h:524
   FillStippled : constant := 2;  --  /usr/include/X11/X.h:525
   FillOpaqueStippled : constant := 3;  --  /usr/include/X11/X.h:526

   EvenOddRule : constant := 0;  --  /usr/include/X11/X.h:530
   WindingRule : constant := 1;  --  /usr/include/X11/X.h:531

   ClipByChildren : constant := 0;  --  /usr/include/X11/X.h:535
   IncludeInferiors : constant := 1;  --  /usr/include/X11/X.h:536

   Unsorted : constant := 0;  --  /usr/include/X11/X.h:540
   YSorted : constant := 1;  --  /usr/include/X11/X.h:541
   YXSorted : constant := 2;  --  /usr/include/X11/X.h:542
   YXBanded : constant := 3;  --  /usr/include/X11/X.h:543

   CoordModeOrigin : constant := 0;  --  /usr/include/X11/X.h:547
   CoordModePrevious : constant := 1;  --  /usr/include/X11/X.h:548

   Complex : constant := 0;  --  /usr/include/X11/X.h:552
   Nonconvex : constant := 1;  --  /usr/include/X11/X.h:553
   Convex : constant := 2;  --  /usr/include/X11/X.h:554

   ArcChord : constant := 0;  --  /usr/include/X11/X.h:558
   ArcPieSlice : constant := 1;  --  /usr/include/X11/X.h:559

   GCFunction : constant := (2**0);  --  /usr/include/X11/X.h:564
   GCPlaneMask : constant := (2**1);  --  /usr/include/X11/X.h:565
   GCForeground : constant := (2**2);  --  /usr/include/X11/X.h:566
   GCBackground : constant := (2**3);  --  /usr/include/X11/X.h:567
   GCLineWidth : constant := (2**4);  --  /usr/include/X11/X.h:568
   GCLineStyle : constant := (2**5);  --  /usr/include/X11/X.h:569
   GCCapStyle : constant := (2**6);  --  /usr/include/X11/X.h:570
   GCJoinStyle : constant := (2**7);  --  /usr/include/X11/X.h:571
   GCFillStyle : constant := (2**8);  --  /usr/include/X11/X.h:572
   GCFillRule : constant := (2**9);  --  /usr/include/X11/X.h:573
   GCTile : constant := (2**10);  --  /usr/include/X11/X.h:574
   GCStipple : constant := (2**11);  --  /usr/include/X11/X.h:575
   GCTileStipXOrigin : constant := (2**12);  --  /usr/include/X11/X.h:576
   GCTileStipYOrigin : constant := (2**13);  --  /usr/include/X11/X.h:577
   GCFont : constant := (2**14);  --  /usr/include/X11/X.h:578
   GCSubwindowMode : constant := (2**15);  --  /usr/include/X11/X.h:579
   GCGraphicsExposures : constant := (2**16);  --  /usr/include/X11/X.h:580
   GCClipXOrigin : constant := (2**17);  --  /usr/include/X11/X.h:581
   GCClipYOrigin : constant := (2**18);  --  /usr/include/X11/X.h:582
   GCClipMask : constant := (2**19);  --  /usr/include/X11/X.h:583
   GCDashOffset : constant := (2**20);  --  /usr/include/X11/X.h:584
   GCDashList : constant := (2**21);  --  /usr/include/X11/X.h:585
   GCArcMode : constant := (2**22);  --  /usr/include/X11/X.h:586

   GCLastBit : constant := 22;  --  /usr/include/X11/X.h:588

   FontLeftToRight : constant := 0;  --  /usr/include/X11/X.h:595
   FontRightToLeft : constant := 1;  --  /usr/include/X11/X.h:596

   FontChange : constant := 255;  --  /usr/include/X11/X.h:598

   XYBitmap : constant := 0;  --  /usr/include/X11/X.h:606
   XYPixmap : constant := 1;  --  /usr/include/X11/X.h:607
   ZPixmap : constant := 2;  --  /usr/include/X11/X.h:608

   AllocNone : constant := 0;  --  /usr/include/X11/X.h:616
   AllocAll : constant := 1;  --  /usr/include/X11/X.h:617

   DoRed : constant := (2**0);  --  /usr/include/X11/X.h:622
   DoGreen : constant := (2**1);  --  /usr/include/X11/X.h:623
   DoBlue : constant := (2**2);  --  /usr/include/X11/X.h:624

   CursorShape : constant := 0;  --  /usr/include/X11/X.h:632
   TileShape : constant := 1;  --  /usr/include/X11/X.h:633
   StippleShape : constant := 2;  --  /usr/include/X11/X.h:634

   AutoRepeatModeOff : constant := 0;  --  /usr/include/X11/X.h:640
   AutoRepeatModeOn : constant := 1;  --  /usr/include/X11/X.h:641
   AutoRepeatModeDefault : constant := 2;  --  /usr/include/X11/X.h:642

   LedModeOff : constant := 0;  --  /usr/include/X11/X.h:644
   LedModeOn : constant := 1;  --  /usr/include/X11/X.h:645

   KBKeyClickPercent : constant := (2**0);  --  /usr/include/X11/X.h:649
   KBBellPercent : constant := (2**1);  --  /usr/include/X11/X.h:650
   KBBellPitch : constant := (2**2);  --  /usr/include/X11/X.h:651
   KBBellDuration : constant := (2**3);  --  /usr/include/X11/X.h:652
   KBLed : constant := (2**4);  --  /usr/include/X11/X.h:653
   KBLedMode : constant := (2**5);  --  /usr/include/X11/X.h:654
   KBKey : constant := (2**6);  --  /usr/include/X11/X.h:655
   KBAutoRepeatMode : constant := (2**7);  --  /usr/include/X11/X.h:656

   MappingSuccess : constant := 0;  --  /usr/include/X11/X.h:658
   MappingBusy : constant := 1;  --  /usr/include/X11/X.h:659
   MappingFailed : constant := 2;  --  /usr/include/X11/X.h:660

   MappingModifier : constant := 0;  --  /usr/include/X11/X.h:662
   MappingKeyboard : constant := 1;  --  /usr/include/X11/X.h:663
   MappingPointer : constant := 2;  --  /usr/include/X11/X.h:664

   DontPreferBlanking : constant := 0;  --  /usr/include/X11/X.h:670
   PreferBlanking : constant := 1;  --  /usr/include/X11/X.h:671
   DefaultBlanking : constant := 2;  --  /usr/include/X11/X.h:672

   DisableScreenSaver : constant := 0;  --  /usr/include/X11/X.h:674
   DisableScreenInterval : constant := 0;  --  /usr/include/X11/X.h:675

   DontAllowExposures : constant := 0;  --  /usr/include/X11/X.h:677
   AllowExposures : constant := 1;  --  /usr/include/X11/X.h:678
   DefaultExposures : constant := 2;  --  /usr/include/X11/X.h:679

   ScreenSaverReset : constant := 0;  --  /usr/include/X11/X.h:683
   ScreenSaverActive : constant := 1;  --  /usr/include/X11/X.h:684

   HostInsert : constant := 0;  --  /usr/include/X11/X.h:692
   HostDelete : constant := 1;  --  /usr/include/X11/X.h:693

   EnableAccess : constant := 1;  --  /usr/include/X11/X.h:697
   DisableAccess : constant := 0;  --  /usr/include/X11/X.h:698

   StaticGray : constant := 0;  --  /usr/include/X11/X.h:704
   GrayScale : constant := 1;  --  /usr/include/X11/X.h:705
   StaticColor : constant := 2;  --  /usr/include/X11/X.h:706
   PseudoColor : constant := 3;  --  /usr/include/X11/X.h:707
   TrueColor : constant := 4;  --  /usr/include/X11/X.h:708
   DirectColor : constant := 5;  --  /usr/include/X11/X.h:709

   LSBFirst : constant := 0;  --  /usr/include/X11/X.h:714
   MSBFirst : constant := 1;  --  /usr/include/X11/X.h:715

  -- Definitions for the X window system likely to be used by applications  
  --**********************************************************
  --Copyright 1987, 1998  The Open Group
  --Permission to use, copy, modify, distribute, and sell this software and its
  --documentation for any purpose is hereby granted without fee, provided that
  --the above copyright notice appear in all copies and that both that
  --copyright notice and this permission notice appear in supporting
  --documentation.
  --The above copyright notice and this permission notice shall be included in
  --all copies or substantial portions of the Software.
  --THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
  --IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
  --FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL THE
  --OPEN GROUP BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN
  --AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
  --CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
  --Except as contained in this notice, the name of The Open Group shall not be
  --used in advertising or otherwise to promote the sale, use or other dealings
  --in this Software without prior written authorization from The Open Group.
  --Copyright 1987 by Digital Equipment Corporation, Maynard, Massachusetts.
  --                        All Rights Reserved
  --Permission to use, copy, modify, and distribute this software and its
  --documentation for any purpose and without fee is hereby granted,
  --provided that the above copyright notice appear in all copies and that
  --both that copyright notice and this permission notice appear in
  --supporting documentation, and that the name of Digital not be
  --used in advertising or publicity pertaining to distribution of the
  --software without specific, written prior permission.
  --DIGITAL DISCLAIMS ALL WARRANTIES WITH REGARD TO THIS SOFTWARE, INCLUDING
  --ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS, IN NO EVENT SHALL
  --DIGITAL BE LIABLE FOR ANY SPECIAL, INDIRECT OR CONSEQUENTIAL DAMAGES OR
  --ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS,
  --WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION,
  --ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS
  --SOFTWARE.
  --***************************************************************** 

  -- Resources  
  -- * _XSERVER64 must ONLY be defined when compiling X server sources on
  -- * systems where unsigned long is not 32 bits, must NOT be used in
  -- * client or library code.
  --  

   subtype XID is unsigned_long;  -- /usr/include/X11/X.h:66

   subtype Mask is unsigned_long;  -- /usr/include/X11/X.h:70

  -- Also in Xdefs.h  
   subtype Atom is unsigned_long;  -- /usr/include/X11/X.h:74

   subtype VisualID is unsigned_long;  -- /usr/include/X11/X.h:76

   subtype Time is unsigned_long;  -- /usr/include/X11/X.h:77

   subtype Window is XID;  -- /usr/include/X11/X.h:96

   subtype Drawable is XID;  -- /usr/include/X11/X.h:97

   subtype Font is XID;  -- /usr/include/X11/X.h:100

   subtype Pixmap is XID;  -- /usr/include/X11/X.h:102

   subtype Cursor is XID;  -- /usr/include/X11/X.h:103

   subtype Colormap is XID;  -- /usr/include/X11/X.h:104

   subtype GContext is XID;  -- /usr/include/X11/X.h:105

   subtype KeySym is XID;  -- /usr/include/X11/X.h:106

   subtype KeyCode is unsigned_char;  -- /usr/include/X11/X.h:108

  --****************************************************************
  -- * RESERVED RESOURCE AND CONSTANT DEFINITIONS
  -- **************************************************************** 

  --****************************************************************
  -- * EVENT DEFINITIONS
  -- **************************************************************** 

  -- Input Event Masks. Used as event-mask window attribute and as arguments
  --   to Grab requests.  Not to be confused with event names.   

  -- Event names.  Used in "type" field in XEvent structures.  Not to be
  --confused with event masks above.  They start from 2 because 0 and 1
  --are reserved in the protocol for errors and replies.  

  -- Key masks. Used as modifiers to GrabButton and GrabKey, results of QueryPointer,
  --   state in various key-, mouse-, and button-related events.  

  -- modifier names.  Used to build a SetModifierMapping request or
  --   to read a GetModifierMapping request.  These correspond to the
  --   masks defined above.  

  -- button masks.  Used in same manner as Key masks above. Not to be confused
  --   with button names below.  

  -- button names. Used as arguments to GrabButton and as detail in ButtonPress
  --   and ButtonRelease events.  Not to be confused with button masks above.
  --   Note that 0 is already defined above as "AnyButton".   

  -- Notify modes  
  -- Notify detail  
  -- Visibility notify  
  -- Circulation request  
  -- protocol families  
  -- authentication families not tied to a specific protocol  
  -- Property notification  
  -- Color Map notification  
  -- GrabPointer, GrabButton, GrabKeyboard, GrabKey Modes  
  -- GrabPointer, GrabKeyboard reply status  
  -- AllowEvents modes  
  -- Used in SetInputFocus, GetInputFocus  
  --****************************************************************
  -- * ERROR CODES
  -- **************************************************************** 

  --****************************************************************
  -- * WINDOW DEFINITIONS
  -- **************************************************************** 

  -- Window classes used by CreateWindow  
  -- Note that CopyFromParent is already defined as 0 above  
  -- Window attributes for CreateWindow and ChangeWindowAttributes  
  -- ConfigureWindow structure  
  -- Bit Gravity  
  -- Window gravity + bit gravity above  
  -- Used in CreateWindow for backing-store hint  
  -- Used in GetWindowAttributes reply  
  -- Used in ChangeSaveSet  
  -- Used in ChangeCloseDownMode  
  -- Window stacking method (in configureWindow)  
  -- Circulation direction  
  -- Property modes  
  --****************************************************************
  -- * GRAPHICS DEFINITIONS
  -- **************************************************************** 

  -- graphics functions, as in GC.alu  
  -- LineStyle  
  -- capStyle  
  -- joinStyle  
  -- fillStyle  
  -- fillRule  
  -- subwindow mode  
  -- SetClipRectangles ordering  
  -- CoordinateMode for drawing routines  
  -- Polygon shapes  
  -- Arc modes for PolyFillArc  
  -- GC components: masks used in CreateGC, CopyGC, ChangeGC, OR'ed into
  --   GC.stateChanges  

  --****************************************************************
  -- * FONTS
  -- **************************************************************** 

  -- used in QueryFont -- draw direction  
  --****************************************************************
  -- *  IMAGING
  -- **************************************************************** 

  -- ImageFormat -- PutImage, GetImage  
  --****************************************************************
  -- *  COLOR MAP STUFF
  -- **************************************************************** 

  -- For CreateColormap  
  -- Flags used in StoreNamedColor, StoreColors  
  --****************************************************************
  -- * CURSOR STUFF
  -- **************************************************************** 

  -- QueryBestSize Class  
  --****************************************************************
  -- * KEYBOARD/POINTER STUFF
  -- **************************************************************** 

  -- masks for ChangeKeyboardControl  
  --****************************************************************
  -- * SCREEN SAVER STUFF
  -- **************************************************************** 

  -- for ForceScreenSaver  
  --****************************************************************
  -- * HOSTS AND CONNECTIONS
  -- **************************************************************** 

  -- for ChangeHosts  
  -- for ChangeAccessControl  
  -- Display classes  used in opening the connection
  -- * Note that the statically allocated ones are even numbered and the
  -- * dynamically changeable ones are odd numbered  

  -- Byte order  used in imageByteOrder and bitmapBitOrder  
end X11;
