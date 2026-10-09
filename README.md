# SteaScree-Repackaged

Howdy! This is simple fork of SteaScree I made after having issues running the executable on my machine, so I decided to straight up make it compile onto an AppImage (and perhaps flatpak) and hope it works forever.
I really like SteaScree, but unfortunately the repo has been archived and the latest release is from 2017. Fortunately everything still works, so I just changed build related files.

# Build
You need qt5-base to be installed
```
qmake-qt5
make -j$(nproc)
```

# ORIGINAL README.md
# This is no longer maintained. Who knows maybe I'll motivate myself enough and build the web-based SteaScree 2 at some point!

## SteaScree: Steam Cloud Screenshot Uploader

SteaScree is a simple cross-platform open-source utility app, which makes screenshots, taken without the use of Steam's in-game overlay, uploadable to the Steam Cloud. You just pick pics, a game and SteaScree will do the rest.

![screenshot](https://steascree.download/screenshot.png)

Latest installers for all platforms are always available at https://steascree.download.

Join official Steam group for the latest announcements and discussion: http://steamcommunity.com/groups/steascree.

**Developer's note**: I am sorry I was unable to motivate myself to improve this app in recent years. The thing is, I don't feel like learning Qt and the build process for different platforms is a bit cumbersome. That's why I don't feel like Qt is a way to go, well... not anymore. I am thinking about rewriting SteaScree for a browser, that is in JavaScript using [File System Access API](https://wicg.github.io/file-system-access), but that'll obviously take time.
