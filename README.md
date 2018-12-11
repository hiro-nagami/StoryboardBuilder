
# StoryboardBuilder
Simple dependency injection for generating views from storyboard.

[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
![Swift 4.2](https://img.shields.io/badge/Swift-4.2-orange.svg?style=flat)

## Description
`StoryboardBuilder` is framework to help simply and easily generating that View and ViewController are defineded in Storyboard and Xib. You can generate instance and parse type of one by using `StoryboardBuilderProtocol` and `XibBuilderProtocol` description.

## Install
### Carthage
Add following.
```
github "hiro-nagami/StoryboardBuilder"
```

# How ot use
## Way to get Storyboard Class

1. Create storyboard file in your project.

<img src=https://raw.githubusercontent.com/hiro-nagami/resource-repo/master/StoryboardBuilder/storyboard.png alt=storyboard width=600px />

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
/* You can generate CustomViewController just like following.
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let customeVC = storyboard.instantiateViewController(withIdentifier: "CustomViewController") as! CustomViewController
**/

let customViewController = CustomViewController.getModule()
```

## Way to get Xib Class

1. Create xib file in your project.

<img src=https://raw.githubusercontent.com/hiro-nagami/resource-repo/master/StoryboardBuilder/xib.png alt=xib width=600px />

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
/* You can generate CustomView just like following.
   let identifier = "CustomView"
   let customViewNib = UINib(nibName: identifier, bundle: nil)
   let customView = customViewNib.instantiate(withOwner: self, options: nil).first as! CustomView
**/

let customView: CustomView = CustomView.getModule()
```

You can register and use CustomTableViewCell.

```swift
class CustomViewCell: UITableViewCell, XibBuilderProtocol {
    static var xibName: String = "CustomView"
    ...
}

class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.sb.register(cellClass: CustomViewCell.self)
        self.tableView.sb.register(cellClasses: [
            CustomViewACell.self,
            CustomViewBCell.self,
            CustomViewCCell.self,
        ])
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.sb.dequeueReusableCell(cellClass: CustomViewBCell.self)

        ...
        
        return cell
    }
}
```

## License
StoryboardBuilder is released under the MIT license. [See LICENSE](https://github.com/hiro-nagami/StoryboardBuilder/blob/master/LICENSE) for details.

## Author
[@hiro_nagami](https://twitter.com/nagami_hiro)
