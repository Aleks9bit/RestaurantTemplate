//
//  NavigationBar.swift
//  Restaurant Template
//
//  Created by Alexey Bargin on 30.03.17.
//  Copyright © 2017 GoTo Inc. All rights reserved.
//

import UIKit

class NavigationBar: UINavigationBar {

    init(backButton button: UIBarButtonItem, title titleString: String, blur: Bool) {
        super.init(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 64))

        let navItem = UINavigationItem(title: "")
        let title = UILabel(frame: .zero)

        title.textColor = .white
        title.text = titleString
        button.tintColor = .white
        navItem.leftBarButtonItem = button
        navItem.titleView = title

        title.sizeToFit()

        setItems([navItem], animated: false)
        setBackgroundImage(UIImage(), for: .default)
        shadowImage = UIImage()

        var bounds = frame

        if blur {

            bounds.origin.y = -20
            bounds.size.height = bounds.height + 20

            let blurEffect = UIBlurEffect(style: .dark)
            let blurView = UIVisualEffectView(effect: blurEffect)

            blurView.isUserInteractionEnabled = false
            blurView.frame = bounds
            blurView.alpha = 0.8
            blurView.autoresizingMask = [.flexibleWidth, .flexibleHeight]

            insertSubview(blurView, at: 0)
        } else {
            backgroundColor = Color.from(type: .main)
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
