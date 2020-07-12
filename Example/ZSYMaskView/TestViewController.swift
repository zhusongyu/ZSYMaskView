//
//  TestViewController.swift
//  MaskDemo
//
//  Created by Pigpig on 2020/7/9.
//  Copyright © 2020 zsy. All rights reserved.
//

import UIKit
import ZSYMaskView

class TestViewController: ZSYMaskViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    ///自定义遮罩层VC，根据自己传入的maskFrame来约束布局
    override func reloadViews(index: Int) {
        let frame = maskFrame[index]
        if index == 0 {
            frame?.enumerated().forEach({ itemIndex, item in
                if itemIndex == 0 {
                    let label = UILabel(frame: CGRect(x: item.origin.x - 30, y: item.origin.y + 50, width: 100, height: 20))
                    label.text = "这是按钮"
                    label.textColor = UIColor.white
                    view.addSubview(label)
                }
                if itemIndex == 1 {
                    let label = UILabel(frame: CGRect(x: item.origin.x + 30, y: item.origin.y + 60, width: 100, height: 20))
                    label.text = "这是cell1"
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
                    let label = UILabel(frame: CGRect(x: item.origin.x + 30, y: item.origin.y + 60, width: 100, height: 20))
                    label.text = "这是cell2"
                    label.textColor = UIColor.orange
                    view.addSubview(label)
                }
            })
        }
    }
}
