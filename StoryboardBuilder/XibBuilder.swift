//
//  XibBuilder.swift
//  StoryboardBuilder
//
//  Created by Nagamine Hiromasa on 2017/10/27.
//  Copyright © 2017 Hiromasa Nagamine. All rights reserved.
//

import Foundation
import UIKit

public protocol XibBuilderProtocol {
    static var xibName: String { get }
}

public struct XibBuilder<T: XibBuilderProtocol> {
    public static func generate() -> T {
        return UINib(nibName: T.xibName, bundle: nil).instantiate(withOwner: self, options: nil).first as! T
    }
}

public final class XibBuilerExtension<Base> {
    public let base: Base
    public init(_ base: Base) {
        self.base = base
    }
}

public protocol XibBuilerCompatible {
    associatedtype CompatibleType
    var sb: CompatibleType { get }
}

public extension XibBuilerCompatible {
    public var sb: XibBuilerExtension<Self> {
        return XibBuilerExtension(self)
    }
}


/* UITableView Extension */

extension UITableView: XibBuilerCompatible {}

extension XibBuilerExtension where Base: UITableView {
    public func register(clazz: XibBuilderProtocol.Type) {
        let nib = UINib(nibName: clazz.xibName, bundle: nil)
        self.base.register(nib, forCellReuseIdentifier: clazz.xibName)
    }

    public func dequeueReusableCell<T: XibBuilderProtocol>(clazz: T.Type) -> T {
        return self.base.dequeueReusableCell(withIdentifier: T.xibName) as! T
    }
}
