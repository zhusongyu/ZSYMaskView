//
//  ViewController.swift
//  MaskDemo
//
//  Created by 朱宋宇 on 2020/7/9.
//  Copyright © 2020 zsy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    let array = ["line1", "line2", "line3", "line4", "line5", "line6", "line7", "line8", "line9", "line10"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.orange

        tableView.rowHeight = 50
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonClick(_ sender: Any) {
        let vc = TestViewController()
        let cell1 = tableView.cellForRow(at: IndexPath(row: 1, section: 0))
        let frame1 = tableView.convert(cell1!.frame, to: view)
        let cell2 = self.tableView.cellForRow(at: IndexPath(row: 2, section: 0))
        let frame2 = self.tableView.convert(cell2!.frame, to: self.view)
        vc.maskFrame = [0: [button.frame, frame1], 1: [button.frame, frame2]]
        present(vc, animated: false, completion: nil)
    }
}
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell.init(style: UITableViewCell.CellStyle.default, reuseIdentifier: "CellIdentifier")
        cell.textLabel?.text = array[indexPath.row]
        
        return cell
    }
}

