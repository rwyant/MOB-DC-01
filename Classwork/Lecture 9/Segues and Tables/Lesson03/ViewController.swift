import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var swipeBox: UILabel!
    @IBOutlet weak var redSwipeBox: UIView!
    
    /*
    TODO one: Hook up a swipeable area on the home screen that must present a modal dialog when swiped. You must create the modal dialog and present it in CODE (not the storyboard).
    TODO two: Add an imageview to the modal dialog presented in TODO two.
    TODO three: Add and hook up a ‘dismiss’ button below the above mentioned image view that will dismiss the modal dialog. Do this in CODE.
    TODO four: Hook up the button on the home screen to push ArrayTableViewController into view (via the navigation controller) when tapped. Do this by triggering a segue from this view controller. The method you are looking for is performSegueWithIdentifier. Find the identifier from the storyboard.
    */

    
    
    func initiateRightSwipeOnBox() {
        let swipeRight = UISwipeGestureRecognizer(target: self, action: "swipedRight:")
        swipeRight.direction = UISwipeGestureRecognizerDirection.Right
        self.redSwipeBox.addGestureRecognizer(swipeRight)
        println("Swipe Right")
    }
    
    func swipedRight (sender:UISwipeGestureRecognizer) {
        var modalVC = self.storyboard?.instantiateViewControllerWithIdentifier("ModalVC") as ModalViewController
        
        self.presentViewController(modalVC,animated:true,completion:nil)
        println("Second LIne")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        initiateRightSwipeOnBox()
    }
    
       @IBAction func showTableView(sender: UIButton) {
        self.performSegueWithIdentifier("showTableView", sender: self)
        
    }

}

