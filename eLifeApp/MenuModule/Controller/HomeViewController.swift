//
//  HomeViewController.swift
//  eLife
//
//  Created by zhangjiahe17 on 2024/7/19.
//

import Foundation
import UIKit

@objc public class HomeViewController: JHViewController {
    let modelArray  = HomeTVModel().getCellArray()
    let baseTable   = UITableView(frame: .zero, style: .grouped)
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        title = "首页"
        configTableView()
    }
    
    public override func viewWillTransition(to size: CGSize, with coordinator: any UIViewControllerTransitionCoordinator) {
        view.layoutIfNeeded()
    }
}

extension HomeViewController: UITableViewDelegate {
    
    public func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        var corners: UIRectCorner
        let isLast: Bool = indexPath.row == tableView.numberOfRows(inSection: indexPath.section) - 1
        if (indexPath.row == 0) {
            corners = [.topLeft, .topRight]
        } else if (isLast) {
            corners = [.bottomLeft, .bottomRight]
        } else {
            corners = []
        }
        cell.contentView.applyRoundedCorner(corners: corners, radius: 10)
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let curArray = modelArray[indexPath.section][indexPath.row]
        if curArray == "桌面时钟" {
            let viewC = ClockViewController()
            navigationController?.pushViewController(viewC, animated: true)
        } else if curArray == "凑字数评论" {
            let viewC = GenerateViewController()
            navigationController?.pushViewController(viewC, animated: true)
        } else if curArray == "自己写的UITableView" {
            let ViewC = JHUITableViewController()
            
        } else {
            showToast(message: "请联系开发者修改:18730391026")
        }
    }
    
}

extension HomeViewController: UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modelArray[section].count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = baseTable.dequeueReusableCell(
            withIdentifier: "menuCell",
            for: indexPath
        ) as! HomeTVCell
        
        let curArrayStr = modelArray[indexPath.section][indexPath.row]
        cell.configCell(curArrayStr)
        return cell
    }
}

extension HomeViewController {
    
    public func configTableView() {
        
        baseTable.dataSource            = self
        baseTable.delegate              = self
        baseTable.separatorStyle        = .none
        baseTable.estimatedRowHeight    = 38.0
        baseTable.backgroundColor       = JHColor.JHDarkThemeColor
//        baseTable.backgroundColor       = JHColor.JHDarkThemeCellColor
        
        baseTable.register(HomeTVCell.self, forCellReuseIdentifier: "menuCell")
        
        view.addSubview(baseTable)
        
        baseTable.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            baseTable.topAnchor.constraint(equalTo: view.topAnchor),
            baseTable.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            baseTable.leftAnchor.constraint(equalTo: view.leftAnchor),
            baseTable.rightAnchor.constraint(equalTo: view.rightAnchor),
            
        ])
    }
}
