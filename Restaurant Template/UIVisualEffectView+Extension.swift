//
//  UIVisualEffectView+Extension.swift
//  Restaurant Template
//
//  Created by Alexey Bargin on 28.03.17.
//  Copyright © 2017 GoTo Inc. All rights reserved.
//

import UIKit

@IBDesignable
class UIVisualEffectViewExtension: UIVisualEffectView {

   // MARK: - Border
    @IBInspectable public var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            if cornerRadius > 0 {
                clipsToBounds = true
            } else {
                clipsToBounds = false
            }
        }
    }
}
