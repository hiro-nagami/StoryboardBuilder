//
//  SampleTableViewCell.swift
//  StoryboardBuilder
//
//  Created by Nagamine Hiromasa on 2018/11/23.
//  Copyright © 2018年 Hiromasa Nagamine. All rights reserved.
//

import Foundation
import UIKit
import WebKit
import StoryboardBuilder_iOS

class SampleTableViewCell: UITableViewCell, XibBuilderProtocol {
    static var xibName: String = "SampleTableViewCell"
    @IBOutlet weak var label: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.label.text = "This is SampleTableViewCell"
    }
}
