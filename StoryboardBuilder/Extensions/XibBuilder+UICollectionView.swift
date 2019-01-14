//
//  XibBuilder+UICollectionView.swift
//  StoryboardBuilder
//
//  Created by Nagamine Hiromasa on 2019/01/15.
//  Copyright © 2019年 Hiromasa Nagamine. All rights reserved.
//

import Foundation
import UIKit

extension UICollectionView: XibBuilerCompatible {}

public extension XibBuilerExtension where Base: UICollectionView {
    public func register(cellClass: XibBuilderProtocol.Type) {
        let nib = UINib(nibName: cellClass.xibName, bundle: nil)
        self.base.register(nib, forCellWithReuseIdentifier: cellClass.xibName)
    }

    public func register(cellClasses: [XibBuilderProtocol.Type]) {
        for clazz in cellClasses {
            let nib = UINib(nibName: clazz.xibName, bundle: nil)
            self.base.register(nib, forCellWithReuseIdentifier: clazz.xibName)
        }
    }

    public func dequeueReusableCell<T: XibBuilderProtocol>(clazz: T.Type, indexPath: IndexPath) -> T {
        return self.base.dequeueReusableCell(withReuseIdentifier: T.xibName, for: indexPath)  as! T
    }
}
