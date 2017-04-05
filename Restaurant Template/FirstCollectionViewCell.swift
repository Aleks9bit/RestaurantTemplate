//
//  FirstCollectionViewCell.swift
//  Restaurant Template
//
//  Created by Alexey Bargin on 28.03.17.
//  Copyright © 2017 GoTo Inc. All rights reserved.
//

import UIKit

class FirstCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var thirdLabel: UILabel!

    @IBOutlet weak var phoneView: UIView!
    @IBOutlet weak var mapView: UIView!

    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var cityNameLabel: UILabel!

    func setup() {

        firstLabel.text = constWebsite
        secondLabel.text = constDescription

        phoneNumberLabel.text = constPhoneNumber
        cityNameLabel.text = constCityName

        firstLabel.transform = CGAffineTransform(translationX: frame.width, y: 0)
        secondLabel.transform = CGAffineTransform(translationX: frame.width, y: 0)
        thirdLabel.transform = CGAffineTransform(translationX: frame.width, y: 0)

        phoneView.transform = CGAffineTransform(translationX: frame.width, y: 0)
        mapView.transform = CGAffineTransform(translationX: frame.width, y: 0)
    }

    func animation() {
        UIView.animate(withDuration: 0.5,
                       delay: 0.5,
                       usingSpringWithDamping: 0.9,
                       initialSpringVelocity: 0,
                       options: [],
                       animations: {
            self.firstLabel.transform = .identity
        })
        UIView.animate(withDuration: 0.5,
                       delay: 0.6,
                       usingSpringWithDamping: 0.9,
                       initialSpringVelocity: 0,
                       options: [],
                       animations: {
            self.secondLabel.transform = .identity
        })
        UIView.animate(withDuration: 0.5,
                       delay: 0.7,
                       usingSpringWithDamping: 0.9,
                       initialSpringVelocity: 0,
                       options: [],
                       animations: {
            self.thirdLabel.transform = .identity
        })

        UIView.animate(withDuration: 0.5,
                       delay: 0.8,
                       usingSpringWithDamping: 0.9,
                       initialSpringVelocity: 0,
                       options: [],
                       animations: {
            self.phoneView.transform = .identity
        })
        UIView.animate(withDuration: 0.5,
                       delay: 0.9,
                       usingSpringWithDamping: 0.9,
                       initialSpringVelocity: 0,
                       options: [],
                       animations: {
            self.mapView.transform = .identity
        })
    }
}
