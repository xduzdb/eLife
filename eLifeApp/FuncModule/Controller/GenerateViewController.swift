//
//  ViewController.swift
//  eLife
//
//  Created by zhangjiahe17 on 2024/7/17.
//

import UIKit

@objc public class GenerateViewController: JHViewController {
    
    var testFlag =  true
    let commentView = CommentView()
    var oldText: String!
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let ambiguousView = UIVisualEffectView(effect: UIBlurEffect(style: .light))
        ambiguousView.frame = CGRect(x: 40, y: 4, width: 100, height: 20)
        oldText = commentView.textArea.text
        
        commentView.button.addTarget(self, action: #selector(generateText), for: .touchUpInside)
        commentView.copyButton.addTarget(self, action: #selector(copyCommentText), for: .touchUpInside)
        
        view.addSubview(commentView)
        commentView.textArea.insertSubview(ambiguousView, at: 0)
        
        commentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            commentView.topAnchor.constraint(equalTo:       view.topAnchor),
            commentView.bottomAnchor.constraint(equalTo:    view.bottomAnchor),
            commentView.leftAnchor.constraint(equalTo:      view.leftAnchor),
            commentView.rightAnchor.constraint(equalTo:     view.rightAnchor),
        ])
    }
}
//方法
extension GenerateViewController {
    @objc public func generateText() {
        let newText = "lalalala"
        if testFlag {
            commentView.textArea.text = newText
            testFlag = false
        } else {
            commentView.textArea.text = oldText
            testFlag = true
        }
    }
    
    @objc public func copyCommentText() {
        showToast(message: "复制成功了哥们")
        let pasteBoard = UIPasteboard.general
        pasteBoard.string = commentView.textArea.text
    }
}

