//
//  HomeArrayModel.swift
//  eLife
//
//  Created by zhangjiahe17 on 2024/7/19.
//

import UIKit

class HomeTVModel: NSObject {
    
    private var arrayModel: [[String]]!
    
    override init() {
        super.init()
        var section0Arr: [String] = []
        section0Arr.append("桌面时钟")
        section0Arr.append("凑字数评论")
        section0Arr.append("自己写的UITableView")
        section0Arr.append("undefined")
        arrayModel = [
            section0Arr,
        ]
    }
    
    public func getCellArray() -> [[String]] {
        return arrayModel
    }
    
}
