//
//  MaskForScrollViewController.swift
//  ZSYMaskView_Example
//
//  Created by Pigpig on 2020/7/17.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit
import ZSYMaskView

class ZSYScrollViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var greenView: UIView!
    @IBOutlet weak var yellowView: UIView!
    @IBOutlet weak var blueView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let vc = ZSYMaskViewController()
        vc.maskView = [0: [greenView], 1: [blueView], 2: [yellowView]]
        vc.scrollView = scrollView
        present(vc, animated: true, completion: nil)
    }
}
