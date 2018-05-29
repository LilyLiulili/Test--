//
//  ViewController.swift
//  Test-Lily
//
//  Created by lily on 2018/5/29.
//  Copyright © 2018年 Lily. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    private let viewModel = LTableViewModel()
    private let model = LModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "首页"
        configTableView()
        getData()
    }
    
    private func configTableView(){
        tableView.delegate = viewModel
        tableView.dataSource = viewModel
        viewModel.sectionCount = 1
        viewModel.cellHeight = UITableViewAutomaticDimension
        tableView.register(UINib(nibName: "LilyTableViewCell", bundle: nil), forCellReuseIdentifier: "LilyTableViewCell")
        weak var weakSelf = self
        // 创建cell
        viewModel.cellRender = { indexPath,tablleView in
            guard let strongSelf = weakSelf else {
                return UITableViewCell()
            }
            let cell = tablleView.dequeueReusableCell(withIdentifier: "LilyTableViewCell", for: indexPath) as! LilyTableViewCell
            cell.headImageView.sd_setImage(with: URL(string: strongSelf.model.dataArr[indexPath.row].image))
            cell.infoLabel.text = strongSelf.model.dataArr[indexPath.row].text
            cell.AButtonBlock = {
                let AVC = AViewController()
                strongSelf.navigationController?.pushViewController(AVC, animated: true)
            }
            cell.BButtonBlock = {
                let BVC = BViewController()
                strongSelf.navigationController?.pushViewController(BVC, animated: true)
            }
            return cell
        }
    }
    
    // 获取数据
    private func getData() {
        model.getData {[weak self] (success) in
            guard let strongSelf = self else {
                return
            }
            if success {
                strongSelf.viewModel.rowCount = strongSelf.model.dataArr.count
                strongSelf.tableView.reloadData()
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

