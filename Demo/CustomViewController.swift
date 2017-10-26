//
//  CustomViewController.swift
//  StoryboardBuilder
//
//  Created by Hiromasa Nagamine on 10/25/17.
//  Copyright © 2017 Hiromasa Nagamine. All rights reserved.
//

import UIKit
import StoryboardBuilder_iOS

class CustomViewController: UIViewController, StoryboardBuilderProtocol {
    static var storyboardName: String = "Main"
    static var storyboardID: String = String(describing: CustomViewController.self)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let view = XibBuilder<SampleView>.generate()
        view.center = self.view.center
        self.view.addSubview(view)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

