module Main where
import XMonad
--------------------------------------------------------------------------------
import           Data.Map                    (Map)
import qualified Data.Map                    as M
import           Data.Monoid                 (appEndo)


--------------------------------------------------------------------------------
import           XMonad.Actions.CycleWS      (nextWS, prevWS, shiftToNext,
                                              shiftToPrev)
import           XMonad.Hooks.EwmhDesktops   (ewmh)
--import           XMonad.Hooks.ManageDocks    (ToggleStruts (..), avoidStruts,
--import           XMonad.Hooks.ManageDocks
--import           XMonad.Hooks.ManageHelpers  (doFullFloat, doRectFloat)
--import           XMonad.Hooks.DynamicLog     (xmobar)
import           XMonad.Layout.Circle        (Circle (..))
import           XMonad.Layout.NoBorders     (smartBorders)
import           XMonad.Layout.PerWorkspace  (onWorkspace)
import           XMonad.Layout.SimplestFloat (simplestFloat)
import           XMonad.StackSet             (RationalRect (..), currentTag)
--import           XMonad.Prompt               (defaultXPConfig)
import           XMonad.Prompt.Shell         (shellPrompt)
import System.Exit
import XMonad.Util.Run (safeSpawn)
import XMonad.Util.SpawnOnce

import XMonad.Layout
import XMonad.Layout.NoBorders
import XMonad.Layout.ResizableTile
import XMonad.Layout.TwoPane
import XMonad.Layout.TwoPanePersistent
import XMonad.Layout.Combo
import XMonad.Layout.ComboP
import XMonad.Layout.Tabbed
import XMonad.Layout.Accordion
import XMonad.Layout.Simplest
import XMonad.Layout.SimplestFloat
import XMonad.Layout.Grid
import XMonad.Layout.Spiral
import XMonad.Layout.Cross
import XMonad.Layout.Column
import XMonad.Layout.Master
import qualified XMonad.Layout.BinarySpacePartition as BSP
import qualified XMonad.StackSet as W
import XMonad.Layout.TabBarDecoration

import XMonad.Layout.WindowNavigation
import XMonad.Actions.WindowNavigation
--------------------------------------------------------------------------------
--My additional imports
--import XMonad.Util.EZConfig(additionalKeys, additionalKeysP)
import XMonad.Util.EZConfig
import XMonad.Util.Loggers
import XMonad.Util.Ungrab
import XMonad.Hooks.EwmhDesktops
import Graphics.X11.ExtraTypes.XF86
import XMonad.Actions.CycleWS
import XMonad.Util.Paste
import XMonad.Util.Themes
import XMonad.Actions.WindowMenu
import XMonad.Actions.GridSelect
import XMonad.Actions.Promote
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.StatusBar
import XMonad.Hooks.StatusBar.PP


--import XMonad.Config.Prime (Default)
--import qualified XMonad.Config.Prime as Prime
----------
  --fix java swing gui fuckup
import XMonad.Hooks.SetWMName

main :: IO ()
--main = do
main = do
    --myConfig <- (withWindowNavigation (xK_w, xK_a, xK_s, xK_d))
    --xmonad =<< xmobar myConfig
    xmonad =<< withWindowNavigation (xK_w, xK_a, xK_s, xK_d) =<< xmobar myConfig
      where
        --myConfig = docks . ewmh $ def
        myConfig = ewmhFullscreen 
                   . ewmh
                   $ def
            { terminal    = myTerminal
            , modMask     = myModMask
            , borderWidth = myBorderWidth
            , normalBorderColor  = "#002b36"
            , focusedBorderColor = "#688cb3"
            , keys               = \c -> myKeys c `M.union` keys def c
            , focusFollowsMouse  = False
            , layoutHook         = avoidStruts $ myLayout
            , manageHook         = manageHook def <+> manageDocks <+> myManageHook
            , startupHook        = myStartupHook
            }

myManageHook = composeAll
  [ className =? "Gimp" --> doFloat
  , isDialog            --> doFloat
  ]

myStartupHook = do
  --spawn "picom"
--
--  spawn "xdotool windowraise `xdotool search --all --name xmobar`"
--  spawn "xcompmgr -cfF"
----  spawnOnce "feh --bg-scale ~/Downloads/Wonder_Lake_and_Denali.jpg" 
----
  spawnOnce "feh --bg-fill ~/Downloads/Wonder_Lake_and_Denali.jpg" 
  spawnOnce "bash ~/bin/trayer_launcher.sh"
  spawnOnce "~/bin/myxkeyboardsetting.sh"
--
--  spawn "pasystray"
--for java swing gui
--
  setWMName "LG3D"
--

myWorkspaces = ["1","2","3","4","5","6","7","8","9"]
myTerminal    = "alacritty"
myModMask     = mod4Mask -- Win key or Super_L
myBorderWidth = 1
-- | Layout hook
--myLayout = avoidStruts  $ (tiled |||  reflectTiled ||| Mirror tiled ||| Grid ||| Full)
--myLayout = avoidStruts  $ (tiled |||  Mirror tiled ||| Full)
--myLayout = layoutHook defaultConfig
myLayout = windowNavigation $ smartBorders $ 
    Simplest
    ||| (combineTwo (TwoPane 0.01 0.5) (tabbed shrinkText tabConfig) (tabbed shrinkText tabConfig))
    ||| BSP.emptyBSP
    ||| Tall 1 (1/100) (1/2)
    ||| Full
    ||| tabbed shrinkText tabConfig
    ||| simplestFloat
    ||| (combineTwo (TwoPane 0.01 0.5) (Full) (Simplest))
    ||| (Mirror $ combineTwo (TwoPane 0.03 0.5) (tabbed shrinkText tabConfig) (tabbed shrinkText tabConfig))
--    ||| spiral(6/7)
--    ||| Mirror ( Tall 1 (1/100) (1/2) )
--    ||| Simplest
--    ||| TwoPanePersistent Nothing (3/100) (1/2)
--    ||| BSP.emptyBSP
--    ||| TwoPane (3/100) (1/2)
--    ||| Grid
--    ||| Column 1.6
--    ||| simpleTabbed
--    ||| simpleCross
  where
    tabConfig = theme smallClean
    --tabConfig = defaultTheme

--------------------------------------------------------------------------------
-- A list of custom keys
myKeys :: XConfig Layout -> Map (ButtonMask, KeySym) (X ())
myKeys (XConfig {modMask = myModMask}) = M.fromList $
    [ -- Some programs
      ((myModMask, xK_F1), spawn "pactl set-sink-mute @DEFAULT_SINK@ toggle")
    , ((myModMask, xK_F2), spawn "pactl set-sink-volume @DEFAULT_SINK@ -1.5%")
    , ((myModMask, xK_F3), spawn "pactl set-sink-volume @DEFAULT_SINK@ +1.5%")
    , ((myModMask, xK_F4), spawn "pactl set-source-mute @DEFAULT_SOURCE@ toggle")
    , ((myModMask, xK_F5), spawn "lux -s 5%")    
    , ((myModMask, xK_F6), spawn "lux -a 5%")    
--    , ((myModMask, xK_F12), spawn "sudo pm-suspend")
    , ((myModMask, xK_F12), spawn "systemctl suspend")
      -- launcher keys
    , ((myModMask, xK_p), spawn "dmenu_run")
    --, ((myModMask, xK_a), sendMessage ToggleStruts)
    , ((myModMask, xK_z), sendMessage ToggleStruts)
    , ((myModMask, xK_f), fullFloatFocused)
    , ((myModMask, xK_r), rectFloatFocused)
    -- Push window back into tiling.
    , ((myModMask, xK_t), withFocused $ windows . W.sink)
      -- Shrink and expand
    --, ((myModMask, xK_Right), sendMessage Expand)
    --, ((myModMask, xK_Left),  sendMessage Shrink)
    
    -- Window Navigation
    -- window swapping
    , ((myModMask .|. shiftMask,  xK_m   ), windows W.swapMaster)
    , ((myModMask .|. controlMask,  xK_m   ), promote)
    , ((myModMask .|. mod1Mask,  xK_m   ), windows W.shiftMaster)
    --, ((myModMask,  xK_m   ), windows W.focusMaster)
    --, ((myModMask .|. shiftMask,  xK_s   ), sendMessage $ SwapWindow)
    --, ((myModMask .|. shiftMask,  xK_Down        ), windows W.swapDown)
    --, ((myModMask .|. shiftMask,  xK_Up        ), windows W.swapUp)
    --screen swapping
    , ((myModMask .|. mod1Mask, xK_o), swapNextScreen)
    , ((myModMask .|. shiftMask, xK_o), shiftNextScreen)
    , ((myModMask .|. controlMask, xK_o), windowMenu)
    , ((noModMask, xK_Menu), goToSelected def)
    , ((myModMask .|. shiftMask .|. controlMask, xK_q), spawn "sudo pkill -KILL Xorg")
    --combo mode layout navigation (moves pane between the two sub layouts)
    , ((myModMask, xK_Left), sendMessage $ Go L)
    , ((myModMask, xK_Right), sendMessage $ Go R)
    , ((myModMask, xK_Up), sendMessage $ Go U)
    , ((myModMask, xK_Down), sendMessage $ Go D)
    , ((myModMask .|. controlMask, xK_Left), sendMessage $ Move L)
    , ((myModMask .|. controlMask, xK_Right), sendMessage $ Move R)
    , ((myModMask .|. controlMask, xK_Up), sendMessage $ Move U)
    , ((myModMask .|. controlMask, xK_Down), sendMessage $ Move D)
    , ((myModMask .|. shiftMask, xK_Left), sendMessage $ Swap L)
    , ((myModMask .|. shiftMask, xK_Right), sendMessage $ Swap R)
    , ((myModMask .|. shiftMask, xK_Up), sendMessage $ Swap U)
    , ((myModMask .|. shiftMask, xK_Down), sendMessage $ Swap D)
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
    --, ((myModMask, xK_Insert), pasteSelection)
    --, ((myModMask .|. controlMask, xK_p), pasteSelection)
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
