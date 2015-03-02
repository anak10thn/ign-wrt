cd ~/mr3020
cat > ~/mr3020/feeds.conf <<EOF
src-git packages https://github.com/openwrt/packages.git
src-git luci http://git.openwrt.org/project/luci.git
src-git nodejs https://github.com/akwrt/nodejs-openwrt.git
EOF
