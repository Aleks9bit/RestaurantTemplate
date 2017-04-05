//
//  CellCollectionViewCell.swift
//  Restaurant Template
//
//  Created by Alexey Bargin on 28.03.17.
//  Copyright © 2017 GoTo Inc. All rights reserved.
//

import UIKit

class CellCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var separator: UIView!

    var imageView: UIImageView?

    func setup(item: Item) {

        titleLabel.text = item.name

        var leftAnchor = self.leftAnchor

        if let iconString = item.mainIcon {

            leftAnchor = addIcon(by: iconString, leftAnchor: leftAnchor)
        }

        if let detailText = item.detail {

            leftAnchor = add(detailText: detailText, leftAnchor: leftAnchor)
        }

        if let images = item.images {

            var imagesArray = [UIImage]()

            for imageString in images {
                let image = UIImage(imageLiteralResourceName: imageString)

                imagesArray.append(image)
            }

            add(images: imagesArray, leftAnchor: leftAnchor)

        } else if item.name.contains("Contact") {
            addMapView(leftAnchor: leftAnchor)
        }
    }

    func addIcon(by string: String, leftAnchor anchor: NSLayoutXAxisAnchor) -> NSLayoutXAxisAnchor {

        let iconImage = UIImage(imageLiteralResourceName: string)
        let iconView = UIImageView(image: iconImage)

        iconView.translatesAutoresizingMaskIntoConstraints = false

        addSubview(iconView)

        iconView.leftAnchor.constraint(equalTo: leftAnchor, constant: 8).isActive = true
        iconView.topAnchor.constraint(equalTo: separator.bottomAnchor, constant: 8).isActive = true
        iconView.widthAnchor.constraint(equalToConstant: 26).isActive = true
        iconView.heightAnchor.constraint(equalToConstant: 26).isActive = true

        iconView.contentMode = .scaleAspectFit

        return iconView.rightAnchor
    }

    func add(detailText text: String, leftAnchor anchor: NSLayoutXAxisAnchor) -> NSLayoutXAxisAnchor {

        let detailLabel = UILabel()
        let font = UIFont(name: FontFamily.from(type: .semiBold), size: FontSize.from(type: .normal))

        detailLabel.translatesAutoresizingMaskIntoConstraints = false

        detailLabel.text = text
        detailLabel.font = font
        detailLabel.textColor = Color.from(type: .second)

        addSubview(detailLabel)

        detailLabel.leftAnchor.constraint(equalTo: anchor, constant: 8).isActive = true
        detailLabel.topAnchor.constraint(equalTo: separator.bottomAnchor, constant: 8).isActive = true

        return detailLabel.rightAnchor
    }

    func add(images: [UIImage], leftAnchor anchor: NSLayoutXAxisAnchor) {

        let imageView = UIImageView()

        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true

        if images.count == 1 {
            imageView.image = images.first
        } else {
            imageView.animationImages = images
            imageView.animationDuration = 5
        }
        addSubview(imageView)

        imageView.leftAnchor.constraint(equalTo: anchor, constant: 8).isActive = true
        imageView.rightAnchor.constraint(equalTo: separator.rightAnchor, constant: 8).isActive = true
        imageView.topAnchor.constraint(equalTo: separator.bottomAnchor, constant: 8).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 100).isActive = true

        self.imageView = imageView
    }

    func addMapView(leftAnchor anchor: NSLayoutXAxisAnchor) {

        let mapView = MapView()

        mapView.setup()
        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapView.isUserInteractionEnabled = false

        addSubview(mapView)

        mapView.leftAnchor.constraint(equalTo: leftAnchor, constant: 8).isActive = true
        mapView.rightAnchor.constraint(equalTo: separator.rightAnchor, constant: 0).isActive = true
        mapView.topAnchor.constraint(equalTo: separator.bottomAnchor, constant: 8).isActive = true
        mapView.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }

    func imageStartAnimation() {

        if let imageView = self.imageView {
            if let images = imageView.animationImages, images.count > 1 {
                imageView.startAnimating()
            }
        }
    }

    func imageStopAnimation() {
        if let imageView = self.imageView, imageView.isAnimating {
            imageView.stopAnimating()
        }
    }

}
