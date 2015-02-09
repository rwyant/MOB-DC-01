import UIKit

class MapViewController: UIViewController, UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource {
    
    var dict = [["Dave": "DC"], ["Tedi": "NY"]]
    
    //var dictionary: [String: String] = ["Dave": "DC"]
    //var dictionaryArray = [dictionary]
    var textBoxOne = UITextField()
    var textBoxTwo = UITextField()
    var dictionaryTableView = UITableView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeTextBoxes()
        makeTableView()
        //var arrayOfDict = [dict]
        dictionaryTableView.dataSource = self
        self.dictionaryTableView.reloadData()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "makeTextBoxesBlueNow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "makeTextBoxesRedNow:", name: "makeTextBoxesRed", object: nil)
        
    }
    
    func makeTextBoxesBlueNow (notification: NSNotification) {
        textBoxOne.backgroundColor = UIColor.blueColor()
        textBoxTwo.backgroundColor = UIColor.blueColor()
    }
    
    func makeTextBoxesRedNow (notification: NSNotification){
        textBoxOne.backgroundColor = UIColor.redColor()
        textBoxTwo.backgroundColor = UIColor.redColor()
    }
    
    func makeTextBoxes() {
        //create text box one.
        textBoxOne = UITextField(frame: CGRect(x: self.view.frame.width * 0.05, y: 100, width: self.view.frame.width * 0.9, height: 40))
        textBoxOne.borderStyle = UITextBorderStyle.RoundedRect
        textBoxOne.backgroundColor = UIColor.whiteColor()
        textBoxOne.placeholder = ""
        textBoxOne.delegate = self
        self.view.addSubview(textBoxOne)
        
        //create text box two.
        textBoxTwo = UITextField(frame: CGRect(x: self.view.frame.width * 0.05, y: 150, width: self.view.frame.width * 0.90, height: 40))
        textBoxTwo.borderStyle = UITextBorderStyle.RoundedRect
        textBoxTwo.backgroundColor = UIColor.whiteColor()
        textBoxTwo.placeholder = ""
        textBoxTwo.delegate = self
        self.view.addSubview(textBoxTwo)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        var name = String(self.textBoxOne.text)
        var location = String(self.textBoxTwo.text)
        var arrayOfDict = [dict]
        arrayOfDict.append([name: location])
        
        
        //dictionaryArray.append([self.textBoxOne.text: self.textBoxTwo.text])
        //dictionaryArray.append([String(self.textBoxOne.text): String(self.textBoxTwo.text)])
        //dictionary["\(self.textBoxOne.text)"] = "\(self.textBoxTwo.text)"
        dictionaryTableView.reloadData()
        println("\(arrayOfDict)")
        
        //send a notification to turn boxes red.
        NSNotificationCenter.defaultCenter().postNotificationName("makeTextBoxesRed", object: nil)
        textBoxTwo.resignFirstResponder()
        textBoxOne.text = ""
        textBoxTwo.text = ""
        
        return true
    }
    
    func makeTableView() {
        dictionaryTableView = UITableView(frame: CGRect(x: self.view.frame.width * 0.05, y: 200, width: self.view.frame.width * 0.90, height: 100))
        dictionaryTableView.delegate = self
        dictionaryTableView.dataSource = self
        dictionaryTableView.reloadData()
        self.view.addSubview(dictionaryTableView)
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        println("about to count the items in dictionary array")
        println(arrayOfDict.count)
        return arrayOfDict.count
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("CellIdentifier") as? UITableViewCell ?? UITableViewCell(style: .Default, reuseIdentifier: "CellIdentifier")
        cell.textLabel?.text = self.arrayOfDict[indexPath.row]
        println("about to return cell")
        return cell
    }
    //    tableView
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if editingStyle == .Delete {
            //self.dictionaryArray.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            self.dictionary.count
        }
    }
    
}