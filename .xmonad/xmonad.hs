module Main where
import XMonad
--------------------------------------------------------------------------------
import           Data.Map                    (Map)
import qualified Data.Map                    as M
import           Data.Monoid                 (appEndo)


--------------------------------------------------------------------------------
--import           XMonad
import           XMonad.Actions.CycleWS      (nextWS, prevWS, shiftToNext,
                                              shiftToPrev)
import           XMonad.Hooks.EwmhDesktops   (ewmh)
import           XMonad.Hooks.ManageDocks    (ToggleStruts (..), avoidStruts,
                                              manageDocks)
import           XMonad.Hooks.ManageHelpers  (doFullFloat, doRectFloat)
import           XMonad.Hooks.DynamicLog     (xmobar)
import           XMonad.Layout.Circle        (Circle (..))
import           XMonad.Layout.NoBorders     (smartBorders)
import           XMonad.Layout.PerWorkspace  (onWorkspace)
import           XMonad.Layout.SimplestFloat (simplestFloat)
import           XMonad.StackSet             (RationalRect (..), currentTag)
import           XMonad.Prompt               (defaultXPConfig)
import           XMonad.Prompt.Shell         (shellPrompt)
import System.Exit
import XMonad.Util.Run (safeSpawn)

import XMonad.Layout
import XMonad.Layout.NoBorders
import XMonad.Layout.ResizableTile
import XMonad.Layout.TwoPane
import XMonad.Layout.Combo
import XMonad.Layout.Tabbed
import qualified XMonad.StackSet as W
import XMonad.Layout.TabBarDecoration
--------------------------------------------------------------------------------
--My additional imports
--import XMonad.Util.EZConfig(additionalKeys, additionalKeysP)
import XMonad.Util.EZConfig
import Graphics.X11.ExtraTypes.XF86
import XMonad.Actions.CycleWS
import XMonad.Util.Paste
----------

main :: IO ()
--main = do
main = xmonad =<< xmobar myConfig
  where
    myConfig = ewmh $ defaultConfig
  --xmonad $ defaultConfig
        { terminal    = myTerminal
        , modMask     = myModMask
        , borderWidth = myBorderWidth
        , normalBorderColor  = "#002b36"
        , focusedBorderColor = "#688cb3"
        , keys               = \c -> myKeys c `M.union` keys defaultConfig c
        , focusFollowsMouse  = True
        , layoutHook         = avoidStruts $ myLayout
        --, layoutHook = avoidStruts  $  layoutHook defaultConfig
        }

myWorkspaces = ["1","2","3","4","5","6","7","8","9"]
--myTerminal    = "urxvt"
--myTerminal    = "alacritty"
myTerminal    = "~/bin/st-my-prefs"
myModMask     = mod4Mask -- Win key or Super_L
myBorderWidth = 1
-- | Layout hook
--myLayout = avoidStruts  $ (tiled |||  reflectTiled ||| Mirror tiled ||| Grid ||| Full)
--myLayout = avoidStruts  $ (tiled |||  Mirror tiled ||| Full)
--myLayout = layoutHook defaultConfig
myLayout = smartBorders $ ((layoutHook defaultConfig) 
    ||| TwoPane (3/100) (1/2))
    ||| tabbed shrinkText tabConfig
    |||combineTwo (TwoPane 0.03 0.5) (tabbed shrinkText tabConfig) (tabbed shrinkText tabConfig)
--    |||combineTwo (TwoPane 0.03 0.5) (simpleTabBar $ Full) (simpleTabBar $  simpleTabbed)
  where
    tiled = ResizableTall nmaster delta ratio []
    nmaster = 1
    delta = 3/100
    ratio = 1/2
    tabConfig = defaultTheme

