
import UIKit

class ArrayTableViewController: UITableViewController {
    
    /*
        TODO five: create an array of to do tasks inside this class
        TODO six: populate the table view with the contents of the newly created array.
        Bonus: Add delete cell on swipe feature.
    */
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CellIdentifier") as? UITableViewCell ?? UITableViewCell(style: .Default, reuseIdentifier: "CellIdentifier")
        
        // Add code to populate cells
        
        return cell
    }
}
