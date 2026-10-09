#!/usr/bin/env bash
set -e

BUILD_DIR="build"
APPDIR="${BUILD_DIR}/AppDir"
CPU_ARCH="${1:-x86_64}"
export NO_STRIP=1
export QMAKE=$(which qmake)

rm -rf "${BUILD_DIR}"
mkdir -p "${BUILD_DIR}"

cd "${BUILD_DIR}"
qmake PREFIX=/usr ../SteaScree.pro
make -j$(nproc)

mkdir -p AppDir/usr/bin
mkdir -p AppDir/usr/share/applications
mkdir -p AppDir/usr/share/icons/hicolor/256x256/apps/
cp SteaScree AppDir/usr/bin
cp ../res/misc/steascree.desktop AppDir/usr/share/applications/
cp ../res/icons/SteaScree.png AppDir/usr/share/icons/hicolor/256x256/apps/steascree.png

curl -fsSLo linuxdeploy-x86_64.AppImage "https://github.com/linuxdeploy/linuxdeploy/releases/download/continuous/linuxdeploy-$CPU_ARCH.AppImage"
chmod +x  ./linuxdeploy-x86_64.AppImage
curl -fsSLo linuxdeploy-plugin-qt "https://github.com/linuxdeploy/linuxdeploy-plugin-qt/releases/download/continuous/linuxdeploy-plugin-qt-$CPU_ARCH.AppImage"
chmod +x ./linuxdeploy-plugin-qt

./linuxdeploy-x86_64.AppImage \
  --appdir AppDir \
  --executable AppDir/usr/bin/SteaScree \
  --icon-file AppDir/usr/share/icons/hicolor/256x256/apps/steascree.png \
  --desktop-file AppDir/usr/share/applications/steascree.desktop \
  --plugin qt \
  --output appimage

VERSION=$(awk -F'=' '/^VERSION/ {gsub(/[[:space:]]/, "", $2); print $2}' ../SteaScree.pro)
STEASCREE_APPIMAGE="SteaScree-v${VERSION}.AppImage"
mv ./SteaScree*.AppImage "$STEASCREE_APPIMAGE"

FILESIZE=$(stat -c %s ./SteaScree*.AppImage)
SHA256SUM=$(sha256sum ./SteaScree*.AppImage | awk '{ print $1 }')
echo "${SHA256SUM};${FILESIZE}B"

echo "AppImage created successfully in ${BUILD_DIR}/"