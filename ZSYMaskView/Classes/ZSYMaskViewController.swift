//
//  TestViewController.swift
//  MaskDemo
//
//  Created by Pigpig on 2020/7/9.
//  Copyright © 2020 zsy. All rights reserved.
//

import UIKit

open class ZSYMaskViewController: UIViewController, UITableViewDelegate {
    
    /*
     传Frame的方式，布局遮罩
     */
    public var maskFrame: [Int: [CGRect]] = [:]
    
    /*
     传View的方式，布局遮罩
     */
    public var maskView: [Int: [UIView]] = [:]
    public var maskColor: UIColor = UIColor(red: 0/255.0, green: 0/255.0, blue: 0/255.0, alpha: 0.5)
    public var maskCornerRadius: CGFloat = 0
    
    @objc public var maskInsets: [Int: [UIEdgeInsets]] = [:]
    /*
     点击是否需要dismiss，默认为true
     */
    public var touchShouldDismiss: Bool = true
    
    /*
     dismiss的callback
     */
    public var dismissCallback: (() -> Void)?
    
    /*
     点击之后的callback，把当前index回传
     */
    public var touchCallback: ((Int) -> Void)?
    
    /*
     pages可以为空，为空的情况下会根据maskFrame.key.count来判断有几步遮罩
     需要设值的场景：TableView中需要遮罩的View还未渲染，需要传pages，以防根据maskFrame.key.count判断的时候，提前dismiss
     */
    public var pages: Int?

    /*
     在ScrollView上做遮罩，最好把ScrollView传进来。
     当传进来的View在屏幕之外的时候，库会帮你做滚动处理
     */
    public var scrollView: UIScrollView?
    
    /*
     在TableView上做遮罩，最好把TableView传进来。
     当需要遮罩的View在屏幕之外的时候，库会帮你做滚动处理
     */
    public var tableView: UITableView?
    
    /*
     在TableView上做遮罩，最好把invisibleIndexPath传进来。
     当需要遮罩的View在屏幕之外的时候，把IndexPath传进来
     */
    public var invisibleIndexPath: [Int: IndexPath] = [:]
    
    var path: UIBezierPath!
    var shapeLayer = CAShapeLayer()
    var index: Int = 0
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = maskColor
        scrollView?.delegate = self
        tableView?.delegate = self
        setupMaskFrame()
    }
    
    open func setupMaskFrame() {
        if maskView.keys.count > 0 {
            maskView.keys.forEach { key in
                guard let sourceView = maskView[key] else { return }
                var rectArray: [CGRect] = []
                sourceView.forEach { item in
                    rectArray.append(view.convert(item.frame, from: item.superview))
                }
                maskFrame[key] = rectArray
            }
        }
        updatePath()
    }
    
    func setupMaskFrameWithIndex() {
        guard let sourceView = maskView[index] else { return }
        var rectArray: [CGRect] = []
        sourceView.forEach { item in
            rectArray.append(view.convert(item.frame, from: item.superview))
        }
        maskFrame[index] = rectArray
        updatePath()
    }
    
    open func updatePath() {
        if index == 0 {
            path = UIBezierPath(rect: CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height))
        } else {
            path.removeAllPoints()
            path = UIBezierPath(rect: CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height))
        }

        guard let frame = maskFrame[index] else { return }
        frame.enumerated().forEach { indexFrame, rect in
            if let scrollView = scrollView, rect.origin.y + rect.height > view.bounds.height {
                scrollView.scrollRectToVisible(rect, animated: true)
            }
            var newRect = rect
            let maskInset = maskInsets[index]
            newRect.origin.x += maskInset?[indexFrame].left ?? 0
            newRect.origin.y += maskInset?[indexFrame].top ?? 0
            newRect.size.width -= (maskInset?[indexFrame].right ?? 0) + (maskInset?[indexFrame].left ?? 0)
            newRect.size.height -= (maskInset?[indexFrame].bottom ?? 0) + (maskInset?[indexFrame].top ?? 0)
            path.append(UIBezierPath(roundedRect: newRect, cornerRadius: maskCornerRadius).reversing())
        }

        shapeLayer.path = path.cgPath
        view.layer.mask = shapeLayer
        reloadViews(index: index)
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
        var numbers = maskFrame.keys.count - 1
        if invisibleIndexPath.keys.count > 0 {
            var maxKey = 0
            invisibleIndexPath.keys.forEach { key in
                if key > maxKey {
                    maxKey = key
                }
            }
            numbers = maxKey
        }

        if numbers > self.index {
            self.index += 1
            if let indexPath = invisibleIndexPath[index], let tempTableView = tableView {
                tempTableView.scrollToRow(at: indexPath, at: .middle, animated: true)
            } else {
                self.updatePath()
            }
            touchCallback?(index)
            return
        }
        if touchShouldDismiss {
            dismissCallback?()
            dismiss(animated: true, completion: nil)
        }
    }
}

extension ZSYMaskViewController: UIScrollViewDelegate {
    public func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        if let indexPath = invisibleIndexPath[index], let tempTableView = tableView {
            maskView[index] = [tempTableView.cellForRow(at: indexPath)!]
        }
        setupMaskFrameWithIndex()
    }
}
