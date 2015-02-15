//
//  GANavigationBar.swift
//  Design Workshop
//
//  Created by Thomas Degry on 14/02/15.
//  Copyright (c) 2015 Thomas Degry. All rights reserved.
//

import UIKit

class GANavigationBar: UINavigationBar {

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        initialize()
    }
    
    func initialize() {
        self.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
        self.shadowImage = UIImage()
        self.translucent = true
    }
    
}
