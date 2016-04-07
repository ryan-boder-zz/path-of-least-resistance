//
//  ViewController.swift
//  PLRiOS
//
//  Created by Amanda Boder on 4/6/16.
//  Copyright © 2016 Ryan Boder. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        textView.delegate = self
    }
    
    @IBOutlet weak var textView: UITextView!
    
    // Dismiss the keyboard on invalid input
    func textView(textView: UITextView, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
        if !["0","1","2","3","4","5","6","7","8","9"," ","\n",""].contains(text) {
            textView.resignFirstResponder()
        }
        return true
    }

    @IBAction func pressed(sender: UIButton) {
        let parser = InputParser()
        let grid = parser.parse(textView.text)
        let finder = PathFinder()
        let result = finder.find(grid)
        //show((true, 24, [1,2,3]))
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
}

