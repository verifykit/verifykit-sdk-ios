# VerifyKit
[![Platform](https://img.shields.io/badge/Platforms-iOS-4E4E4E.svg?colorA=28a745)](#installation)
![Status](https://img.shields.io/badge/Status-Beta-yellowgreen) ![License](https://img.shields.io/badge/License-MIT-red.svg)

[![Swift support](https://img.shields.io/badge/Swift-4.0%20%7C%204.1%20%7C%204.2%20%7C%205.0%20%7C%205.1-lightgrey.svg?colorA=28a745&colorB=4E4E4E)](#swift-versions-support)
[![CocoaPods Compatible](https://img.shields.io/cocoapods/v/VerifyKit.svg?style=flat&label=CocoaPods&colorA=28a745&&colorB=4E4E4E)](https://cocoapods.org/pods/VerifyKit)
[![Carthage compatible](https://img.shields.io/badge/Carthage-uncompatible-red.svg?style=flat)](https://github.com/Carthage/Carthage)

VerifyKit is the next gen phone number validation system. Users can easily verify their  phone numbers without the need of entering phone number or a pin code.

## Requirements

 - Xcode 11.0+
 - iOS 10.3+

## Installation

#### CocoaPods
You can install framework via [CocoaPods](https://cocoapods.org/pods/VerifyKit).

```bash
pod 'VerifyKit'
```
<!--- ## Manual Installation

Or you can [click here](https://verifykit.com/framework/verifykit-sdk-ios-001.zip) to download the framework and add the files with drag and drop.

If you choose to use the SDK manually, after you added the files to your project, you need to add both frameworks to ```Frameworks, Libraries, and Embedded Content``` panel in your Project's general settings, then set ```Embed``` option as ```Embed & Sign```. -->

## Configure Info.plist

To successfully use the framework, you need to add ```VerifyKitKey``` and ```VerifyKitSecret``` to your plist file. This step is mandatory.

After user chooses to validate the phone number with a third party messaging app, the SDK needs to return to main app.
To successfully complete this flow, you need to add ```vfk{your-verifykit-id}``` as URL Scheme to your plist file.

Open your Info.plist as source code and insert the following XML snippet into the body of your file just before the final ```</dict>``` element.

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
  <string>telegram</string>
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

VerifyKit only dismisses ```viewControllerForLogin()``` automatically when ```didSuccess``` delegate is called.
To give the user a chance to try other validation methods or to start again, ```viewControllerForLogin()``` doesn't get dismissed on ```didFail```. If you want to dismiss it on some specific error type, you can do that manually.

##


There may be a case when user chooses a third party messaging app for validation, sends a message, but doesn't return to main app and kills it. In that case, that user is verified with VerifyKit but the main app doesn't know it yet.

To fix this, we have a method to check interrupted session status.

```swift
VerifyKit.checkInterruptedSession { [weak self] sessionCode in
  guard let sessionCode = sessionCode else {
    // Start VerifyKit flow or do what your app needs
    return
  }

  // You have an interrupted sessionCode from last time.
  // Tell your API.
  print("sessionCode \(sessionCode)")
}
```

Using this method is optional and up to you.

**VerifyKit will handle the interrupted verification even if you don't implement this method.**

## Configuration

```swift
let options = VerifyKitOptions(logActive: true)
let kit = VerifyKit(options: options)
```


### VerifyKitOptions Struct

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
    public var appName: String = "VerifyKit"  // default
    public var statusBarStyle: UIStatusBarStyle = .default  // default
    public var navigationBarBackgroundColor: UIColor = UIColor(red: 0.969, green: 0.969, blue: 0.969, alpha: 1.0)  // default
    public var navigationBarForegroundColor: UIColor = .black  // default
    public var backgroundColor: UIColor = .white  // default
    public var textColor: UIColor = .darkText // default
}
```

## Dependencies

This product includes software([CyrptoSwift](https://cocoapods.org/pods/CryptoSwift)) developed by [Marcin Krzyzanowski](http://krzyzanowskim.com).

## Notes

Before your app release, please change the VerifyKitEnvironment to 'release' instead of 'debug'.

---

## Author

VerifyKit is owned and maintained by [VerifyKit DevTeam](mailto:sdk@verifykit.com).


## License

The MIT License

Copyright (c) 2019-2020 VerifyKit. [http://verifykit.com](http://verifykit.com)

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
