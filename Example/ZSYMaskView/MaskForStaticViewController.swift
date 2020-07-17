//
//  MaskForStaticViewController.swift
//  ZSYMaskView_Example
//
//  Created by Pigpig on 2020/7/17.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit
import ZSYMaskView

class MaskForStaticViewController: ZSYMaskViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    /*
     自定义遮罩层VC，根据自己传入的maskFrame来约束布局，
     放心，如果传的是maskView，库会帮你转成maskFrame，所以此处用maskFrame即可
     */
    override func reloadViews(index: Int) {
        let frame = maskFrame[index]
        if index == 0 {
            frame?.enumerated().forEach({ itemIndex, item in
                if itemIndex == 0 {
                    let label = UILabel(frame: CGRect(x: item.origin.x + 20, y: item.origin.y + 210, width: 100, height: 20))
                    label.text = "绿色View"
                    label.textColor = UIColor.green
                    view.addSubview(label)
                }
                if itemIndex == 1 {
                    let label = UILabel(frame: CGRect(x: item.origin.x, y: item.origin.y + 150, width: 100, height: 20))
                    label.text = "黄色View"
                    label.textColor = UIColor.orange
                    view.addSubview(label)
                }
            })
        }
        
        if index == 1 {
            view.subviews.forEach { item in
                item.removeFromSuperview()
            }
            frame?.enumerated().forEach({ itemIndex, item in
                if itemIndex == 0 {
                    let label = UILabel(frame: CGRect(x: item.origin.x + 30, y: item.origin.y + 150, width: 100, height: 20))
                    label.text = "紫色View"
                    label.textColor = UIColor.purple
                    view.addSubview(label)
                }
            })
        }
    }
}
