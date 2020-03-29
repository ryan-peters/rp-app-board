# RPAppBoard

RPAppBoard is a quick drop in view controller to allow you to show off and link your other apps available on the App Store.


## Getting Started
These instructions will get you up and running with RPAppBoard quickly and easily.

### Installing

RPAppBoard consists of four files:
* RPAppBoardViewController
* RPAppBoardTableViewCell
* RPAppBoardImages.xcassets
* apps.plist

To install RPAppBoard, drop these four files into your XCode project, copying files as necessary.

### Setting Up

Though all files are easily customizable, the only thing you need to edit to make it work for your use case is apps.plist, and ensuring app icons are added to the asset catalog, or are elsewhere in the project. You can copy the existing setup as is displayed in the current file, but in a nutshell, each app has four key/value pairs:

* **iconFilename**: This is either the name of the asset, or the filename of an included image that is not part of the asset catalog
* **name**: This is the name of the app as you want it displayed in the cell
* **description**: This is the description of the app as you want it displayed in the cell
* **link**: This is the link to your app on the App Store. *Note: ensure you use the following format to be certain it is openable in Safari:* itms-apps://itunes.apple.com/app/{appId}

*A note on the icon images: The intent is to use your app's icon as the image. As such, the project depends on a square aspect ratio. If you choose to use a rectangular image, you'll need to tweak the constraints and layer radius.

