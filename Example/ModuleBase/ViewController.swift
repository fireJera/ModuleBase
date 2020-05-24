//
//  ViewController.swift
//  ModuleBase
//
//  Created by fireJera on 05/24/2020.
//  Copyright (c) 2020 fireJera. All rights reserved.
//

import UIKit
import ModuleBase

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let m = ModuleBaseTest()
        m.printTest()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

