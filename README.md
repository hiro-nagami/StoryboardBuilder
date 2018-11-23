[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Twitter](https://img.shields.io/badge/twitter-@nagami_hiro-blue.svg?style=flat)](https://twitter.com/nagami_hiro)

# How ot use
## StoryboardBuilder

1. Create storyboard file in your project.
2. Import StoryboardBuilder_iOS.
3. Your custom view controller extends `StoryboardBuilderProtocol`.
4. `storyboardName` and `storyboardID` are implemented in that view controller.
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

/* You can generate CustomViewController just like following.
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let customeVC = storyboard.instantiateViewController(withIdentifier: "CustomViewController") as! CustomViewController
**/
```

## XibBuilder

1. Create xib file in your project.
2. Import StoryboardBuilder_iOS.
3. Your custom view controller extends `XibBuilderProtocol`.
4. `xibName`is implemented in that view controller.
```swift
import UIKit
import Foundation
import StoryboardBuilder_iOS

class CustomView: UIView, XibBuilderProtocol {
    static var xibName: String = "CustomView"
    ...
}
```

You can use such as following.
```swift

let customViewController: CustomView = XibBuilder<CustomView>.generate()

/* You can generate CustomView just like following.
   let identifier = "CustomView"
   let customViewNib = UINib(nibName: identifier, bundle: nil)
   let customView = customViewNib.instantiate(withOwner: self, options: nil).first as! CustomView
**/

```

You can register and use CustomTableViewCell.

```
class CustomView: UITableViewCell, XibBuilderProtocol {
    static var xibName: String = "CustomView"
    ...
}

class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.sb.register(clazz: CustomView.self)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.sb.dequeueReusableCell(clazz: SampleTableViewCell.self)

        ...
        
        return cell
    }
}
```

## Carthage
Add following.
```
github "hiro-nagami/StoryboardBuilder"
```

## License
StoryboardBuilder is released under the MIT license. [See LICENSE](https://github.com/hiro-nagami/StoryboardBuilder/blob/master/LICENSE) for details.

Twitter: @nagami_hiro
