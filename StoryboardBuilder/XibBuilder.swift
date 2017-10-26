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
