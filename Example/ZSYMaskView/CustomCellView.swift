//
//  CustomCellView.swift
//  ZSYMaskView_Example
//
//  Created by Pigpig on 2020/7/16.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit

class CustomCellView: UIView {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    
    func setup() {
        let red = CGFloat.random(in: 0...255) / 255.0
        let green = CGFloat.random(in: 0...255) / 255.0
        let blue = CGFloat.random(in: 0...255) / 255.0
        backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layoutIfNeeded()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        loadViewFromNib()
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadViewFromNib()
        setup()
    }

    fileprivate func loadViewFromNib() {
        let bundle = Bundle(for: type(of: self))
        let nibName = String(describing: type(of: self))
        let nib = UINib.init(nibName: nibName, bundle: bundle)
        guard let view = nib.instantiate(withOwner: self, options: nil).first as? UIView else {
            return
        }
        insertSubview(view, at: 0)
        view.frame = self.bounds
        view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }

}
