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

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let view = SampleView.getModule()
        view.frame.origin = .zero
        self.view.addSubview(view)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.sb.register(cellClass: SampleTableViewCell.self)

        self.tableView.sb.register(cellClasses: [
            SampleTableViewCell.self,
            SampleTableViewCell.self,
            SampleTableViewCell.self
        ])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


extension CustomViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.sb.dequeueReusableCell(clazz: SampleTableViewCell.self)

        return cell
    }
}
