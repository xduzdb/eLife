//
//  ViewController.swift
//  eLifeApp
//
//  Created by zhangjiahe17 on 2024/7/18.
//

import UIKit

@objc public class ViewController: JHViewController {

    let buttonHeight =  100.0
    let buttonWidth  =  200.0
    let switchHeight =  40.0
    let switchWidth  =  60.0
    
    let switchTheme = UISwitch(frame: .zero)
    let button = UIButton(type: .custom)
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        title = "首页"
        view.backgroundColor = JHColor.JHDarkThemeColor
        // Do any additional setup after loading the view.
        
        button.setTitle("START", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 35)
        button.backgroundColor = JHColor.JHSystemColor
        button.addTarget(self, action: #selector(startNow(sender: )), for: .touchUpInside)
        button.layer.cornerRadius = 30
        
        switchTheme.setOn(true, animated: true)
//        switchTheme.addTarget(self, action: #selector(changeDarkMode(sender: )), for: .touchUpInside)
        
        view.addSubview(button)
        view.addSubview(switchTheme)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        switchTheme.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            button.heightAnchor.constraint(equalToConstant: buttonHeight),
            button.widthAnchor.constraint(equalToConstant: buttonWidth),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            switchTheme.heightAnchor.constraint(equalToConstant: switchHeight),
            switchTheme.widthAnchor.constraint(equalToConstant: switchWidth),
            switchTheme.centerXAnchor.constraint(equalTo: button.centerXAnchor),
            switchTheme.topAnchor.constraint(equalTo: button.bottomAnchor, constant: SystemHeight.spaceHeight),
        ])
        
    }
    @objc public func startNow(sender: Any) {
        navigationController?.pushViewController(HomeViewController(), animated: true)
    }
    
    @objc public func changeDarkMode(sender: [Any]) {
        
    }


}
