//
//  ViewController.swift
//  Animation-Intro
//
//  Created by LOANER on 3/15/15.
//  Copyright (c) 2015 Thomas Degry. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        /*
        
        LAYERS
        
        Before we can even talk about animation, we have to talk about layers.
        Animation happens on layers, so let's go!
        
        Every subclass of a UIView has a layer, we can access this layer by using the property .layer
        Layers are the underlaying support of a UIView
        Layers are often used to provide the backing store for views but can also be used without a view to display content.
        A layer’s main job is to manage the visual content that you provide but the layer itself has visual attributes that can be set, such as a background color, border, and shadow.
        
        That's interesting isn't it? Shadows for instance, we haven't touched on that yet!
        CALayer is the base object, just like UIView is. But we have subclasses of CALayer
        CAGradientLayer and CAShapeLayer are the most common ones
        
        Layers are one level lower to the device then View's they are part of the CoreGraphics layer and not the UIkit layer
        Because of that, we have some strange things that we have to do, cast colors for instance, but it already got a little better with swift
        You cast a color by getting it's CGColor Value, just like this: let myColor = UIColor.redColor().CGColor
        
        */
        
        // Let's start by giving our view's layer a nice color using backgroundColor, just like you would on a normal UIView
        self.view.layer.backgroundColor = UIColor(white: 0.9, alpha: 1.0).CGColor
        
        
        /*
        
        As you saw, we didn't have to instantiate a CALayer here, it comes with every view by default
        Let's create a new CALayer by instantiating a new one
        Give it an other backgroundcolor and give it frame
        Layers just as views need frames before you can see them
        Add the new Layer to the main view's layer
        
        A disadvantage is that there's no such thing as autolayout for layers
        So no constraitns, just frames, that can become annoying, and than it's figuring out how to solve this, more on this later
        
        */
        
        
        // Create a new layer, give it a frame and background color and add it to the main layer
        let newLayer = CALayer()
        newLayer.backgroundColor = UIColor.redColor().CGColor
        newLayer.frame = CGRectMake(100, 100, 100, 100)
        self.view.layer.addSublayer(newLayer)
        
        /*
        
        As you can see we have a trash can on the top left
        Let's set up the action for that barButtonItem to delete all Layers
        Look for the method deleteAllLayers in this class
        
        */
        
        // Now let's create a UILabel
        let newLabel = UILabel(frame: CGRectMake(20, 500, 120, 30))
        newLabel.text = "YO GA"
        newLabel.font = UIFont(name: "HelveticaNeue", size: 30)
        newLabel.textColor = UIColor(red: 0.18, green: 0.222, blue: 0.249, alpha: 1)
        self.view.addSubview(newLabel)
        
        /*
        
        SHADOW
        
        That seems to be not really visible
        Let's add some shadow to the label
        shadowColor is obvious what it does, it expects a CGColor
        shadowOffSet expects a CGSize where width is horizontal offset and height is vertical offset
        shadowRadius is like the blurryness of your shadow (is that even English??), so 1 would be crisp shadow, 10 would be a very blurry shadow
        shadowOpacity is obvious as well I guess
        
        */
        
        newLabel.layer.shadowColor = UIColor.redColor().CGColor
        newLabel.layer.shadowOffset = CGSizeMake(0, 3)
        newLabel.layer.shadowRadius = 1
        newLabel.layer.shadowOpacity = 1
    }

    @IBAction func deleteAllLayers(sender: UIBarButtonItem) {
        // Delete all layers by setting sublayers to nil
        self.view.layer.sublayers = nil
        
//        for var index = 0; index < self.view.layer.sublayers.count; index++ {
//            let currentLayer = self.view.layer.sublayers[index] as? CALayer
//            if let foo = self.view.layer.sublayers[index] as? CALayer {
//                foo.removeFromSuperlayer()
//            }
//        }
    }
    
    @IBAction func createArc(sender: AnyObject) {
        // Watch out here, everything should be CGFloat's, if not, xCode will throw you a stupid error that says extra argument in call, which doesn't make any sense
        let path = UIBezierPath(arcCenter: self.createRandomPointOnScreen(), radius: CGFloat(16.0), startAngle: CGFloat(M_PI), endAngle: CGFloat(-M_PI / 2), clockwise: true)
        
        let layer = CAShapeLayer()
        layer.path = path.CGPath
        layer.strokeColor = UIColor.yellowColor().CGColor
        layer.lineWidth = 5.0
        layer.fillColor = UIColor.clearColor().CGColor
        self.view.layer.addSublayer(layer)
    }
    
    @IBAction func createOval(sender: UIBarButtonItem) {
        let path = UIBezierPath(ovalInRect: self.createRandomFrameForScreen())
        
        let layer = CAShapeLayer()
        layer.path = path.CGPath
        layer.fillColor = UIColor.purpleColor().CGColor
        self.view.layer.addSublayer(layer)
    }
    
    @IBAction func createTriangle(sender: UIBarButtonItem) {
        let randomPoint = createRandomPointOnScreen()
        
        let path = UIBezierPath()
        path.moveToPoint(randomPoint)
        path.addLineToPoint(CGPointMake(randomPoint.x + 20, randomPoint.y + 40))
        path.addLineToPoint(CGPointMake(randomPoint.x - 20, randomPoint.y + 40))
        path.closePath()
        
        
        let layer = CAShapeLayer()
        layer.path = path.CGPath
        layer.fillColor = UIColor.greenColor().CGColor
        self.view.layer.addSublayer(layer)
    }
    
    
    @IBAction func createGradient(sender: AnyObject) {
        /*
        
        GRADIENTS
        
        These are awesome, no but seriously
        You can set multiple things on gradients
        .colors of course, that expects an array of colors, casted to CGColors, you can add up to how many colors you want
        .frame, it needs a frame
        .startPoint and .endPoint, by default a CAGradientLayer is top to bottom, this allows you to go crazy
        .locations, where does which color start, note your locations array of floats, has to be the same length as your colors array
        
        */
        
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor(red: 0.349, green: 0.584, blue: 0.906, alpha: 1.0).CGColor, UIColor(red: 0.992, green: 0.38, blue: 0.278, alpha: 1.0).CGColor]
        gradient.startPoint = CGPointMake(0, 0)
        gradient.endPoint = CGPointMake(1, 1)
        gradient.locations = [0.4, 1.0]
        gradient.frame = self.view.frame
        self.view.layer.insertSublayer(gradient, atIndex: 0)
    }
    
    func randomInRange(lo: Int, hi : Int) -> Int {
        return lo + Int(arc4random_uniform(UInt32(hi - lo + 1)))
    }
    
    func createRandomPointOnScreen() -> CGPoint {
        var point = CGPoint()
        point.x = CGFloat(arc4random_uniform(UInt32(self.view.frame.width)))
        point.y = CGFloat(arc4random_uniform(UInt32(self.view.frame.height)))
        
        return point
    }
    
    func createRandomFrameForScreen() -> CGRect {
        var frame = CGRect()
        frame.origin = createRandomPointOnScreen()
        frame.size = CGSizeMake(CGFloat(arc4random_uniform(UInt32(50 + 1))), CGFloat(arc4random_uniform(UInt32(50 + 1))))
        
        return frame
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

