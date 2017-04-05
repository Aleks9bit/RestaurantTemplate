//
//  MenuViewController.swift
//  Restaurant Template
//
//  Created by Alexey Bargin on 27.03.17.
//  Copyright © 2017 GoTo Inc. All rights reserved.
//

import UIKit
import SafariServices

class MenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!

    let itemViewModel = ItemViewModel.init()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = Color.from(type: .mainMenu)

        tableView.delegate = self
        tableView.dataSource = self

    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return itemViewModel.sections.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemViewModel.items.count
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "  \(itemViewModel.sections[section])".uppercased()
    }

    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {

        if let header = view as? UITableViewHeaderFooterView {

            view.tintColor = Color.from(type: .secondMenu)
            header.textLabel?.textColor = Color.from(type: .menuText)
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "menuCell") as? CellTableViewCell

        let item = itemViewModel.items[indexPath.row]
        let icon = UIImage(imageLiteralResourceName: item.menuIcon)

        cell?.iconImage.image = icon
        cell?.titleLabel.text = item.name

        return cell!
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        if indexPath.row == 0 {
            self.revealViewController().revealToggle(nil)
            return
        }

        let item = itemViewModel.items[indexPath.row]

        if let url = item.url {

            Presenter.open(url: url, from: self)
            return
        }
        if item.segue != nil {
            Presenter.present(viewControllerBy: item, from: self)
        }
    }
}
