//
//  PageViewModel.swift
//  Restaurant Template
//
//  Created by Alexey Bargin on 03.04.17.
//  Copyright © 2017 GoTo Inc. All rights reserved.
//

import Foundation

struct PageViewModel {
    var sections = [String]()
    var items = [[Any]]()

    init(at pageIndex: Int) {

        let page = pagesInfo[pageIndex]

        if let pageSections = page["sections"] as? [[String: Any]] {

            for section in pageSections {
                if let sectionName = section["sectionName"] as? String {
                    self.sections.append(sectionName)
                }
                if let items = section["data"] as? [Any] {

                    var dataArray = [Any]()

                    for item in items {
                        dataArray.append(item)
                    }
                    self.items.append(dataArray)
                }
            }
        }
    }
}
