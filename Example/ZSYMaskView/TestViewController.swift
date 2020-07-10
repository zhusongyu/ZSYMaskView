//
//  TestViewController.swift
//  MaskDemo
//
//  Created by 朱宋宇 on 2020/7/9.
//  Copyright © 2020 zsy. All rights reserved.
//

import UIKit
import ZSYMaskView

class TestViewController: ZSYMaskViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
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
                    label.text = "这是cell"
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
                    let label = UILabel(frame: CGRect(x: item.origin.x - 60, y: item.origin.y + 50, width: 100, height: 20))
                    label.text = "这是按钮"
                    label.textColor = UIColor.white
                    view.addSubview(label)
                }
                if itemIndex == 1 {
                    let label = UILabel(frame: CGRect(x: item.origin.x + 30, y: item.origin.y + 60, width: 100, height: 20))
                    label.text = "这是cell"
                    label.textColor = UIColor.orange
                    view.addSubview(label)
                }
            })
        }
        

    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
