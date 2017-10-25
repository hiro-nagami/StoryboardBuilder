//
//  StoryboardBuilder.swift
//  StoryboardBuilder
//
//  Created by Hiromasa Nagamine on 10/25/17.
//  Copyright © 2017 Hiromasa Nagamine. All rights reserved.
//

import Foundation
import UIKit

protocol StoryboardBuilderProtocol {
    static var storyboardName: String { get }
    static var storyboardID: String { get }
}

struct StoryboardBuilder<T: StoryboardBuilderProtocol> {
    static func generate() -> T {
        return UIStoryboard(name: T.storyboardName, bundle: nil).instantiateViewController(withIdentifier: T.storyboardID) as! T
    }
}
