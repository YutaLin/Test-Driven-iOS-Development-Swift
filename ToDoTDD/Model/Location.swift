//
//  Location.swift
//  ToDoTDD
//
//  Created by Yuta Lin on 2019/4/14.
//  Copyright © 2019 Yuta Lin. All rights reserved.
//

import Foundation
import CoreLocation

struct Location {
    let name: String
    let coordinate: CLLocationCoordinate2D?
    
    init(name: String,
         coordinate: CLLocationCoordinate2D? = nil) {
        self.name = name
        self.coordinate = coordinate
    }
}

extension Location: Equatable {
    static func == (lhs: Location, rhs: Location) -> Bool {
        if lhs.name != rhs.name ||
            lhs.coordinate?.latitude != rhs.coordinate?.latitude ||
            lhs.coordinate?.longitude != rhs.coordinate?.latitude {
            return false
        }
        
        return true
    }
}
