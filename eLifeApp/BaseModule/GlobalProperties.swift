//
//  GlobalProperties.swift
//  eLife
//
//  Created by zhangjiahe17 on 2024/7/19.
//

import Foundation
import UIKit

struct GlobalProperties {
    static let shared = GlobalProperties()
    var spaceHeight = 20.0
}

struct JHColor {
    static let JHSystemColor = UIColor.init(red: 0.3, green: 0, blue: 0.8, alpha: 1)
    static let JHDarkThemeColor = UIColor.black
    static let JHLightThemeColor = UIColor.white
    static let JHDarkThemeCellColor = UIColor.init(red: 0.1, green: 0.1, blue: 0.1, alpha: 1)
    
//    static let JHIconPurple = UIColor.init(red: 0.4, green: 0, blue: 1, alpha: 1)
}

extension UIViewController {
    
    func showToast(message: String) {
        let toastView = ToastView(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        toastView.showMessage(message)
    }
}

extension UIView {
    
    func applyRoundedCorner(corners: UIRectCorner, radius: Int) {
        let bPath = UIBezierPath(
            roundedRect: bounds,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        let sPath = CAShapeLayer()
        sPath.path = bPath.cgPath
        layer.mask = sPath
    }
}
