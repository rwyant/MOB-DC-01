//
//  Created by Tedi Konda on 1/25/15.
//  Copyright (c) 2015 Tedi Konda. All rights reserved.
//

// Lesson 8-9 cheat sheet

/******************************* Animations ************************************/
// 0.5 is the animationduration
UIView.animateWithDuration(0.5, animations: {
    // We can stack as many animations as needed in this container. You change the property of an object. Whatever proprty gets changed in this block is what animates.
    square.backgroundColor = UIColor.blueColor() //we haven't defined square, this is just an example
})

/******************************* Alerts ************************************/
// Show alert. This does not need to be placed in a function, this is just more modular.
func displayAlert(#title: String, message: String, buttonText: String) {
    let alert = UIAlertView()
    alert.title = title
    alert.message = message
    // We can add other buttons
    alert.addButtonWithTitle(buttonText)
    // We call the show() method once we have all of our alert properties set
    alert.show()
}

/******************************* Adding gestures programatically ************************************/
func prepareSwipe() {
    // didswipe in this scenario is the function that should be called after user successfully completes the gesture.
    // we also have access to the other gestures. ie: UITapGestureRecognizer. This is where we define the gesture.
    let swipeUpGesture = UISwipeGestureRecognizer(target: self, action: Selector("didSwipe:"))
    
    // We can add gesture options. For example, we can also addd number of touches (numberOfTouches).
    swipeUpGesture.direction = UISwipeGestureRecognizerDirection.Up
    
    // After we set all of our options we add our gesture to our object, in this case a label that we may have defined at another point.
    label.addGestureRecognizer(swipeUpGesture) // reminder: we haven't defined label, replace this with the object you want a gesture for.
    // Another example: you can add a gesture recognizer to the whole scene with: self.view.addGestureRecognizer(swipeUpGesture)
    // We can also remove gesture from an object with removeGestureRecognizer. ex: label.removeGestureRecognizer(swipeUpGesture).
}

// The method that gets called when the gesture is complete
func didSwipe(sender: UISwipeGestureRecognizer) {
    println("Gesture completed successfully")
}

// prepareSwipe() should then be called from viewDidLoad, or at the point that you want to add a gesture to an object. That logic does not need to be in a function, it is just cleaner to seperate it.

/******************************* Arrays ************************************/
// Creating arrays: inferred type if array is populated
var array = [1, 4, 5]
// Creating arrays: must declare type if array is empty
var array2: [Int] = []
// Creating arrays: array constants cannot be modified
let array3 = [1, 5, 3]
// Accessing arrays: access elements by index
array2[1] // this is the second element. Array elements are indexed starting at 0, not 1.
// Accessing arrays: loop through each item in the array, having access to the items
for i in array {
    println(i) // This loops 3 times. i is first 1, then 4, then 5
}
// Accessing arrays: loop through array getting the value and index of each element
for (index, element) in enumerate(array3) {
    println("Index is \(index) and element is \(element)")
}
// Adding items to arrays: append adds to the end of the array
array.append(10)
// Adding item at a certain position in the array. First paremeter is the valu you're inserting, the second value is the location you are inserting it to.
array.insert(15, atIndex: 2)
// Removing items from array: remove at a certain index
array.removeAtIndex(3)
// Removing items from array: remove last item
array.removeLast()
// Other commonly used array methods
array.first // returns first item in array
array.last // returns last item in array
array.reverse() // returns the reverse of an array (does not change the array itself)
array.count // returns size of array
array.isEmpty // returns true or false if array is empty

/******************************* Programatically navigating view controllers ************************************/
// Go to view controller when there is a segue that exists between the two scenes. The segue must have an identifier (that you can set through Attributes Inspector)
self.performSegueWithIdentifier("showSecond", sender: self) //showSecond in this case is the segue identifier

// Go to view controller by targeting the view controller identifier (set through attributes inspector)
// In this case secondVC is the identifier of the view controller that we are going to. SecondViewController is the name of the controller (class) swift file that we associate with the view controller.
let vc = self.storyboard?.instantiateViewControllerWithIdentifier("secondVC") as SecondViewController
self.presentViewController(vc, animated: true, completion: nil)
// self.storyboard? gives us access to the current storyboard. We can also target the storyboard as such:
// let storyboard = UIStoryboard(name: "Main", bundle: nil)

// You can dismiss a view controller that's pushed modally with the dismissViewControllerAnimated method
self.dismissViewControllerAnimated(true, completion: nil)

// If the view controller is part of a navigationcontroller stack you can dismiss with the following methods:
navigationController?.popToRootViewControllerAnimated(true) // takes you back to the first view controller in the navigation stack
navigationController.popViewControllerAnimated(true) // takes you back to the previous view controller


/******************************* Table View Controllers ************************************/
// Creating a table view controller:
/*
1. Add table view controller to storyboard
2. Create a controller by right clicking on your project group -> new file -> iOS -> source -> Cocoa Touch Class -> Select subclass UITableViewController
3. Assign the new controller class to the table view controller on the storyboard
4. Create array that will house all the data on the new table view controller class
5. Return 1 under "numberOfSectionsInTableView" method. ex: */
override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
}
/*
6. Return the array size under the tableView that has the numberOfRowsInSection paremeter. Ex: */
override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // Sets the number of cells in the table to equal the number of items in our array
    return self.array.count
}
/*
7. Update the tableView method with the cellForRowIndexPath paremeter to update all the cells with the array data. ex:
*/
override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("CellIdentifier") as? UITableViewCell ?? UITableViewCell(style: .Default, reuseIdentifier: "CellIdentifier")
    // Sets each cell to equal each item in the array
    cell.textLabel?.text = self.myArray[indexPath.row]
    return cell
    
}
// 8. Removing table cell:
override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    if editingStyle == .Delete {
        self.myArray.removeAtIndex(indexPath.row)
        tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
    }
}
