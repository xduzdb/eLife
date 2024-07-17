//
//  ViewController.swift
//  eLife
//
//  Created by zhangjiahe17 on 2024/7/17.
//

import UIKit

@objc public class ViewController: UIViewController {
    
    let button =  UIButton(type: .custom)
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        button.setTitle("点我", for: .normal)
        button.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        button.backgroundColor = UIColor.blue
        button.addTarget(self, action: #selector(pushVC(button:)), for: .touchUpInside)
        view.addSubview(button)
        
    }
    
    @objc func pushVC(button: UIButton) -> Void {
        let viewC = GenerateTextController()
        navigationController?.pushViewController(viewC, animated: true)
    }
}
