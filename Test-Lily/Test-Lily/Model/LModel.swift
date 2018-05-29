//
//  LModel.swift
//  Test-Lily
//
//  Created by lily on 2018/5/29.
//  Copyright © 2018年 Lily. All rights reserved.
//

import UIKit
typealias ModelBlock = (_ success:Bool) -> Void
class LModel: NSObject {
    var dataArr = [LData]()
    
    func getData(block: @escaping ModelBlock) {
        LHttpManager.shared.getData("http://static.youshikoudai.com/mockapi/data") {[weak self] (data) in
            guard let dataArray = data as? [[String: Any]] else {
                return
            }
            guard let strongSelf = self else {
                return
            }
            for dic in dataArray {
                let model = LData()
                model.setValuesForKeys(dic)
                strongSelf.dataArr.append(model)
            }
            block(true)
        }
    }
}
