//
//  UIView+Extension.swift
//  Catstagram
//
//  Created by Doy Kim on 2022/03/30.
//

import UIKit

extension UIView {
    // IB: Interface Builder의 inspectorbale: 인스펙터로 활용할 수 있다는 점. 항목이 추가된다는 것
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return  layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
}
