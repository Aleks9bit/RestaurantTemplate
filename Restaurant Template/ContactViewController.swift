//
//  ContactViewController.swift
//  Restaurant Template
//
//  Created by Alexey Bargin on 30.03.17.
//  Copyright © 2017 GoTo Inc. All rights reserved.
//

import UIKit
import MessageUI

class ContactViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, MFMailComposeViewControllerDelegate {

    @IBOutlet weak var mapView: MapView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var buttonsBackground: UIView!

    var pageIndex: Int! {
        didSet {
            self.page = PageViewModel(at: pageIndex)
        }
    }

    var page: PageViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()

        pageIndex = 0
        setupView()

        tableView.delegate = self
        tableView.dataSource = self

    }

    func setupView() {

        buttonsBackground.backgroundColor = Color.from(type: .main)
        let backItem = UIBarButtonItem(title: "Back",
                                       style: .plain,
                                       target: self,
                                       action: #selector(ViewableMenuViewController.dismissVC))
        let navBar = NavigationBar(backButton: backItem, title: "Contact", blur: false)

        view.addSubview(navBar)

        mapView.setup()

        let tap = UITapGestureRecognizer(target: self, action: #selector(ContactViewController.openMap))

        mapView.addGestureRecognizer(tap)
    }

    func setup(addressCell cell: UITableViewCell, forItemAt indexPath: IndexPath) {
        let sectionItems = page.items[indexPath.section]

        if let titleText = sectionItems[indexPath.row] as? String {

            let image = UIImage(imageLiteralResourceName: "goTo")
            let imageView = UIImageView(image: image)

            cell.textLabel?.text = titleText
            cell.accessoryView = imageView
        }
    }

    func setup(infoCell cell: UITableViewCell, forItemAt indexPath: IndexPath) {
        let sectionItems = page.items[indexPath.section]
        if let item = sectionItems[indexPath.row] as? [String: String] {
            let key = item.keys.first

            cell.textLabel?.text = key
            cell.detailTextLabel?.text = item[key!]
        }
        if indexPath.row % 2 != 0 {
            cell.backgroundColor = UIColor.lightGray
        } else {
            cell.backgroundColor = .white
        }
    }

    func setup(cell: UITableViewCell, forItemAt indexPath: IndexPath) {
        let sectionItems = page.items[indexPath.section]

        if let titleText = sectionItems[indexPath.row] as? String {
            cell.textLabel?.text = titleText
        }
    }

    func openMap() {
        self.mapView.openMap()
    }
    func dismissVC() {
        self.dismiss(animated: true)
    }
    func sendEmail(email: String) {
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()

            mail.mailComposeDelegate = self
            mail.setToRecipients([email])

            present(mail, animated: true)
        }
    }

    @IBAction func changingPage(_ sender: UIButton) {
        pageIndex = sender.tag
        tableView.reloadData()
    }

    // MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        if let header = view as? UITableViewHeaderFooterView {
            let font = UIFont(name: FontFamily.from(type: .semiBold), size: FontSize.from(type: .large))

            header.textLabel?.font = font
            header.textLabel?.textColor = Color.from(type: .menuText)

            if pageIndex == 3 {
                let date = Date()
                let calendar = Calendar.current

                let day = calendar.component(.weekday, from: date)

                if section == day {
                    header.tintColor = Color.from(type: .second)
                    if let title = header.textLabel?.text {
                        header.textLabel?.text = "\(title) (Today)"
                    }
                }
            } else {
                header.tintColor = .white
            }
        }
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return page.sections[section]
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        if pageIndex == 0 {
            return 88
        } else {
            return 44
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch pageIndex {
        case 0:
            self.openMap()
            break
        case 2:
            switch indexPath.section {
            case 0:
                if let url = URL(string: "tel://\(constPhoneNumber)"), UIApplication.shared.canOpenURL(url) {
                    UIApplication.shared.open(url, options: [:])
                }
                break
            case 1:
                let url = URL(string: "http://\(constWebsite)")
                Presenter.open(url: url!, from: self)
                break
            case 2:
                sendEmail(email: constEmail)
                break
            default: break
            }
        default: break
        }
    }

    // MARK: - UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return page.sections.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return page.items[section].count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        var cell = UITableViewCell()

        switch pageIndex {
        case 0:
            if let addressCell = tableView.dequeueReusableCell(withIdentifier: "addressCell") {
                self.setup(addressCell: addressCell, forItemAt: indexPath)

                cell = addressCell
            }
            break
        case 1:
            if let infoCell = tableView.dequeueReusableCell(withIdentifier: "infoCell") {
                self.setup(infoCell: infoCell, forItemAt: indexPath)

                cell = infoCell
            }
            break
        case 2:
            if let contactCell = tableView.dequeueReusableCell(withIdentifier: "contactCell") {
                self.setup(cell: contactCell, forItemAt: indexPath)

                cell = contactCell
            }
            break
        case 3:
            if let hourCell = tableView.dequeueReusableCell(withIdentifier: "hourCell") {
                self.setup(cell: hourCell, forItemAt: indexPath)

                cell = hourCell
            }
            break
        default:
            cell = UITableViewCell()
            break
        }
        return cell
    }
    // MARK: - MFMailComposeViewControllerDelegate
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
    }
}
