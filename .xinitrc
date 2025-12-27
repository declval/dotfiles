export GTK_IM_MODULE=fcitx

echo 'Xcursor.size: 38' | xrdb
echo 'Xcursor.theme: Bibata-Modern-Ice' | xrdb -merge
echo 'Xft.dpi: 144' | xrdb -merge

dunst &
fcitx5 &
slstatus &
xcompmgr &
xset r rate 260 64
~/.fehbg

exec dwm
