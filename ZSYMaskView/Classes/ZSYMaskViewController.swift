//
//  TestViewController.swift
//  MaskDemo
//
//  Created by 朱宋宇 on 2020/7/9.
//  Copyright © 2020 zsy. All rights reserved.
//

import UIKit

open class ZSYMaskViewController: UIViewController {
    
    public var maskFrame: [Int: [CGRect]] = [:]
    public var maskColor: UIColor = UIColor(red: 0/255.0, green: 0/255.0, blue: 0/255.0, alpha: 0.5)
    public var cornerRadius: CGFloat = 0
    public var touchShouldDismiss: Bool = true
    public var dissmissCallback: (() -> Void)?
    var path: UIBezierPath!
    var shapeLayer = CAShapeLayer()
    var index: Int = 0
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = maskColor
        updatePath()
        reloadViews(index: index)
    }
    
    func updatePath() {
        if index == 0 {
            path = UIBezierPath(rect: CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height))
        } else {
            path.removeAllPoints()
            path = UIBezierPath(rect: CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height))
        }
        
        guard let frame = maskFrame[index] else { return }
        frame.forEach { item in
            path.append(UIBezierPath(roundedRect: item, cornerRadius: cornerRadius).reversing())
        }
        shapeLayer.path = path.cgPath
        view.layer.mask = shapeLayer
    }
    
    open func reloadViews(index: Int) {}
    
    
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        modalPresentationStyle = .custom
        modalTransitionStyle = .crossDissolve
    }

    public required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if maskFrame.keys.count - 1 > self.index {
            self.index += 1
            self.updatePath()
            self.reloadViews(index: self.index)
        } else {
            dismiss(animated: true, completion: nil)
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
