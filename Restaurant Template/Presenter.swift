//
//  Presenter.swift
//  Restaurant Template
//
//  Created by Alexey Bargin on 30.03.17.
//  Copyright © 2017 GoTo Inc. All rights reserved.
//

import Foundation
import SafariServices

class Presenter {

    static func open(url: URL, from controller: UIViewController) {

        let safariViewController = SFSafariViewController(url: url, entersReaderIfAvailable: false)

        safariViewController.preferredBarTintColor = Color.from(type: .main)
        safariViewController.preferredControlTintColor = .white

        controller.present(safariViewController, animated: true)
        return
    }

    static func present(viewControllerBy item: Item, from controller: UIViewController) {

        guard let segue = item.segue else { return }

        let storyboard = UIStoryboard(name: segue, bundle: nil)

        if segue == "ViewableMenu" {
            if let viewController = storyboard.instantiateViewController(withIdentifier: "\(segue)ViewController") as? ViewableMenuViewController {

                viewController.item = item
                controller.present(viewController, animated: true)
            }
            return
        }
        if segue == "Contact" {
            if let viewController = storyboard.instantiateViewController(withIdentifier: "\(segue)ViewController") as? ContactViewController {

                controller.present(viewController, animated: true)
            }
            return
        }

    }
}
