[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Twitter](https://img.shields.io/badge/twitter-@nagami_hiro-blue.svg?style=flat)](https://twitter.com/nagami_hiro)

# StoryboardBuilder
## How ot use

1. Project import StoryboardBuilder_iOS
2. Your custom view controller extends `StoryboardBuilderProtocol`.
3. `storyboardName` and `storyboardID` is implemented in that view controller.
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

## Carthage
Add following.
```
github "hiro-nagami/StoryboardBuilder"
```

## License

StoryboardBuilder is released under the MIT license. [See LICENSE](https://github.com/hiro-nagami/StoryboardBuilder/blob/master/LICENSE) for details.
