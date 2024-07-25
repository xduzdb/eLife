//
//  JHViewController.swift
//  eLife
//
//  Created by zhangjiahe17 on 2024/7/23.
//

import UIKit

@objc public class JHViewController: UIViewController, UINavigationControllerDelegate {
    
//    let switchStatus: Bool = ViewController().switchTheme.isOn
    
    var rightBtnTitleColor: UIColor?
    var rightBtn: UIButton?
    var isViewShow = false
    var leftBtn: UIButton?
    
    public override func viewDidLoad() {
        super.viewDidLoad()
//        if switchStatus {
//            view.backgroundColor = JHColor.JHDarkThemeColor
//        } else {
            view.backgroundColor = JHColor.JHLightThemeColor
//        }
//        view.backgroundColor = UIExColor.jmViewBgColor
        // 兼容iOS10
        automaticallyAdjustsScrollViewInsets = true
        // 导航不透明，而且保证页面（0,0）开始
        navigationController?.navigationBar.isTranslucent = false
        extendedLayoutIncludesOpaqueBars = true
        modalPresentationStyle = .fullScreen
    }

    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if self != self.navigationController?.viewControllers.first {
            setLeftBtnWith(imageName: "iconBack", titleName: nil)
        }
    }
    
    public override func viewDidAppear(_ animated: Bool) {
        // [LaunchTimeCount launchTime:3];
        isViewShow = true
        super.viewDidAppear(animated)
        if navigationController?.viewControllers.count == 1 {
            navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        } else {
            navigationController?.interactivePopGestureRecognizer?.isEnabled = true
        }
        //不添加这句话  左滑返回会失效
        navigationController?.interactivePopGestureRecognizer?.delegate = nil
    }
    
    
    public override func viewWillDisappear(_ animated: Bool) {
        isViewShow = false
        super.viewWillDisappear(animated)
    }
    
    public func jmSetHiddenNavigationBar() {
//        navigationController.delegate = self;
        navigationController?.delegate = self
    }
    
    
    public func setLeftBtnWith(imageName: String, titleName: String?) {
        let leftBtnItem = createBarBtnItemWith(imageName: imageName, titleName: titleName, action: #selector(leftBtnPressed))
//        rightBtn?.contentHorizontalAlignment = .right
//        let negativeSeperator = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
//        negativeSeperator.width = -10
//        navigationItem.rightBarButtonItems = [negativeSeperator, rightBtnItem]
        leftBtn = leftBtnItem.customView as? UIButton
//        leftBtn?.contentHorizontalAlignment = .left
        let negativeSeperator = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        negativeSeperator.width = 10
        navigationItem.leftBarButtonItems = [negativeSeperator, leftBtnItem]
    }
    
    @objc public func leftBtnPressed(button: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    
    public func setRightBtnWith(stateNormalImage imageName: String?, titleName titleName: String?) {
        
        guard let imageName = imageName, !imageName.isEmpty else {
            self.navigationItem.setRightBarButtonItems(nil, animated: true)
            return
        }
        
        let rightBtnItem: UIBarButtonItem = createBarBtnItemWith(imageName: imageName, titleName: titleName, action: #selector(rightBtnPressed))
        rightBtn = rightBtnItem.customView as? UIButton
        rightBtn?.contentHorizontalAlignment = .right
        let negativeSeperator = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        negativeSeperator.width = -10
        navigationItem.rightBarButtonItems = [negativeSeperator, rightBtnItem]
    }
    //子类实现
    @objc public func rightBtnPressed(button: UIButton) {
        
    }
    
    public func createBarBtnItemWith(imageName: String, titleName: String?, action: Selector) -> UIBarButtonItem {
        
        let button = UIButton(type: .custom)
        let buttonItem: UIBarButtonItem = UIBarButtonItem(customView: button)
//        COJMNaviButton* button = [COJMNaviButton buttonWithType:UIButtonTypeCustom];
        button.showsTouchWhenHighlighted = false
        button.adjustsImageWhenHighlighted = false
        button.isExclusiveTouch = true
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14.0)
        let color = rightBtnTitleColor != nil ? rightBtnTitleColor : UIColor.black
        button.setTitleColor(color, for: .normal)
        button.contentHorizontalAlignment = .left
        button.addTarget(self, action: action, for: .touchUpInside)
        if let titleName = titleName {
//            let size: CGSize = titleName.getDisplaySize(withWidth: 120, font: button.titleLabel?.font)
            button.frame = CGRect(x: 0, y: 0, width: 120, height: 44)
            button.setTitle(titleName, for: .normal)
        } else {
            button.frame = CGRect(x: 0, y: 0, width: 34, height: 44)
            buttonItem.width = 44
            button.setImage(UIImage(named: imageName), for: .normal)
        }
        return buttonItem
    }
    
}

public class UIExColor {
    
    public static let jmViewBgColor = jmColorFromHex(hex: 0xF8F9FA)
    public static let jmTextColot = jmColorFromHex(hex: 0x333333)
    
    public static func jmColorFromHex(hex: NSInteger) -> UIColor {
        return UIColor(
            red: CGFloat(
                (
                    hex & 0xff0000
                )>>16
            )/255.0,
            green: CGFloat(
                (
                    hex & 0x00ff00
                )>>8
            )/255.0,
            blue: CGFloat(
                (
                    hex & 0x0000ff
                )
            )/255.0,
            alpha: 1
        )
    }
}

