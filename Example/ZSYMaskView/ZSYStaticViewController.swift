//
//  MaskForStaticViewController.swift
//  ZSYMaskView_Example
//
//  Created by Pigpig on 2020/7/17.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit

class ZSYStaticViewController: UIViewController {
    @IBOutlet weak var greenView: UIView!
    @IBOutlet weak var blueView: UIView!
    @IBOutlet weak var orangeView: UIView!
    @IBOutlet weak var purpleView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let vc = MaskForStaticViewController()
        vc.maskView = [0: [greenView, orangeView], 1: [purpleView]]
        present(vc, animated: true, completion: nil)
    }
}
