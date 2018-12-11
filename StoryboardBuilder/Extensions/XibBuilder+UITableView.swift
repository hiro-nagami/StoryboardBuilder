//
//  XibBuilder+UITableView.swift
//  StoryboardBuilder
//
//  Created by Nagamine Hiromasa on 2018/12/11.
//  Copyright © 2018年 Hiromasa Nagamine. All rights reserved.
//

import Foundation
import UIKit

extension UITableView: XibBuilerCompatible {}

public extension XibBuilerExtension where Base: UITableView {
    public func register(cellClass: XibBuilderProtocol.Type) {
        let nib = UINib(nibName: cellClass.xibName, bundle: nil)
        self.base.register(nib, forCellReuseIdentifier: cellClass.xibName)
    }

    public func register(cellClasses: [XibBuilderProtocol.Type]) {
        for clazz in cellClasses {
            let nib = UINib(nibName: clazz.xibName, bundle: nil)
            self.base.register(nib, forCellReuseIdentifier: clazz.xibName)
        }
    }

    public func dequeueReusableCell<T: XibBuilderProtocol>(clazz: T.Type) -> T {
        return self.base.dequeueReusableCell(withIdentifier: T.xibName) as! T
    }
}
