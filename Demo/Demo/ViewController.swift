//
//  ViewController.swift
//  Demo
//
//  Created by Ryan Peters on 4/22/20.
//  Copyright © 2020 Ryan Peters. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tappedButton(_ sender: Any) {
        let vc = RPAppBoardViewController()
        present(vc, animated: true, completion: nil)
    }
    
}

