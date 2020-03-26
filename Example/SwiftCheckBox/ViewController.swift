//
//  ViewController.swift
//  SwiftCheckBox
//
//  Created by Ian Magarzo on 03/25/2020.
//  Copyright (c) 2020 Ian Magarzo. All rights reserved.
//

import UIKit
import SwiftCheckBox

class ViewController: UIViewController {

    @IBOutlet weak var checkBoxButton: CheckBoxButton!
    @IBOutlet weak var stateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Requires to set [Type: Custom] from the storyBoard
        checkBoxButton.selectedBlock = { isSelected in
            self.stateLabel.text = isSelected ? "selected" : "unselected"
        }

        let button = CheckBoxButton(frame: CGRect(x: 100, y: 100, width: 80, height: 80))
        let label = UILabel(frame: button.frame.applying(CGAffineTransform(translationX: 0, y: 30.0)))
        button.selectedBlock = { label.text = $0 ? "selected" : "unselected" }
        view.addSubview(button)
        view.addSubview(label)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

