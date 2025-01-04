export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

echo 'Xcursor.theme: Bibata-Modern-Ice
      Xft.dpi: 120' | xrdb

fcitx5 &
slstatus &
xcompmgr &
xset r rate 250 60 &
xset s 1200 &
xss-lock slock &
~/.fehbg &

exec dwm
