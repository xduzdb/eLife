//
//  AddCommentView.swift
//  eLifeApp
//
//  Created by zhangjiahe17 on 2024/7/18.
//

import Foundation
import UIKit

public class CommentView: UIView {
    let textArea     =  UITextView(frame: .zero)
    let button       =  UIButton(frame: .zero)
    let copyButton   =  UIButton(frame: .zero)
    
    let textHeight   =  400.0
    let textWidth    =  300.0
    
    let buttonHeight =  60.0
    let buttonWidth  =  200.0
    
    let spaceHeight  =  15.0
    
    override public init(frame: CGRect) {
        super.init(frame: .zero)
        backgroundColor = JHColor.JHDarkThemeColor
        setTextArea()
        setButton()
        setCopyButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setTextArea() {
        textArea.text               =  "123test123test123test123test123test123test123test123test123test123test123test123test123test123test123test123test123test123test123test123test123test123test123test123test123test123test123test123test123test123test123test123test123test123test123test123test123test123test123test123test123test123test123test123test123test123test123test123test123test123test123test123test123test123test123test123test123test123test123test123test123test123test123test123test123test123test123test123test123test123test123test123test123test123test123test123test123test123test"
        textArea.textColor          =  .black
        textArea.font               =  UIFont.systemFont(ofSize: 25.0)
        textArea.textAlignment      =  .justified
        textArea.isEditable         =  false
        textArea.showsVerticalScrollIndicator = false
        
        textArea.backgroundColor    =  .systemRed
        textArea.layer.cornerRadius =  10
        
        let imagePath = Bundle.main.path(forResource: "clock", ofType: "png")
        let imageView = UIImageView.init(image: UIImage(contentsOfFile: imagePath!))
        textArea.insertSubview(imageView, at: 20)
        imageView.frame = CGRect(
            x: textArea.frame.minX,
            y: textArea.frame.minY,
            width: textArea.frame.size.width,
            height: textArea.frame.size.height
        )
        
        addSubview(textArea)
        textArea.translatesAutoresizingMaskIntoConstraints  = false
        NSLayoutConstraint.activate([
            textArea.heightAnchor.constraint(equalToConstant: textHeight),
            textArea.widthAnchor.constraint(equalToConstant: textWidth),
            textArea.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            textArea.topAnchor.constraint(equalTo: self.topAnchor, constant: textHeight/2),
        ])
    }
    
    public func setButton() {
        button.setTitle("生成吧，我的评论！", for: .normal)
        button.backgroundColor     =  .init(red: 0.4, green: 0.8, blue: 0.4, alpha: 1)
        button.layer.cornerRadius  =  10
        
        addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints    = false
        NSLayoutConstraint.activate([
            button.heightAnchor.constraint(equalToConstant: buttonHeight),
            button.widthAnchor.constraint(equalToConstant: buttonWidth),
            button.topAnchor.constraint(equalTo: textArea.bottomAnchor, constant: spaceHeight),
            button.centerXAnchor.constraint(equalTo: self.centerXAnchor),
        ])
    }
    
    public func setCopyButton() {
        copyButton.setTitle("一键复制", for: .normal)
        copyButton.bounds               = button.bounds
        copyButton.backgroundColor      = UIColor.systemCyan
        copyButton.layer.cornerRadius       = 10
        
        addSubview(copyButton)
        copyButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            copyButton.heightAnchor.constraint(equalToConstant: buttonHeight),
            copyButton.widthAnchor.constraint(equalToConstant: buttonWidth),
            copyButton.topAnchor.constraint(equalTo: button.bottomAnchor, constant: spaceHeight),
            copyButton.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
}
