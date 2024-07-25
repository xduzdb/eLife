//
//  JHTVCell.swift
//  eLife
//
//  Created by zhangjiahe17 on 2024/7/23.
//

import UIKit

class JHTVCell: UITableViewCell {
    
    var originFrame: CGRect = .zero
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var frame: CGRect
    {
        set {
            let margin = 15.0
            originFrame = newValue
            super.frame = CGRect(
                x: newValue.minX + margin,
                y: newValue.minY,
                width: newValue.width - margin * 2,
                height: newValue.height
            )
        }
        
        get {
            return originFrame
        }
    }

}
