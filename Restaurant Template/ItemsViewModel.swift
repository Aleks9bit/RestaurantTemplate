//
//  ItemsViewModel.swift
//  Restaurant Template
//
//  Created by Alexey Bargin on 30.03.17.
//  Copyright © 2017 GoTo Inc. All rights reserved.
//

import Foundation

struct ItemViewModel {
    var sections = [String]()
    var items = [Item]()

    init() {

        for section in infoModel {

            if let sectionName = section["sectionName"] as? String {
                self.sections.append(sectionName)
            }
            if let items = section["items"] as? [Any] {

                for item in items {
                    guard let item = item as? [String: Any] else { return }
                    self.items.append(Item(item: item))
                }
            }
        }
    }
}

struct Item {
    let name: String
    var detail: String?
    let menuIcon: String
    var mainIcon: String?
    var images: [String]?
    var url: URL?
    var segue: String?

    init(item: [String: Any]) {

        if let name = item["name"] as? String, let menuIcon = item["menuIcon"] as? String {
            self.name = name
            self.menuIcon = menuIcon
        } else {
            name = ""
            menuIcon = ""
        }

        if let detail = item["detail"] as? String {
            self.detail = detail
        }
        if let mainIcon = item["mainIcon"] as? String {
            self.mainIcon = mainIcon
        }
        if let images = item["images"] as? [String] {
            self.images = images
        }
        if let url = item["url"] as? String {
            self.url = URL(string: url)
        }
        if let segue = item["segue"] as? String {
            self.segue = segue
        }
    }
}
