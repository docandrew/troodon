with xcb; use xcb;

package Taskbar is

    ---------------------------------------------------------------------------
    -- start
    -- Initialize and start the Taskbar. This component runs as a separate Ada
    -- task with it's own connection to the X Server.
    ---------------------------------------------------------------------------
    procedure start;

    ---------------------------------------------------------------------------
    -- stop
    -- Shutdown the taskbar.
    ---------------------------------------------------------------------------
    procedure stop (c : access xcb_connection_t);

    task Taskbar is
        entry StartTask;
    end Taskbar;

end Taskbar;