//
//  MaskForTableViewController.swift
//  ZSYMaskView_Example
//
//  Created by Pigpig on 2020/7/17.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit
import ZSYMaskView

class ZSYTableViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let array: [String] = ["line1", "line2", "line3", "line4", "line5", "line6", "line7", "line8", "line9", "line10"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.orange
        
        tableView.rowHeight = 100
        let nibName = String.init(describing: CustomTableViewCell.self)
        self.tableView.register(UINib.init(nibName: nibName, bundle: nil), forCellReuseIdentifier: nibName)
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func sendFrameButtonClick(_ sender: UIButton) {
        let vc = ZSYMaskViewController()
        let cell1 = tableView.cellForRow(at: IndexPath(row: 1, section: 0))
        let frame1 = view.convert(cell1!.frame, from: cell1!.superview)
        let cell2 = self.tableView.cellForRow(at: IndexPath(row: 4, section: 0)) as! CustomTableViewCell
        let frame2 = view.convert(cell2.cellView1.frame, from: cell2.cellView1.superview)
        vc.maskFrame = [0: [sender.frame, frame1], 1: [frame2]]
        present(vc, animated: true, completion: nil)
    }
    
    @IBAction func sendViewButtonClick(_ sender: UIButton) {
        let vc = ZSYMaskViewController()
        if let cellView = tableView.cellForRow(at: IndexPath(row: 3, section: 0)) as? CustomTableViewCell {
            vc.maskView = [0: [sender], 1: [tableView.cellForRow(at: IndexPath(row: 1, section: 0))!], 2: [cellView.cellView2]]
            vc.invisibleIndexPath = [3: IndexPath(row: 7, section: 0)]
            vc.tableView = tableView
            vc.maskInsets = [3: [UIEdgeInsets(top: 0, left: 100, bottom: 0, right: 100)]]
            present(vc, animated: true, completion: nil)
        }
    }
}

extension ZSYTableViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if array.count <= 0 {
            return UITableViewCell()
        }
        if indexPath.row < 3 {
            let cell = UITableViewCell.init(style: UITableViewCell.CellStyle.default, reuseIdentifier: "CellIdentifier")
            cell.textLabel?.text = array[indexPath.row]
            
            return cell
            
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: String.init(describing: CustomTableViewCell.self), for: indexPath) as! CustomTableViewCell
        cell.cellView1.titleLabel.text = "title1"
        cell.cellView1.contentLabel.text = "content1"
        cell.cellView2.titleLabel.text = "title2"
        cell.cellView2.contentLabel.text = "content2"
        cell.cellView3.titleLabel.text = "title3"
        cell.cellView3.contentLabel.text = "content3"
        return cell
    }
}

