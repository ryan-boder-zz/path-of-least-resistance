import UIKit

class ViewController: UIViewController, UITextViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        textView.delegate = self
        // Don't enable the button until a valid input grid has been entered
        enableButton(false)
    }
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var button: UIButton!
    
    func textView(textView: UITextView, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
        if !["0","1","2","3","4","5","6","7","8","9"," ","\n",""].contains(text) {
            // Dismiss the keyboard on an invalid key press
            textView.resignFirstResponder()
            // Only enable the button if the current input is valid
            enableButton(validate(textView.text))
        }
        return true
    }

    @IBAction func pressed(sender: UIButton) {
        let parser = InputParser()
        let grid = parser.parse(textView.text)
        let finder = PathFinder()
        let result = finder.find(grid)
        show(result)
    }
    
    private func show(result: (Bool, Int, Array<Int>)) {
        let (success, resistance, path) = result

        var message = success ? "Yes" : "No"
        message += "\n" + String(resistance)
        message += "\n" + path.map(){x in String(x)}.joinWithSeparator(" ")
        
        // create the alert
        let alert = UIAlertController(title: "Path of Least Resistance", message: message, preferredStyle: UIAlertControllerStyle.Alert)
        
        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        
        // show the alert
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    // Validates whether the current input is a valid grid
    private func validate(input: String) -> Bool {
        var width: Int!
        let rows = input.componentsSeparatedByString("\n")
        for row in rows {
            let items = row.componentsSeparatedByString(" ")
            if width == nil {
                width = items.count
            }
            if items.count != width {
                return false
            }
            for item in items {
                if Int(item) == nil {
                    return false
                }
            }
        }
        return width != nil
    }
    
    private func enableButton(enabled: Bool) {
        button.enabled = enabled
        button.alpha = enabled ? 1 : 0.5
    }
    
}
