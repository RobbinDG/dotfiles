export PATH="$PATH:~/development/flutter/bin"
export PATH="$PATH:/usr/lib/dart/bin"
export PATH="$PATH:~/.dotnet/tools"

. /etc/os-release
if [[ $ID = "arch" ]]; then
    # export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel -Dawt.useSystemAAFontSettings=on -Dsun.java2d.dpiaware=true'
    export _JAVA_AWT_WM_NONREPARENTING=1
    export GDK_SCALE=2
    export QT_SCALE_FACTOR=2
    # export GDK_DPI_SCALE=2.00
fi
