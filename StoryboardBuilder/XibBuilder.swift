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

extension XibBuilderProtocol {
    public static func getModule() -> Self {
        let nib = UINib(nibName: Self.xibName, bundle: nil)
        guard let module = nib.instantiate(withOwner: self, options: nil).first as? Self else {
            fatalError("Cannot find module has xibName \(Self.xibName)")
        }

        return module
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
