//
//  MapView.swift
//  Restaurant Template
//
//  Created by Alexey Bargin on 31.03.17.
//  Copyright © 2017 GoTo Inc. All rights reserved.
//

import UIKit
import MapKit

class MapView: MKMapView {

    var placemark: CLPlacemark?

    func setup() {

        let geocoder = CLGeocoder()

        geocoder.geocodeAddressString(constAddress) { (placemarks, _) in
            if let placemarks = placemarks, placemarks.count != 0 {
                guard let placemark = placemarks.first else { return }

                if let location = placemark.location {

                    let coordinate = location.coordinate
                    let coordinateRegion = MKCoordinateRegionMakeWithDistance(coordinate, 1000, 1000)

                    self.setRegion(coordinateRegion, animated: true)
                    self.addAnnotation(MKPlacemark(coordinate: coordinate))
                }
                self.placemark = placemark
            }
        }

    }

    func openMap() {

        guard let coordinate = self.placemark?.location?.coordinate else { return }

        let regionSpan = MKCoordinateRegionMakeWithDistance(coordinate, 1000, 1000)

        let options = [
            MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center),
            MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)
        ]
        let mapItem = MKMapItem(placemark: MKPlacemark(coordinate: coordinate))

        mapItem.name = constCityName
        mapItem.openInMaps(launchOptions: options)
    }
}
