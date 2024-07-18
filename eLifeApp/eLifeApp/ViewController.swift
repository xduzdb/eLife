//
//  ViewController.swift
//  eLifeApp
//
//  Created by zhangjiahe17 on 2024/7/18.
//

import UIKit

@objc public class ViewController: UIViewController {

    let buttonHeight =  100.0
    let buttonWidth  =  200.0
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        title = "首页"
        view.backgroundColor = JHColor.JHDarkThemeColor
        // Do any additional setup after loading the view.
        let button = UIButton(type: .custom)
        button.setTitle("START", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 35)
        button.backgroundColor = JHColor.JHSystemColor
        button.addTarget(self, action: #selector(startNow(sender: )), for: .touchUpInside)
        button.layer.cornerRadius = 30
        
        view.addSubview(button)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            button.heightAnchor.constraint(equalToConstant: buttonHeight),
            button.widthAnchor.constraint(equalToConstant: buttonWidth),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
    }
    @objc public func startNow(sender: Any) {
        navigationController?.pushViewController(HomeViewController(), animated: true)
    }


}
