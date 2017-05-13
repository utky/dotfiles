import XMonad
import XMonad.Hooks.DynamicLog (statusBar, xmobarPP, ppCurrent, xmobarColor, wrap)
import XMonad.Hooks.SetWMName (setWMName)
import XMonad.Config.Desktop (desktopConfig)
import XMonad.Util.EZConfig (additionalKeys)

workspaces' :: [String]
workspaces' =
  [ "1:work"
  , "2:dev-1"
  , "3:dev-2"
  , "4:web"
  , "5:mail"
  , "6:media"
  , "7:game"
  ] ++ map show [7..9] 

-- baseConfig :: XConfig a
baseConfig = desktopConfig

-- config' :: XConfig a
config' = baseConfig
  {
    terminal           = "urxvt"
  , modMask            = mod4Mask
  , focusedBorderColor = "#55f4b8"
  , borderWidth        = 3
  , workspaces         = workspaces'
  , startupHook        = setWMName "LG3D"
  , manageHook         = myManageHook <+> manageHook baseConfig
  }

myManageHook = composeAll
   [ className =? "Firefox"          --> doShift "4:web"
   , className =? "Thunderbird"      --> doShift "5:mail"
   ]

toggleStrutsKey :: XConfig t -> (KeyMask, KeySym)
toggleStrutsKey XConfig{modMask = modm} = (modm, xK_b )

main :: IO ()
main = xmonad =<< statusBar myBar myPP toggleStrutsKey config'

-- Command to launch the bar.
myBar :: String
myBar = "xmobar"

-- Custom PP, configure it as you like. It determines what is being written to the bar.
myPP = xmobarPP { ppCurrent = xmobarColor "#429942" "" . wrap "<" ">" }
