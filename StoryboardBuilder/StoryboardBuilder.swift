//
//  StoryboardBuilder.swift
//  StoryboardBuilder
//
//  Created by Hiromasa Nagamine on 10/25/17.
//  Copyright © 2017 Hiromasa Nagamine. All rights reserved.
//

import Foundation
import UIKit

public protocol StoryboardBuilderProtocol {
    static var storyboardName: String { get }
    static var storyboardID: String { get }
}

extension StoryboardBuilderProtocol {
    public static func getModule() -> Self {
        let storyboard = UIStoryboard(name: Self.storyboardName, bundle: nil)
        guard let module = storyboard.instantiateViewController(withIdentifier: Self.storyboardID) as? Self else {
            fatalError("Cannot find module has storyboardName \(Self.storyboardName) and storyboardID \(Self.storyboardID)")
        }

        return module
    }
}

public final class StoryboardBuilderExtension<Base> {
    public let base: Base
    public init(_ base: Base) {
        self.base = base
    }
}

public protocol StoryboardBuilderCompatible {
    associatedtype CompatibleType
    var sb: CompatibleType { get }
}

public extension StoryboardBuilderCompatible {
    public var sb: StoryboardBuilderExtension<Self> {
        return StoryboardBuilderExtension(self)
    }
}

