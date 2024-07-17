//
//  HomeTVCell.swift
//  eLife
//
//  Created by zhangjiahe17 on 2024/7/19.
//

import UIKit

class HomeTVCell: UITableViewCell {
    
    var originFrame: CGRect = .zero
    let strLabel            = UILabel()
    let spaceHeight         = GlobalProperties.shared.spaceHeight
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setCell()
        setStrLabel()
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
    
    override func layoutSubviews() {
        super.layoutSubviews()
        strLabel.frame = CGRect(
            x: bounds.minX,
            y: bounds.minY,
            width: 200,
            height: contentView.frame.height
        )
        strLabel.center = contentView.center
    }
    
    public func setCell() {
        backgroundColor             = .clear
        contentView.backgroundColor = JHColor.JHDarkThemeCellColor
        selectionStyle              = .none
    }
    
    public func setStrLabel() {
        strLabel.numberOfLines      = 1
        strLabel.font               = .systemFont(ofSize: 16)
        strLabel.textAlignment      = .center
        strLabel.backgroundColor    = .clear
        strLabel.textColor          = .black
        contentView.addSubview(strLabel)
    }
    
    public func configCell(_ txt: String) {
        strLabel.text = txt
    }
}
