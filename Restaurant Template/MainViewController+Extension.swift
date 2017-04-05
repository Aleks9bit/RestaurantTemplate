//
//  MainViewController+Extension.swift
//  Restaurant Template
//
//  Created by Alexey Bargin on 28.03.17.
//  Copyright © 2017 GoTo Inc. All rights reserved.
//

import UIKit
import SafariServices

extension MainViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.itemViewModel.items.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        if indexPath.row == 0,
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "firstCell", for: indexPath) as? FirstCollectionViewCell {

            cell.setup()
            cell.animation()

            let tappedOnContact = UITapGestureRecognizer(target: self, action: #selector(showContact))
            let tappedOnPhone = UITapGestureRecognizer(target: self, action: #selector(callOnPhoneNumber))

            cell.mapView.addGestureRecognizer(tappedOnContact)
            cell.phoneView.addGestureRecognizer(tappedOnPhone)

            return cell
        } else if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CellCollectionViewCell {

            cell.setup(item: itemViewModel.items[indexPath.row])

            return cell
        }
        return UICollectionViewCell()
    }
}

extension MainViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.row == 0 {
            return CGSize(width: self.collectionView.bounds.size.width - 32, height: self.collectionView.bounds.size.height)
        } else {
            return CGSize(width: self.collectionView.bounds.size.width - 32, height: 180)
        }
    }
}

extension MainViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if let cell = cell as? CellCollectionViewCell {
            cell.imageStartAnimation()
        }
    }
    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if let cell = cell as? CellCollectionViewCell {
            cell.imageStopAnimation()
        }
    }
}

extension MainViewController: UIScrollViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        if indexPath.row == 0 { return }

        let item = itemViewModel.items[indexPath.row]

        if let url = item.url {

            Presenter.open(url: url, from: self)
            return
        }
        if item.segue != nil {
            Presenter.present(viewControllerBy: item, from: self)
        }
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {

        if let cell = self.collectionView.visibleCells.first as? FirstCollectionViewCell {

            var alphaForCell: CGFloat!
            var alphaForTitle: CGFloat!

            if scrollView.contentOffset.y > -64 {
                self.scrollToCell.isHidden = true
            } else {
                self.scrollToCell.isHidden = false
            }

            if alphaForCell != 0 {
                alphaForCell = 1 - ((64 + scrollView.contentOffset.y) / 100)
                alphaForTitle = 0 + (1 - alphaForCell)
            }

            UIView.animate(withDuration: 0.1, animations: {
                cell.alpha = alphaForCell
                self.navigationItem.titleView?.alpha = alphaForTitle

                if alphaForTitle <= 0.4 {
                    self.backgroundBlurView.alpha = alphaForTitle
                }
            })
        }
    }

    func showContact() {

        let storyboard = UIStoryboard(name: "Contact", bundle: nil)
        if let viewController = storyboard.instantiateViewController(withIdentifier: "ContactViewController") as? ContactViewController {
            present(viewController, animated: true)
        }
    }

    func callOnPhoneNumber() {
        if let url = URL(string: "tel://\(constPhoneNumber)"), UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:])
        }
    }
}
