
# StoryboardBuilder
Simple dependency injection for generating views from storyboard.

[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
![Swift 4.0](https://img.shields.io/badge/Swift-4.0-orange.svg?style=flat)

## Description
`StoryboardBuilder` is framework to help generating that View and ViewController are defineded in Storyboard and Xib. You can generate instance and parse type of one by using `StoryboardBuilderProtocol` and `XibBuilderProtocol` description.

## Install
### Carthage
Add following.
```
github "hiro-nagami/StoryboardBuilder"
```

## Usage
### StoryboardBuilder

1. Project import StoryboardBuilder_iOS
2. Make storyboard file and define ViewController.

<img src=https://raw.githubusercontent.com/hiro-nagami/resource-repo/master/StoryboardBuilder/storyboard.png alt=storyboard width=600px />

3. Your custom view controller extends `StoryboardBuilderProtocol`.
4. `storyboardName` and `storyboardID` are implemented in the view controller.
```swift
import UIKit
import Foundation
import StoryboardBuilder_iOS

class CustomViewController: UIViewController, StoryboardBuilderProtocol {
    static var storyboardName: String = "Main"
    static var storyboardID: String = "CustomViewController"
    ...
}
```

You can use such as following.
```swift
let customViewController: CustomViewController = StoryboardBuilder<CustomViewController>.generate()
```

### XibBuilder

1. Project import StoryboardBuilder_iOS
2. Make xib file and define View.

<img src=https://raw.githubusercontent.com/hiro-nagami/resource-repo/master/StoryboardBuilder/xib.png alt=xib width=600px />

3. Your custom view extends `XibBuilderProtocol`.
4. `xibName` is implemented in the view.
```swift
import UIKit
import Foundation
import StoryboardBuilder_iOS

class SampleView: UIView, XibBuilderProtocol {
    static var xibName: String = "SampleView"
    ...
}
```

You can use such as following.
```swift
let sampleView: SampleView = XibBuilder<SampleView>.generate()
```

## License

StoryboardBuilder is released under the MIT license. [See LICENSE](https://github.com/hiro-nagami/StoryboardBuilder/blob/master/LICENSE) for details.

## Author
[@hiro_nagami](https://twitter.com/nagami_hiro)