--------------------------------------------------------------------------------
-- A list of custom keys
myKeys :: XConfig Layout -> Map (ButtonMask, KeySym) (X ())
myKeys (XConfig {modMask = myModMask}) = M.fromList $
    [ -- Some programs
      ((myModMask, xK_F1), spawn "pactl set-sink-mute @DEFAULT_SINK@ toggle")
      --((myModMask, xK_F1), spawn "~/bin/myxkeyboardsetting.sh")
    --, ((myModMask, xK_F2), spawn "termite")
    , ((myModMask, xK_F2), spawn "pactl set-sink-volume @DEFAULT_SINK@ -1.5%")
    --, ((myModMask, xK_F3), spawn "st-my-prefs")
    , ((myModMask, xK_F3), spawn "pactl set-sink-volume @DEFAULT_SINK@ +1.5%")
    --, ((myModMask, xK_F4), spawn "urxvt")
    , ((myModMask, xK_F4), spawn "pactl set-source-mute @DEFAULT_SOURCE@ toggle")
    --, ((myModMask, xK_F5), spawn "alacritty -v")
    , ((myModMask, xK_F5), spawn "lux -s 5%")    
    , ((myModMask, xK_F6), spawn "lux -a 5%")    
    , ((myModMask, xK_F11), spawn "flameshot")
--    , ((myModMask, xK_F12), spawn "xfce4-screenshooter")
--    , ((myModMask, xK_F12), spawn "~/bin/myxkeyboardsetting.sh")
--    , ((myModMask, xK_F12), spawn "sudo pm-suspend")
    , ((myModMask, xK_F12), spawn "systemctl suspend")

      -- Logout
    -- , ((myModMask .|. shiftMask, xK_q), spawn "gnome-session-quit")
    --, ((myModMask .|. shiftMask, xK_q), spawn "sudo pkill -KILL Xorg")
    --, ((myModMask .|. shiftMask, xK_q     ), io (exitWith ExitSuccess))
    --, ((myModMask .|. shiftMask, xK_l), spawn "xscreensaver-command --lock")

      -- launcher keys
    , ((myModMask, xK_p), spawn "dmenu_run")

      -- Toggle struts
    , ((myModMask, xK_a), sendMessage ToggleStruts)

      -- Full float
    , ((myModMask, xK_f), fullFloatFocused)

      -- Centered rectangle float
--    , ((myModMask, xK_r), rectFloatFocused)
    
    -- Push window back into tiling.
    , ((myModMask, xK_t), withFocused $ windows . W.sink)


      -- Shrik and expand
    , ((myModMask, xK_Right), sendMessage Expand)
    , ((myModMask, xK_Left),  sendMessage Shrink)
    
    -- swapping
    , ((myModMask .|. shiftMask,  xK_m   ), windows W.swapMaster)
--    , ((myModMask .|. shiftMask,  xK_s   ), sendMessage SwapWindow)
--    , ((myModMask .|. shiftMask,  xK_s   ), sendMessage $ SwapWindow)
    , ((myModMask .|. shiftMask,  xK_Down        ), windows W.swapDown)
    , ((myModMask .|. shiftMask,  xK_Up        ), windows W.swapUp)
    --screen swapping
    , ((myModMask .|. mod1Mask, xK_o), swapNextScreen)
    , ((myModMask .|. shiftMask, xK_o), shiftNextScreen)

--  trying to rebind page up/down
    --, ((0, 0x1008FF78), )
    --, ((0, 0x1008FF79), )
      -- XF86AudioLowerVolume
--    , ((0, 0x1008ff11), spawn "amixer set Master 10%-")
    , ((0, 0x1008FF11), spawn "pactl set-sink-volume @DEFAULT_SINK@ -1.5%")
      -- XF86AudioRaiseVolume
--    , ((0, 0x1008ff13), spawn "amixer set Master 10%+")
    , ((0, 0x1008FF13), spawn "pactl set-sink-volume @DEFAULT_SINK@ +1.5%")
      -- XF86AudioMute
    , ((0, 0x1008ff12), spawn "amixer set Master toggle")
      -- XF86AudioNext
    , ((0, 0x1008ff17), spawn "rhythmbox-client --next")
      -- XF86AudioPrev
    , ((0, 0x1008ff16), spawn "rhythmbox-client --previous")
      -- XF86AudioPlay
    , ((0, 0x1008ff14), spawn "rhythmbox-client --play-pause")
      -- XF86AudioStop
    , ((0, 0x1008ff15), spawn "rhythmbox-client --stop")
    --trying to define screen brightness and volume keys
    , ((0, 0x1008FF02), spawn "lux -a 5%")    
    , ((0, 0x1008FF03), spawn "lux -s 5%")    

    --paste from Primary(=selection) and xClipboard
    , ((myModMask, xK_Insert), pasteSelection)
    --, ((mod1Mask, xK_Insert), pasteSelection)
    --, ((0, xK_Insert), spawn "xsel | xvkbd -xsendevent -file -")
    --, ((0, xK_Insert), spawn "xdotool type $(xsel -o)")
    ---, ((shiftMask, xK_Insert), spawn "xsel -b | xvkbd -xsendevent -file -")
    --, ((shiftMask, xK_Insert), spawn "xdotool type $(xsel -b -o)")
    --copy selection to xclipboard
    ---, ((controlMask, xK_Insert), spawn "xsel -o | xsel -b -i")
    ]
  where
    -- Function to fullFloat a window
    fullFloatFocused = withFocused $ \f -> windows =<< appEndo `fmap` runQuery
                          doFullFloat f

    -- Function to rectFloat a window
    rectFloatFocused = withFocused $ \f -> windows =<< appEndo `fmap` runQuery
                          (doRectFloat $ RationalRect 0.02 0.05 0.96 0.9) f
