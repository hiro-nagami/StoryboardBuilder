[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Twitter](https://img.shields.io/badge/twitter-@nagami_hiro-blue.svg?style=flat)](https://twitter.com/nagami_hiro)

# StoryboardBuilder
## How ot use
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

## Carthage
Add following.
```
github "hiro-nagami/StoryboardBuilder"
```

## License

StoryboardBuilder is released under the MIT license. [See LICENSE](https://github.com/hiro-nagami/StoryboardBuilder/blob/master/LICENSE) for details.
