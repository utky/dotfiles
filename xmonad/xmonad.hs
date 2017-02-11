import XMonad
import XMonad.Hooks.DynamicLog (statusBar, xmobarPP)
import XMonad.Config.Desktop

workspaces' =
  [ "1:work"
  , "2:dev"
  , "3:web"
  , "4:media"
  ] ++ map show [5..9] 

baseConfig = desktopConfig

config = baseConfig
  {
    terminal    = "urxvt"
  , modMask     = mod4Mask
  , borderWidth = 3
  , workspaces  = workspaces'
  }

xmobarcmd = "xmobar $HOME/.xmonad/xmobarrc"
xmobar' conf = statusBar xmobarcmd xmobarPP toggleStrutsKey conf

toggleStrutsKey :: XConfig t -> (KeyMask, KeySym)
toggleStrutsKey XConfig{modMask = modm} = (modm, xK_b )

main = xmonad =<< xmobar' config
