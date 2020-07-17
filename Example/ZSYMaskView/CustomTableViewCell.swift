//
//  CustomTableViewCell.swift
//  ZSYMaskView_Example
//
//  Created by Pigpig on 2020/7/16.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    @IBOutlet weak var cellView1: CustomCellView!
    @IBOutlet weak var cellView2: CustomCellView!
    @IBOutlet weak var cellView3: CustomCellView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
