echo '修改网关地址'
sed -i 's/192.168.1.1/192.168.5.1/g' package/base-files/files/bin/config_generate

echo '修改默认主题'
sed -i 's/config internal themes/config internal themes\n    option Argon  \"\/luci-static\/argon\"/g' feeds/luci/modules/luci-base/root/etc/config/luci

echo '去除默认bootstrap主题'
sed -i '/set luci.main.mediaurlbase=\/luci-static\/bootstrap/d' feeds/luci/themes/luci-theme-bootstrap/root/etc/uci-defaults/30_luci-theme-bootstrap

echo '删除旧版argon,链接新版'
rm -rf ./package/lean/luci-theme-argon
git clone --depth=1 -b 18.06 https://github.com/jerrykuku/luci-theme-argon ../custom/luci-theme-argon
git clone --depth=1 https://github.com/jerrykuku/luci-app-argon-config ../custom/luci-app-argon-config
#ln -s ../../../luci-theme-argon ./package/lean/
git clone --depth=1 https://github.com/sirpdboy/luci-theme-opentopd ../custom/luci-theme-opentopd

echo '集成diy目录'
ln -s ../../custom ./package/openwrt-packages

#echo '首页增加CPU频率动态显示'
#cp -f ../diy/mod-index.htm ./feeds/luci/modules/luci-mod-admin-full/luasrc/view/admin_status/index.htm

