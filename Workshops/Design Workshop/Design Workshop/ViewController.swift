//
//  ViewController.swift
//  Design Workshop
//
//  Created by Thomas Degry on 14/02/15.
//  Copyright (c) 2015 Thomas Degry. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate {

    @IBOutlet var segmentedControl: CrazySegmentedControl!
    @IBOutlet var tableView: UITableView!
    @IBOutlet var paragraph: UILabel!
    @IBOutlet var background: UIImageView!
    
    var data:[[Campus]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // This is required for the preferredStatusBarStyle override to work
        self.navigationController?.navigationBar.barStyle = .Black;
        
        // Change title font
        if let font = UIFont(name: "AvenirNext-Medium", size: 18) {
            self.navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName: font]
        }
        
        // Load sample data
        self.data = initDataSet()
        
        // Initialize stuff
        setupSegmentedControl()
        setupTableView()
    }
    
    func initDataSet() -> [[Campus]] {
        let usa = [Campus(city: "Atlanta", founded: 2012, isInternational: false),
                    Campus(city: "Austin", founded: 2013, isInternational: false),
                    Campus(city: "Boston", founded: 2011, isInternational: false),
                    Campus(city: "Chicago", founded: 2012, isInternational: false),
                    Campus(city: "Washington D.C.", founded: 2009, isInternational: false),
                    Campus(city: "Seattle", founded: 2010, isInternational: false),
                    Campus(city: "San Francisco", founded: 2012, isInternational: false),
                    Campus(city: "New York City", founded: 1008, isInternational: false)]
        
        let international = [Campus(city: "Hong Kong", founded: 2013, isInternational: true),
            Campus(city: "London", founded: 2013, isInternational: true),
            Campus(city: "Melbourne", founded: 2014, isInternational: true),
            Campus(city: "Sydney", founded: 2014, isInternational: true)]
        
        
        let dataSet = [usa, international]
        
        return dataSet
    }
    
    func setupSegmentedControl() {
        self.segmentedControl.items = ["All", "U.S.A.", "World"]
        self.segmentedControl.font = UIFont(name: "AvenirNext-Regular", size: 17)
        self.segmentedControl.borderColor = UIColor(white: 1.0, alpha: 0.3)
        self.segmentedControl.selectedIndex = 0
        self.segmentedControl.addTarget(self, action: "segmentValueChanged:", forControlEvents: .ValueChanged)
    }
    
    func segmentValueChanged(sender: AnyObject?) {
        self.tableView.reloadData()
    }
    
    func setupTableView() {
        self.tableView.backgroundColor = UIColor.clearColor()
        self.tableView.separatorStyle = .None
    }
    
    // MARK: - Scroll view delegate
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let offset = self.tableView.contentOffset.y
        let maxNegativeOffset = 80
        let percentageScrolledOfOffset = abs(offset / CGFloat(maxNegativeOffset))
        
        if offset < 0 {
            self.paragraph.alpha = 1 - percentageScrolledOfOffset
            self.segmentedControl.alpha = 1 - percentageScrolledOfOffset
            self.background.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1 + (percentageScrolledOfOffset / 5), 1 + (percentageScrolledOfOffset / 5))
        }
    }
    
    // MARK: - Table View DataSource
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        let numberOfSections = self.segmentedControl.selectedIndex == 0 ? 2 : 1
        
        return numberOfSections
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var numberOfRowsInSection = 0
        
        switch (self.segmentedControl.selectedIndex) {
        case 1:
            numberOfRowsInSection = self.data[0].count
            break;
            
        case 2:
            numberOfRowsInSection = self.data[1].count
            break;
            
        default:
            let allCampuses = [self.data[0], self.data[1]]
            numberOfRowsInSection = allCampuses[section].count
            break;
        }
        
        return numberOfRowsInSection
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("campusCell", forIndexPath: indexPath) as CampusCell
        
        var currentCampus:Campus?
        switch (self.segmentedControl.selectedIndex) {
        case 1:
            currentCampus = self.data[0][indexPath.row]
            cell.textLabel.text = currentCampus!.city
            break;
            
        case 2:
            currentCampus = self.data[1][indexPath.row]
            cell.textLabel.text = currentCampus!.city
            break;
            
        default:
            let allCampuses = [self.data[0], self.data[1]]
            currentCampus = allCampuses[indexPath.section][indexPath.row]
            cell.textLabel.text = currentCampus!.city
            break;
        }
        
        cell.cellCampus = currentCampus!
        
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 80
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }

}

