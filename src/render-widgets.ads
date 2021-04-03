package Render.Widgets is
    ---------------------------------------------------------------------------
    -- drawCircle - a filled in circle.
    ---------------------------------------------------------------------------
    procedure drawCircle (x       : Float;
                          y       : Float;
                          radius  : Float;
                          r       : Float;
                          g       : Float;
                          b       : Float;
                          a       : Float;
                          windowW : Float;
                          windowH : Float);

    ---------------------------------------------------------------------------
    -- drawLine
    ---------------------------------------------------------------------------
    procedure drawLine (fromX       : Float;
                        fromY       : Float;
                        toX         : Float;
                        toY         : Float;
                        width       : Float;
                        r           : Float;
                        g           : Float;
                        b           : Float;
                        a           : Float;
                        windowW     : Float;
                        windowH     : Float;
                        antiAliased : Boolean := True);

end Render.Widgets;
