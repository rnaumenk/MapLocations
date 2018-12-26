//
//  SetLocationDelegate.swift
//  MapLocations
//
//  Created by Ruslan on 12/20/18.
//  Copyright © 2018 Ruslan Naumenko. All rights reserved.
//

import Foundation
import MapKit

protocol SetLocationDelegate : NSObjectProtocol {
    func setNewLocationIndex(_ newValue: Int)
}

