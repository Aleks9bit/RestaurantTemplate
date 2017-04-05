//
//  ViewableMenuViewController.swift
//  Restaurant Template
//
//  Created by Alexey Bargin on 29.03.17.
//  Copyright © 2017 GoTo Inc. All rights reserved.
//

import UIKit

class ViewableMenuViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionView: UICollectionView!

    var item: Item!
    var blurViewForNavBar: UIVisualEffectView!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionView.delegate = self
        self.collectionView.dataSource = self

        setupView()

    }

    fileprivate func setupView() {
        self.collectionView.backgroundColor = Color.from(type: .main)

        let backItem = UIBarButtonItem(title: "Back",
                                       style: .plain,
                                       target: self,
                                       action: #selector(ViewableMenuViewController.dismissVC))
        let navBar = NavigationBar(backButton: backItem, title: item.name, blur: true)

        view.addSubview(navBar)
    }

    func dismissVC() {
        self.dismiss(animated: true, completion: nil)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (item.images?.count)!
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "viewableMenuCell", for: indexPath)

        if let imageName = item.images?[indexPath.row] {
            let image = UIImage(imageLiteralResourceName: imageName)
            let imageView = UIImageView(image: image)

            imageView.frame = cell.bounds
            imageView.clipsToBounds = true
            imageView.contentMode = .scaleAspectFill
            cell.addSubview(imageView)
        }
        return cell

    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let imageName = item.images?[indexPath.row]
        let image = UIImage(imageLiteralResourceName: imageName!)
        let imageSize = image.size
        let cellWidth = collectionView.bounds.size.width - 32
        let ratio = cellWidth / imageSize.width
        let cellHeight = ratio * imageSize.height

        return CGSize(width: cellWidth, height: cellHeight)
    }
}
