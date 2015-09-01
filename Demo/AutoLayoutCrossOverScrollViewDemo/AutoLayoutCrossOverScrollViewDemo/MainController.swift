//
//  MainController.swift
//  AutoLayoutCrossOverScrollViewDemo
//
//  Created by Fasa Mo on 15/9/1.
//  Copyright (c) 2015年 FasaMo. All rights reserved.
//

import UIKit

class MainController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Navigation
    
    @IBAction func showCodeController() {
        navigationController?.pushViewController(HOCCCodeController(), animated: true)
    }

}
