//
//  MainViewController.swift
//  Restaurant Template
//
//  Created by Alexey Bargin on 27.03.17.
//  Copyright © 2017 GoTo Inc. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var menuBarButton: UIBarButtonItem!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var scrollToCell: UIButton!
    @IBOutlet var backgroundView: UIView!
    @IBOutlet weak var backgroundBlurView: UIVisualEffectView!

    let itemViewModel = ItemViewModel.init()
    let titleLabel = UILabel(frame: .zero)

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.delegate = self
        collectionView.dataSource = self

        setupViews()
    }

    fileprivate func setupViews() {

        titleLabel.text = constWebsite
        titleLabel.textColor = .white

        collectionView.backgroundView = self.backgroundView

        let navItem = UINavigationItem()
        let image = UIImage(imageLiteralResourceName: "menu")
        let button = UIButton.init(type: .custom)

        button.setImage(image, for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: 20, height: 20)

        let menuBarButton = UIBarButtonItem(customView: button)

        navItem.leftBarButtonItem = menuBarButton
        navItem.titleView = titleLabel
        navItem.titleView?.alpha = 0
        titleLabel.sizeToFit()

        self.navigationController?.navigationBar.setItems([navItem], animated: false)

        if let revealViewController = self.revealViewController() {

            button.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
            view.addGestureRecognizer(revealViewController.panGestureRecognizer())
        }

        addBlurEffectToNavigationBar()
    }

    fileprivate func addBlurEffectToNavigationBar() {

        guard let navBar = self.navigationController?.navigationBar else { return }

        navBar.setBackgroundImage(UIImage(), for: .default)
        navBar.shadowImage = UIImage()

        var bounds = navBar.bounds

        bounds.origin.y = -20
        bounds.size.height = bounds.height + 20

        let blurEffect = UIBlurEffect(style: .dark)
        let blurViewForNavBar = UIVisualEffectView(effect: blurEffect)

        blurViewForNavBar.isUserInteractionEnabled = false
        blurViewForNavBar.frame = bounds
        blurViewForNavBar.alpha = 0.8
        blurViewForNavBar.autoresizingMask = [.flexibleWidth, .flexibleHeight]

        navBar.insertSubview(blurViewForNavBar, at: 0)
    }

    @IBAction func scrollToCell(_ sender: UIButton) {
        self.collectionView.scrollToItem(at: IndexPath(row: 1, section: 0), at: .top, animated: true)
    }
}
