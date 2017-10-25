[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Twitter](https://img.shields.io/badge/twitter-@nagami_hiro-blue.svg?style=flat)](https://twitter.com/nagami_hiro)

# StoryboardBuilder
### How ot use

1. Import StoryboardBuilder_iOS
2. View controller class extends to `StoryboardBuilderProtocol`.
3. `storyboardName` and `storyboardID` is implemented in that view controller.
```swift
import UIKit
import Foundation
import StoryboardBuilder_iOS

class ViewController: UIViewController, StoryboardBuilderProtocol {
    static var storyboardName: String = "Main"
    static var storyboardID: String = "ViewController"
    ...
}
```

You can use such as following.
```swift
let viewController: ViewController = StoryboardBuilder<ViewController>.generate()
```

## License

StoryboardBuilder is released under the MIT license. [See LICENSE](https://github.com/hiro-nagami/StoryboardBuilder/blob/master/LICENSE) for details.
