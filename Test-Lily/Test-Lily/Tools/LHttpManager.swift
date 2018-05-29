//
//  LHttpManager.swift
//  Test-Lily
//
//  Created by lily on 2018/5/29.
//  Copyright © 2018年 Lily. All rights reserved.
//

import Foundation
import Alamofire
class LHttpManager {
    typealias SuccessBlock = (_ respondData: Any) -> Void
    private let alamofireManager: SessionManager!
    static let shared = LHttpManager()
    
    private init() {
        // 设置请求的超时时间
        let config = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = 15
        alamofireManager = Alamofire.SessionManager(configuration: config)
    }
    func getData(_ url: String, successBlock: @escaping SuccessBlock) {
        
        alamofireManager.request(url, method: .get, parameters: nil, encoding: URLEncoding.httpBody, headers: ["Content-Type": "application/x-www-form-urlencoded; charset=utf-8"]).responseJSON { (respond) in
            switch respond.result {
            case .success(let value):
                successBlock(value)
            default:
                break
            }
        }
    }
}
