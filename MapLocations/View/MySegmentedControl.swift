//
//  MySegmentedControl.swift
//  MapLocations
//
//  Created by Ruslan on 12/20/18.
//  Copyright © 2018 Ruslan Naumenko. All rights reserved.
//

import UIKit

class MySegmentedControl: UISegmentedControl {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.layer.cornerRadius = 5.0;
    }
    
}
