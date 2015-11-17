//
//  ViewController.swift
//  CircularProgressExample
//
//  Created by Phillip Harris on 11/17/15.
//  Copyright © 2015 Phillip Harris. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var progressView: CircularProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        progressView.progress = 0.67
    }
}