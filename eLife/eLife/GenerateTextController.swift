//
//  GenerateTextController.swift
//  eLife
//
//  Created by zhangjiahe17 on 2024/7/17.
//

import UIKit

@objc public class GenerateTextController: UIViewController {
    
    let textArea     =  UITextView(frame: .zero)
    let button       =  UIButton(frame: .zero)
    let textHeight   =  300.0
    let textWidth    =  250.0
    let buttonHeight =  40.0
    let buttonWidth  =  200.0
    let spaceHeight  =  15.0
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        textArea.backgroundColor    =  UIColor.black
        textArea.alpha              =  0.3
        textArea.layer.cornerRadius =  10
        textArea.text     =  "666666"
        textArea.textColor          =  UIColor.white
        textArea.font               =  UIFont.systemFont(ofSize: 20)
        textArea.textAlignment      =  .justified
        
        button.setTitle("生成吧，我的评论！", for: .normal)
        button.backgroundColor     =  UIColor.blue
        button.layer.cornerRadius  =  10
        button.addTarget(self, action: #selector(generateText), for: .touchUpInside)
        
        view.addSubview(textArea)
        view.addSubview(button)
        textArea.translatesAutoresizingMaskIntoConstraints  = false
        button.translatesAutoresizingMaskIntoConstraints    = false
        
        NSLayoutConstraint.activate([
            textArea.heightAnchor.constraint(equalToConstant: textHeight),
            textArea.widthAnchor.constraint(equalToConstant: textWidth),
            textArea.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textArea.topAnchor.constraint(equalTo: view.centerYAnchor, constant: -textHeight/2),
            
            button.heightAnchor.constraint(equalToConstant: buttonHeight),
            button.widthAnchor.constraint(equalToConstant: buttonWidth),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.topAnchor.constraint(equalTo: textArea.bottomAnchor, constant: spaceHeight),
        ])
        
    }
}
//方法
extension GenerateTextController {
    @objc func generateText() {
        textArea.text = "hahahahahahhah"
    }
}
