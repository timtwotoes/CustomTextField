//
//  ViewController.swift
//  CustomTextField
//
//  Created by Tim on 01/02/2023.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var topMostTextField: PaddedTextField!
    @IBOutlet weak var bottomMostTextField: PaddedTextField!
    @IBOutlet weak var paddingSlider: NSSlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        NotificationCenter.default.addObserver(self, selector: #selector(textFieldWillBecomeFirstResponder(_:)), name: NSNotification.Name("TextFieldWillBecomeFirstResponder"), object: nil)
    }

    @objc func textFieldWillBecomeFirstResponder(_ notification: Notification) {
        paddingSlider.integerValue = Int((notification.object as! PaddedTextField).textPadding)
    }
    
    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func sliderDidChange(_ sender: NSSlider) {
        guard let window = view.window else {
            return
        }
        
        if window.firstResponder == topMostTextField.currentEditor() {
            topMostTextField.textPadding = CGFloat(sender.integerValue)
        } else {
            bottomMostTextField.textPadding = CGFloat(sender.integerValue)
        }
    }
    
}

