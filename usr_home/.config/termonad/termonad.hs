{-# LANGUAGE OverloadedStrings #-}

module Main where

import Termonad.App (defaultMain)
import Termonad.Config
  ( FontConfig
  , FontSize(FontSizePoints)
  , Option(Set)
  , ShowScrollbar(ShowScrollbarAlways)
  , ShowScrollbar(ShowScrollbarNever)
  , ShowScrollbar(ShowScrollbarIfNeeded)
  , ShowTabBar(ShowTabBarIfNeeded)
  , showTabBar
  , showMenu
  , CursorBlinkMode(CursorBlinkModeOff)
  , CursorBlinkMode(CursorBlinkModeOn)
  , cursorBlinkMode
  , defaultConfigOptions
  , defaultFontConfig
  , defaultTMConfig
  , fontConfig
  , fontFamily
  , fontSize
  , options
  , showScrollbar
  , scrollbackLen
  , confirmExit
  )
import Termonad.Config.Colour
  ( AlphaColour
  , ColourConfig
  , addColourExtension
  , createColour
  , createColourExtension
  , cursorBgColour
  , defaultColourConfig
  )

-- | This sets the color of the cursor in the terminal.
--
-- This uses the "Data.Colour" module to define a dark-red color.
-- There are many default colors defined in "Data.Colour.Names".
cursBgColour :: AlphaColour Double
cursBgColour = createColour 204 0 0

-- | This sets the colors used for the terminal.  We only specify the background
-- color of the cursor.
colConf :: ColourConfig (AlphaColour Double)
colConf = defaultColourConfig {cursorBgColour = Set cursBgColour}

-- | This defines the font for the terminal.
fontConf :: FontConfig
fontConf =
  defaultFontConfig
    {fontFamily = "Monospace", fontSize = FontSizePoints 13}

main :: IO ()
main = do
  colExt <- createColourExtension colConf
  let termonadConf =
        defaultTMConfig
          { options =
              defaultConfigOptions
                { fontConfig = fontConf
                  -- Make sure the scrollbar is always visible.
                , showScrollbar = ShowScrollbarIfNeeded
                , cursorBlinkMode = CursorBlinkModeOff
                , showTabBar = ShowTabBarIfNeeded
                , showMenu = False
                --, showScrollbar = ShowScrollbarAlways
                }
          } `addColourExtension`
        colExt
  defaultMain termonadConf