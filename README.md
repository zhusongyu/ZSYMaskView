# ZSYMaskView

一个自定义程度极高的遮罩引导页。

## 示例
![Demo~](https://raw.githubusercontent.com/zhusongyu/ZSYMaskView/master/Example/images/zsymaskview.gif)

[![Build Status](https://travis-ci.org/zhusongyu/ZSYMaskView.svg?branch=master)](https://travis-ci.org/zhusongyu/ZSYMaskView)
[![Version](https://img.shields.io/cocoapods/v/ZSYMaskView.svg?style=flat)](https://cocoapods.org/pods/ZSYMaskView)
[![License](https://img.shields.io/cocoapods/l/ZSYMaskView.svg?style=flat)](https://cocoapods.org/pods/ZSYMaskView)
[![Platform](https://img.shields.io/cocoapods/p/ZSYMaskView.svg?style=flat)](https://cocoapods.org/pods/ZSYMaskView)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Usage

### Swift

自定义遮罩层VC，继承于ZSYMaskViewController，重写reloadViews(index: Int)，来刷新遮罩层，根据传入的index来判断当前进行到遮罩第几步。
```swift
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

```

底层VC，用来呼出遮罩层VC，并传入相应的maskFrame，负责遮罩frame的提取和present遮罩VC
```swift
import UIKit

///底层VC
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
        vc.maskFrame = [0: [button.frame, frame1], 1: [frame2]]
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

```

## Requirements

This library requires `iOS 8.0+`

## Installation

ZSYMaskView is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'ZSYMaskView'
```

## Author

ZSY, zhusongyu1990@163.com

## License

ZSYMaskView is available under the MIT license. See the LICENSE file for more info.