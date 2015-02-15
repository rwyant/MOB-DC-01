//
//  CampusCell.swift
//  Design Workshop
//
//  Created by Thomas Degry on 14/02/15.
//  Copyright (c) 2015 Thomas Degry. All rights reserved.
//

import UIKit

class CampusCell: UITableViewCell {
    
    var cityLabel:UILabel?
    var foundedLabel:UILabel?
    var internationalLabel:UILabel?
    var circle:UIView?
    
    var cellCampus:Campus? {
        didSet {
            updateCell()
        }
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        // make the cell transparent
        self.backgroundColor = UIColor.clearColor()
        
        // hide the default textlabel
        self.textLabel.hidden = true
        
        makeCircle()
        makeInternationalLabel()
        makeCityLabel()
        makeFoundedLabel()
        
        // make a new textlabel
        self.cityLabel = UILabel(frame: CGRectZero)
        
        // Add the accessorytype
        self.accessoryType = UITableViewCellAccessoryType.DetailButton
        self.tintColor = UIColor.redColor()
    }
    
    func makeCircle() {
        self.circle = UIView(frame: CGRectZero)
        self.circle!.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.circle!.layer.cornerRadius = 30
        self.circle!.backgroundColor = UIColor.redColor()
        self.addSubview(self.circle!)
        
        
        let height = NSLayoutConstraint(item: self.circle!, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Height, multiplier: 1.0, constant: -20)
        
        let width = NSLayoutConstraint(item: self.circle!, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: self.circle, attribute: NSLayoutAttribute.Height, multiplier: 1.0, constant: 0)
        
        let top = NSLayoutConstraint(item: self.circle!, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Top, multiplier: 1.0, constant: 10)
        
        let left = NSLayoutConstraint(item: self.circle!, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Left, multiplier: 1.0, constant: 20)
        
        self.addConstraints([height, width, top, left])
    }
    
    func makeInternationalLabel() {
        self.internationalLabel = UILabel(frame: CGRectZero)
        self.internationalLabel?.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.internationalLabel?.font = UIFont(name: "Nexa Rust Script B", size: 20)
        self.internationalLabel?.textAlignment = .Center
        self.circle?.addSubview(self.internationalLabel!)
        
        let height = NSLayoutConstraint(item: self.internationalLabel!, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: self.circle!, attribute: NSLayoutAttribute.Height, multiplier: 1.0, constant:0)
        
        let width = NSLayoutConstraint(item: self.internationalLabel!, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: self.circle!, attribute: NSLayoutAttribute.Width, multiplier: 1.0, constant: 0)
        
        let top = NSLayoutConstraint(item: self.internationalLabel!, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: self.circle!, attribute: NSLayoutAttribute.Top, multiplier: 1.0, constant: 0)
        
        let left = NSLayoutConstraint(item: self.internationalLabel!, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: self.circle!, attribute: NSLayoutAttribute.Left, multiplier: 1.0, constant: 0)
        
        self.circle?.addConstraints([height, width, top, left])
    }
    
    func makeCityLabel() {
        self.cityLabel = UILabel(frame: CGRectZero)
        self.cityLabel!.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.cityLabel?.font = UIFont(name: "AvenirNext-Regular", size: 18)
        self.cityLabel?.textColor = UIColor.whiteColor()
        self.cityLabel?.text = "Foo"
        self.addSubview(self.cityLabel!)
        
        
        let height = NSLayoutConstraint(item: self.cityLabel!, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.Height, multiplier: 1.0, constant: 25)
        
        let top = NSLayoutConstraint(item: self.cityLabel!, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Top, multiplier: 1.0, constant: 15)
        
        let left = NSLayoutConstraint(item: self.cityLabel!, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: self.circle, attribute: NSLayoutAttribute.Right, multiplier: 1.0, constant: 20)
        
        let right = NSLayoutConstraint(item: self.cityLabel!, attribute: NSLayoutAttribute.Right, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Right, multiplier: 1.0, constant: -40)
        
        self.addConstraints([height, top, left, right])
    }
    
    func makeFoundedLabel() {
        self.foundedLabel = UILabel(frame: CGRectZero)
        self.foundedLabel!.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.foundedLabel?.font = UIFont(name: "AvenirNext-DemiBold", size: 16)
        self.foundedLabel?.textColor = UIColor(white:0.23, alpha:1.0)
        self.foundedLabel?.text = "Bar"
        self.addSubview(self.foundedLabel!)
        
        
        let height = NSLayoutConstraint(item: self.foundedLabel!, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.Height, multiplier: 1.0, constant: 25)
        
        let top = NSLayoutConstraint(item: self.foundedLabel!, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: self.cityLabel, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: 0)
        
        let left = NSLayoutConstraint(item: self.foundedLabel!, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: self.circle, attribute: NSLayoutAttribute.Right, multiplier: 1.0, constant: 20)
        
        let right = NSLayoutConstraint(item: self.foundedLabel!, attribute: NSLayoutAttribute.Right, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Right, multiplier: 1.0, constant: -40)
        
        self.addConstraints([height, top, left, right])
    }
    
    func updateCell() {
        if let campus = self.cellCampus {
            self.cityLabel?.text = campus.city
            self.foundedLabel?.text = "FOUNDED IN \(campus.founded)"
            self.circle!.backgroundColor = campus.isInternational ? UIColor(white:0.39, alpha:1.0) : UIColor(white:0.2, alpha:1.0)
            self.internationalLabel!.textColor = campus.isInternational ? UIColor(white:0.2, alpha:1.0) : UIColor(white:0.39, alpha:1.0)
            self.internationalLabel!.text = campus.isInternational ? "Int" : "US"
        }
    }
    
}
