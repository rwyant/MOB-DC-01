import UIKit


extension String {
    var floatValue: Float {
        return (self as NSString).floatValue
    }
}


class ViewController: UIViewController {
   
    
  
    
    // Functions of use for this exercise:
    // Translating a string to an integer: "1".toInt()
    // Getting the text from a text field: let text = textFieldName.text
    // Setting the text on a text label or text field: textLabelName.text = "some text"
    
    /*
    TODO: Create a text field, a label and a button in the storyboard's View Controller. Drag a new outlet from the label and text field to this file, then drag the 'touch up inside' event on the button into this file. When the button is clicked, make the text of the label display 'hello {whatever the text in the text field is}. Call an instructor/TA when you're done with this task.
    */
//    @IBOutlet weak var nameText: UITextField!
//    @IBOutlet weak var nameLabel: UILabel!
//    @IBAction func nameButton(sender: AnyObject) {
//        nameText.text = nameLabel.text
//    }
    
    /*
//    TODO: Paste the fibonacci number function that you previously created into this class. Change the text box to use a numeric keypad for input. When the button is pressed, make the label print out the nth number in the fibonacci sequence (where n is the value of the text in the text field). Call an instructor/TA when you're done with this task.
//    */
//
//    @IBOutlet weak var nameLabel: UILabel!
//    @IBOutlet weak var nameText: UITextField!
//
//    
//    func fib(place: Int) -> Int {
//        var fibNum = place, current = 0, next = 1, result = 0
//        for index in 0..<fibNum {
//            let tempVar = current
//            current = next
//            next = tempVar + current
//            result = tempVar
//        }
//        
//        return result
//    
//    }
//    
//    @IBAction func nameButton(sender: AnyObject) {
//        let fibNum: Int = fib(nameText.text.toInt()!)
//        nameLabel.text = String(fibNum)
//        println("button tapped")
//    }
//
//    @IBAction func clearButton(sender: AnyObject) {
//        nameLabel.text = "Hello, instructor."
//    }
//    
//    
//    
    /*
    TODO: Drag a new text field into the view controller, and create an outlet for it here. Make both text fields use the numeric keypad. One text field represents an optional tip percentage (in integer form, e.g 20 = 20% tip), the other represents the total amount of a bill. When the button is pressed, make the label display both the total amount and tip amount (e.g. "total: $100, tip: $15"). Call an instructor/TA when you're done with this task.
    */

    @IBOutlet weak var nameText1: UITextField!
    @IBOutlet weak var nameText2: UITextField!
    @IBOutlet weak var nameLabel: UILabel!

    @IBAction func calculateButton(sender: AnyObject) {
        var tipFloat = (nameText2.text as NSString).floatValue
        var billFloat = (nameText1.text as NSString).floatValue
        var tipAmount = (tipFloat/100) * billFloat
        
        if (nameText1.text == nil) {
        println("Nothing is entered.")
        } else if (nameText2.text == nil) {
        var displayBill = "The total bill amount is $\(nameText1.text)."
        nameLabel.text = displayBill
        } else {
        var displayBill = "The total bill amount is $\(nameText1.text).               An additional tip of \(nameText2.text)% would be $\(tipAmount)."
        nameLabel.text = displayBill
        }
        
    }

    @IBAction func calculateChangeButton(sender: AnyObject) {
        func change (dollarAmount:Float) -> String {
            var chng1:Float = dollarAmount % 1 * 100
            var chng: Int = Int(chng1)
            var quarter = 25
            var dime = 10
            var nickle = 5
            var penny = 1
            var dollar = Int(dollarAmount)/1
            var quarterCount = 0
            var dimeCount = 0
            var nickleCount = 0
            var pennyCount = 0
            
            if chng >= quarter {
                quarterCount = (chng / quarter)
                chng = chng - (quarterCount * quarter)
            } else {
                println("Skip Quarter")
            }
            if chng >= dime {
                dimeCount = (chng / dime)
                chng = chng - (dimeCount * dime)
            } else {
                println("Skip Dime")
            }
            if chng >= nickle {
                nickleCount = (chng / nickle)
                chng = chng - (nickleCount * nickle)
            } else {
                println("Skip Nickle")
            }
            if chng >= penny {
                pennyCount = (chng / penny)
                chng = chng - (pennyCount * penny)
            } else {
                println("Skip Penny")
            }
            
            
            var result = ""
            result = ("Change distribution is ($\(nameText1.text)):                 Dollar = \(dollar), Q = \(quarterCount), D = \(dimeCount), N = \(nickleCount), P = \(pennyCount)")
            return result
        }
        

//        var floatVal : Float = NSString(string:nameText1).floatVal

         var floatVal = (nameText1.text as NSString).floatValue
        
    nameLabel.text = change(floatVal)
        
        
    }
}
















