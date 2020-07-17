//
//  ViewController.swift
//  MaskDemo
//
//  Created by Pigpig on 2020/7/9.
//  Copyright © 2020 zsy. All rights reserved.
//

import UIKit

///底层VC
class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func maskForStatic(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let controller = storyboard.instantiateViewController(withIdentifier: "ZSYStaticViewController") as? ZSYStaticViewController {
            self.navigationController?.show(controller, sender: nil)
        }
    }
    
    @IBAction func maskForScroll(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let controller = storyboard.instantiateViewController(withIdentifier: "ZSYScrollViewController") as? ZSYScrollViewController {
            self.navigationController?.show(controller, sender: nil)
        }
    }
    
    @IBAction func maskForTable(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let controller = storyboard.instantiateViewController(withIdentifier: "ZSYTableViewController") as? ZSYTableViewController {
            self.navigationController?.show(controller, sender: nil)
        }
    }
}

