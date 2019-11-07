# VerifyKit
[![Platform](https://img.shields.io/badge/Platforms-iOS-4E4E4E.svg?colorA=28a745)](#installation)

[![Swift support](https://img.shields.io/badge/Swift-4.0%20%7C%204.1%20%7C%204.2%20%7C%205.0%20%7C%205.1-lightgrey.svg?colorA=28a745&colorB=4E4E4E)](#swift-versions-support)
[![CocoaPods Compatible](https://img.shields.io/cocoapods/v/VerifyKit.svg?style=flat&label=CocoaPods&colorA=28a745&&colorB=4E4E4E)](https://cocoapods.org/pods/VerifyKit)
[![Carthage compatible](https://img.shields.io/badge/Carthage-uncompatible-red.svg?style=flat)](https://github.com/Carthage/Carthage)

VerifyKit is a framework to easily integrate phone number validation flow to your mobile application.

## Requirements

 - Xcode 11.0+
 - iOS 10.3+

## Installation

#### CocoaPods
You can install framework via [CocoaPods](https://cocoapods.org/pods/VerifyKit).

```bash
pod 'VerifyKit'
```

## Manual Installation

Or you can [click here](https://verifykit.com/framework/verifykit-sdk-ios-001.zip) to download the framework and add the files with drag and drop.

If you choose to use the SDK manually, after you added the files to your project, you need to add both frameworks to ```Frameworks, Libraries, and Embedded Content``` panel in your Project's general settings, then set ```Embed``` option as ```Embed & Sign```.

## Configure Info.plist

To successfully use the framework, you need to add ```VerifyKitKey``` and ```VerifyKitSecret``` to your plist file. This step is mandatory.

After user chooses to validate the phone number with a third party messaging app, the SDK needs to return to main app.
To successfully complete this flow, you need to add ```vfk{your-verifykit-id}``` as URL Scheme to your plist file.

Open your Info.plist as source code and insert the following XML snippet into the body of your file just before the final </dict> element.

```
<key>CFBundleURLTypes</key>
<array>
  <dict>
    <key>CFBundleURLSchemes</key>
    <array>
      <string>vfk{your-verifykit-id}</string>
    </array>
  </dict>
</array>
<key>VerifyKitKey</key>
<string>{your-verifykit-key}</string>
<key>VerifyKitSecret</key>
<string>{your-verifykit-secret-key}</string>
<key>LSApplicationQueriesSchemes</key>
<array>
  <string>whatsapp</string>
  <string>tg</string>
  <string>viber</string>
</array>
```

## Usage

```swift
import VerifyKit


let kit = VerifyKit()
let viewController = kit.viewControllerForLogin()
self.present(viewController, animated: true, completion: nil)
```

You can get the result via ```VerifyKitDelegate``` protocol.

```swift

viewController.kitDelegate = self

extension ViewController: VerifyKitDelegate {

    func didSuccess(with sessionCode: String) {
        print("VerifyKitDelegate didSuccess with sessionCode:\(sessionCode)")
    }

    func didFail(with error: VerifyKitError) {
        print("VerifyKitDelegate didFail with error:\(error)")
    }
}
```

## Configuration

```swift
let options = VerifyKitOptions(logActive: true)
let kit = VerifyKit(options: options)
```


## VerifyKitOptions Struct

You can change the settings declared in ```VerifyKitOptions``` struct.

```swift
public struct VerifyKitOptions {
    var environment: VerifyKitEnvironment = .debug // default
    var logActive: Bool = true // default
    var theme: VerifyKitTheme = VerifyKitTheme()
}

public enum VerifyKitEnvironment {

    /// Stage environment for debug
    case debug

    /// Production environment for distribution
    case release
}

public struct VerifyKitTheme {
    public var appName: String = "VerifyKit" // default
    public var statusBarColor: UIStatusBarStyle = .lightContent // default
    public var navigationBarBackgroundColor: UIColor = .blue // default
    public var navigationBarForegroundColor: UIColor = .white // default
}
```

## Dependencies

VerifyKit uses CryptoSwift for network traffic encryption.

## Notes

Before your app release, please change the VerifyKitEnvironment to 'release' instead of 'debug'.
