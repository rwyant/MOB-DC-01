import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var head: UIView!
    
    var body = UIView()
    var leftArm = UIView()
    var rightArm = UIView()
    var leftLeg = UIView()
    var rightLeg = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createBody()
        createLeftArm()
        createRightArm()
        createLeftLeg()
        createRightLeg()
        
        
        UIView.animateWithDuration(1, animations: {
            self.view.layoutIfNeeded()
        })
    }
    
    //MARK: Create Body
    func createBody() {
        body.backgroundColor = UIColor.greenColor()
        
        // Need to add subview before adding constraints
        self.view.addSubview(body)
        
        // Default to use autoconstraint
        body.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        // Constraints for the body
        let bodyWidth = NSLayoutConstraint(
            item: self.body,
            attribute: NSLayoutAttribute.Width,
            relatedBy: NSLayoutRelation.Equal,
            // if you set a static attribute - the toItem is set to nil
            toItem: self.head,
            attribute: NSLayoutAttribute.Width,
            multiplier: 0.5,
            constant: 0.0)
        
        let bodyVerticalPosition = NSLayoutConstraint(
            item: self.body,
            attribute: NSLayoutAttribute.Top,
            relatedBy: NSLayoutRelation.Equal,
            toItem: self.head,
            attribute: NSLayoutAttribute.Bottom,
            multiplier: 1,
            constant: 0.0)
        
        let bodyHorizontalPosition = NSLayoutConstraint(
            item: self.body,
            attribute: NSLayoutAttribute.Leading,
            relatedBy: NSLayoutRelation.Equal,
            toItem: self.head,
            attribute: NSLayoutAttribute.Leading,
            multiplier: 1,
            constant: self.head.frame.width/4)
        
        self.view.addConstraints([bodyWidth, bodyVerticalPosition, bodyHorizontalPosition])
    }
    
    //MARK: Create Left Arm
    func createLeftArm() {
        leftArm.backgroundColor = UIColor.blackColor()
        self.view.addSubview(leftArm)
        
        leftArm.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        let leftArmHeight = NSLayoutConstraint(
            item: self.leftArm,
            attribute: NSLayoutAttribute.Height,
            relatedBy: NSLayoutRelation.Equal,
            toItem: nil,
            attribute: NSLayoutAttribute.Height,
            multiplier: 1,
            constant: 30)
        
        let leftArmTop = NSLayoutConstraint(
            item: self.leftArm,
            attribute: NSLayoutAttribute.Top,
            relatedBy: NSLayoutRelation.Equal,
            toItem: self.head,
            attribute: NSLayoutAttribute.Bottom,
            multiplier: 1,
            constant: 0.0)
        
        let leftArmLeading = NSLayoutConstraint(
            item: self.leftArm,
            attribute: NSLayoutAttribute.Leading,
            relatedBy: NSLayoutRelation.Equal,
            toItem: self.view,
            attribute: NSLayoutAttribute.Leading,
            multiplier: 1,
            constant: 20.0)
        
        let leftArmTrailing = NSLayoutConstraint(
            item: self.leftArm,
            attribute: NSLayoutAttribute.Trailing,
            relatedBy: NSLayoutRelation.Equal,
            toItem: body,
            attribute: NSLayoutAttribute.Left,
            multiplier: 1,
            constant: 0.0)
        
        
        self.view.addConstraints([leftArmHeight, leftArmTop, leftArmLeading, leftArmTrailing])
    }
    
    //MARK: Create Right Arm
    func createRightArm() {
        rightArm.backgroundColor = UIColor.blackColor()
        
        self.view.addSubview(rightArm)
        
        rightArm.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        let rightArmHeight = NSLayoutConstraint(
            item: self.rightArm,
            attribute: NSLayoutAttribute.Height,
            relatedBy: NSLayoutRelation.Equal,
            toItem: self.leftArm,
            attribute: NSLayoutAttribute.Height,
            multiplier: 1,
            constant: 0)
        
        let rightArmTop = NSLayoutConstraint(
            item: self.rightArm,
            attribute: NSLayoutAttribute.Top,
            relatedBy: NSLayoutRelation.Equal,
            toItem: self.head,
            attribute: NSLayoutAttribute.Bottom,
            multiplier: 1,
            constant: 0.0)
        
        let rightArmLeading = NSLayoutConstraint(
            item: self.rightArm,
            attribute: NSLayoutAttribute.Leading,
            relatedBy: NSLayoutRelation.Equal,
            toItem: self.body,
            attribute: NSLayoutAttribute.Trailing,
            multiplier: 1,
            constant: 0)
        
        let rightArmTrailing = NSLayoutConstraint(
            item: self.rightArm,
            attribute: NSLayoutAttribute.Trailing,
            relatedBy: NSLayoutRelation.Equal,
            toItem: self.view,
            attribute: NSLayoutAttribute.Right,
            multiplier: 1,
            constant: -20.0)
        
        self.view.addConstraints([rightArmHeight, rightArmTop, rightArmLeading, rightArmTrailing])
    }
    
    //MARK: Create Left Leg
    func createLeftLeg() {
        leftLeg.backgroundColor = UIColor.blackColor()
        self.view.addSubview(leftLeg)
        
        leftLeg.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        let leftLegHeight = NSLayoutConstraint(
            item: self.leftLeg,
            attribute: NSLayoutAttribute.Height,
            relatedBy: NSLayoutRelation.Equal,
            toItem: nil,
            attribute: NSLayoutAttribute.Height,
            multiplier: 1,
            constant: 120.0)
        
        let leftLegWidth = NSLayoutConstraint(
            item: self.leftLeg,
            attribute: NSLayoutAttribute.Width,
            relatedBy: NSLayoutRelation.Equal,
            toItem: self.body,
            attribute: NSLayoutAttribute.Width,
            multiplier: 1,
            constant: 0)
        
        let leftLegBottom = NSLayoutConstraint(
            item: self.leftLeg,
            attribute: NSLayoutAttribute.Bottom,
            relatedBy: NSLayoutRelation.Equal,
            toItem: self.view,
            attribute: NSLayoutAttribute.Bottom,
            multiplier: 1,
            constant: 0)
        
        let leftLegTrailing = NSLayoutConstraint(
            item: self.leftLeg,
            attribute: NSLayoutAttribute.Trailing,
            relatedBy: NSLayoutRelation.Equal,
            toItem: self.body,
            attribute: NSLayoutAttribute.Leading,
            multiplier: 1,
            constant: 0)
        
        self.view.addConstraints([leftLegHeight, leftLegWidth, leftLegBottom, leftLegTrailing])
    }
    
    //MARK: Create Right Leg
    func createRightLeg() {
        rightLeg.backgroundColor = UIColor.blackColor()
        self.view.addSubview(rightLeg)
        
        rightLeg.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        let rightLegHeight = NSLayoutConstraint(
            item: self.rightLeg,
            attribute: NSLayoutAttribute.Height,
            relatedBy: NSLayoutRelation.Equal,
            toItem: nil,
            attribute: NSLayoutAttribute.Height,
            multiplier: 1,
            constant: 120.0)
        
        let rightLegWidth = NSLayoutConstraint(
            item: self.rightLeg,
            attribute: NSLayoutAttribute.Width,
            relatedBy: NSLayoutRelation.Equal,
            toItem: self.body,
            attribute: NSLayoutAttribute.Width,
            multiplier: 1,
            constant: 0)
        
        let rightLegBottom = NSLayoutConstraint(
            item: self.rightLeg,
            attribute: NSLayoutAttribute.Bottom,
            relatedBy: NSLayoutRelation.Equal,
            toItem: self.view,
            attribute: NSLayoutAttribute.Bottom,
            multiplier: 1,
            constant: 0)
        
        let rightLegLeading = NSLayoutConstraint(
            item: self.rightLeg,
            attribute: NSLayoutAttribute.Leading,
            relatedBy: NSLayoutRelation.Equal,
            toItem: self.body,
            attribute: NSLayoutAttribute.Trailing,
            multiplier: 1,
            constant: 0)
        
        self.view.addConstraints([rightLegHeight, rightLegWidth, rightLegBottom, rightLegLeading])
        
        //The body gets drawn after the second leg is drawn. This is so the body height can be dynamic dependant on the leg position
        updateBodyOnLegsDrawn()
    }
    
    //MARK: Update body height after legs are drawn
    func updateBodyOnLegsDrawn() {
        let bodyBottomPosition = NSLayoutConstraint(
            item: self.body,
            attribute: NSLayoutAttribute.Bottom,
            relatedBy: NSLayoutRelation.Equal,
            toItem: self.leftLeg,
            attribute: NSLayoutAttribute.Top,
            multiplier: 1,
            constant: 0)
        
        self.view.addConstraint(bodyBottomPosition)
    }

}

