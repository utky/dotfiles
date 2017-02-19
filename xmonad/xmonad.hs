import XMonad
import XMonad.Hooks.DynamicLog (statusBar, xmobarPP, ppCurrent, xmobarColor, wrap)
import XMonad.Config.Desktop

workspaces' =
  [ "1:work"
  , "2:dev"
  , "3:web"
  , "4:mail"
  , "5:media"
  ] ++ map show [5..9] 

baseConfig = desktopConfig

config' = baseConfig
  {
    terminal    = "urxvt"
  , modMask     = mod4Mask
  , borderWidth = 3
  , workspaces  = workspaces'
  }

toggleStrutsKey :: XConfig t -> (KeyMask, KeySym)
toggleStrutsKey XConfig{modMask = modm} = (modm, xK_b )

main :: IO ()
main = xmonad =<< statusBar myBar myPP toggleStrutsKey config'

-- Command to launch the bar.
myBar = "xmobar"

-- Custom PP, configure it as you like. It determines what is being written to the bar.
myPP = xmobarPP { ppCurrent = xmobarColor "#429942" "" . wrap "<" ">" }
