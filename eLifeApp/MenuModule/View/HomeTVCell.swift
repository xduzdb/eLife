//
//  HomeTVCell.swift
//  eLife
//
//  Created by zhangjiahe17 on 2024/7/19.
//

import UIKit

class HomeTVCell: JHTVCell {
    
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
        strLabel.textColor          = JHColor.JHDarkThemeTextColor
        contentView.addSubview(strLabel)
    }
    
    public func configCell(_ txt: String) {
        strLabel.text = txt
    }
}
