//
//  LTableViewModel.swift
//  Test-Lily
//
//  Created by lily on 2018/5/29.
//  Copyright © 2018年 Lily. All rights reserved.
//

import UIKit
typealias LCellRenderBlock = (_ indexPath: IndexPath, _ tableView: UITableView) -> UITableViewCell

class LTableViewModel: NSObject, UITableViewDelegate, UITableViewDataSource {
    
    var cellRender: LCellRenderBlock! // 创建cell的block
    var cellHeight = UITableViewAutomaticDimension // cell高
    var estimatedHeight:CGFloat = 50// 预估高度
    var sectionCount = 0// 区数
    var rowCount = 0// 行数
    
    /** 区数 */
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return sectionCount
    }
    /** 行数 */
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rowCount
    }
    /** 行高 */
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }
    /** cell */
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = cellRender(indexPath, tableView)
        return cell
    }
    /** 预估高度 */
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return estimatedHeight
    }
        
}
