import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var swipeTextView: UITextView!
    
    /*
    TODO one: Hook up a swipeable area on the home screen that must present a modal dialog when swiped. You must create the modal dialog and present it in CODE (not the storyboard).
    TODO two: Add an imageview to the modal dialog presented in TODO two.
    TODO three: Add and hook up a ‘dismiss’ button below the above mentioned image view that will dismiss the modal dialog. Do this in CODE.
    TODO four: Hook up the button on the home screen to push ArrayTableViewController into view (via the navigation controller) when tapped. Do this by triggering a segue from this view controller. The method you are looking for is performSegueWithIdentifier. Find the identifier from the storyboard.
    */
    
    func initiateSwipeRightOnBox() {
        let swipeRight = UISwipeGestureRecognizer(target: self, action: "swipedRight:")
        
        swipeRight.direction = UISwipeGestureRecognizerDirection.Right
        self.swipeTextView.addGestureRecognizer(swipeRight)
    }
    
    func swipedRight(sender:UIGestureRecognizer) {
        displayAlert(title: "Swipe Right", message: "You are about to move View Controllers.", buttonText: "Okay")
        //Two questions: 1) documentation says "UIAlertView" is depreciated... how do we do this using UIAlertViewController? 2) How do you programatically set 'didClickButton" so that the function does not continue until the user selects \(buttonText:"Okay")
        
        var modalVC = self.storyboard?.instantiateViewControllerWithIdentifier("ModalVC") as! ModalViewController
        
        self.presentViewController(modalVC, animated: true, completion: nil)
        
    }
    
    func displayAlert(#title: String, message: String, buttonText: String) {
        let alert = UIAlertView()
        alert.title = title
        alert.message = message
        // We can add other buttons
        alert.addButtonWithTitle(buttonText)
        // We call the show() method once we have all of our alert properties set
        alert.show()
    }

    
    @IBAction func displayArrayTableButton(sender: UIButton) {
        self.performSegueWithIdentifier("showArrayTable", sender: self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        initiateSwipeRightOnBox()
    }
    
    
}

