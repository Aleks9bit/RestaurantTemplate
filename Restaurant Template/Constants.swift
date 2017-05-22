//
//  Constants.swift
//  Restaurant Template
//
//  Created by Alexey Bargin on 29.03.17.
//  Copyright © 2017 GoTo Inc. All rights reserved.
//

import Foundation

let constWebsite = "internetgrill.com"
let constCityName = "Staten Island"

let constAddress = "3785 Victory Blvd\n\(constCityName), NY 10314"
let constDescription = "\(constCityName)'s First Online Restaurant"

let constPhoneNumber = "718-494-2442"
let constEmail = "494chicken@verizon.net"

enum Color {

    case main
    case second
    case mainMenu
    case secondMenu
    case menuText
    case hoverButton

    static func from(type: Color) -> UIColor {
        switch type {
        case .main:
            return UIColor(red: 223/255, green: 107/255, blue: 16/255, alpha: 1.0)
        case .second:
            return UIColor(red: 255/255, green: 255/255, blue: 0/255, alpha: 1.0)
        case .menuText:
            return UIColor(red: 170/255, green: 170/255, blue: 170/255, alpha: 1.0)
        case .mainMenu:
            return UIColor(red: 34/255, green: 34/255, blue: 34/255, alpha: 1.0)
        case .secondMenu:
            return UIColor(red: 54/255, green: 54/255, blue: 54/255, alpha: 1.0)
        case .hoverButton:
            return UIColor(red: 188/255, green: 97/255, blue: 26/255, alpha: 1.0)
        }
    }
}

enum FontFamily {
    case normal
    case black
    case bold
    case light
    case semiBold
    case semiLight

    static func from(type: FontFamily) -> String {
        switch type {
        case .normal:
            return "Sego WP"
        case .black:
            return "Sego WP Black"
        case .bold:
            return "Sego WP Bold"
        case .light:
            return "Sego WP Light"
        case .semiBold:
            return "Sego WP Semibold"
        case .semiLight:
            return "Sego WP SemiLight"
        }
    }
}

enum FontSize {
    case normal
    case large

    static func from(type: FontSize) -> CGFloat {
        switch type {
        case .normal:
            return 20.0
        case .large:
            return 25.0
        }
    }
}

let infoModel = [
    [
        "sectionName": "Main",
        "items": [
            [
                "name": "Home",
                "menuIcon": "home"
            ],
            [
                "name": "Order Online",
                "menuIcon": "url",
                "mainIcon": "urlWhite",
                "images": ["onlineMenu"],
                "url": "http://\(constWebsite)"
            ],
            [
                "name": "Viewable Only Menu",
                "menuIcon": "photo",
                "images": ["menu1", "menu2", "menu3", "menu4", "menu5"],
                "segue": "ViewableMenu"
            ],
            [
                "name": "My Account",
                "menuIcon": "url",
                "mainIcon": "urlWhite",
                "images": ["myAccount"],
                "url": "http://\(constWebsite)/login.php"
            ],
//            [
//                "name": "Weekday Specials",
//                "detail": "Coming Soon!",
//                "menuIcon": "heart",
//                "mainIcon": "heartWhite",
//                "images": ["wings"],
//                "segue": "WeekdaySpecials"
//            ],
            [
                "name": "Family Specials",
                "menuIcon": "url",
                "mainIcon": "urlWhite",
                "images": ["familySpecials"],
                "url": "http://\(constWebsite)/product.php?categoryid=2"
            ],
            [
                "name": "Catering",
                "menuIcon": "url",
                "mainIcon": "urlWhite",
                "images": ["cater"],
                "url": "http://\(constWebsite)/product.php?categoryid=13"
            ],
            [
                "name": "Facebook",
                "menuIcon": "url",
                "mainIcon": "urlWhite",
                "images": ["facebook"],
                "url": "https://www.facebook.com/494-Chicken-100515213345861/"
            ],
            [
                "name": "Hours/Contact",
                "menuIcon": "mapPin",
                "mainIcon": "mapPinWhite",
                "segue": "Contact"
            ]
        ]
    ]
]

let pagesInfo = [
    [
        "pageName": "Address",
        "sections": [
            [
                "sectionName": constCityName,
                "data": [constAddress]
            ]
        ]
    ],
    [
        "pageName": "Info",
        "sections": [
            [
                "sectionName": "",
                "data": [
                    ["Dress Code": "Casual"],
                    ["Parking": "Lot"],
                    ["Age Level Preference": "All"],
                    ["Seating Quantity": "24"],
                    ["Max Group Size": "0"],
                    ["Smoking Allowed": "No"],
                    ["Deliver Available": "Yes"],
                    ["Takeout Available": "Yes"],
                    ["Reservations Availavle": "No"],
                    ["Catering Available": "Yes"],
                    ["Pets Allowed": "No"],
                    ["Wheelchair Accessible": "Yes"]
                ]
            ]
        ]
    ],
    [
        "pageName": "Contact",
        "sections": [
            [
                "sectionName": "Phone Number",
                "data": [constPhoneNumber]
            ],
            [
                "sectionName": "Website",
                "data": ["http://\(constWebsite)/"]
            ],
            [
                "sectionName": "Call or Email (primary)",
                "data": [constEmail]
            ]
        ]
    ],
    [
        "pageName": "Hours",
        "sections": [
            [
                "sectionName": "Sunday",
                "data": ["12:00pm - 9:00pm"]
            ],
            [
                "sectionName": "Monday",
                "data": ["3:00pm - 9:00pm"]
            ],
            [
                "sectionName": "Tuesday",
                "data": ["3:00pm - 9:00pm"]
            ],
            [
                "sectionName": "Wednesday",
                "data": ["3:00pm - 9:00pm"]
            ],
            [
                "sectionName": "Thursday",
                "data": ["3:00pm - 9:00pm"]
            ],
            [
                "sectionName": "Friday",
                "data": ["11:00am - 10:00pm"]
            ],
            [
                "sectionName": "Saturday",
                "data": ["12:00pm - 10:00pm"]
            ]
        ]
    ]
]
