import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var displayScreen: UILabel!
    
    var isTyping: Bool = false
    var displayText: String {
        get {return displayScreen.text!}
        set {displayScreen.text = newValue}
    }
    
    @IBAction func digitPressed(_ sender: UIButton) {
        guard let digitName = sender.currentTitle else {return}
        if isTyping && displayText != "0"{
            displayText += digitName
        } else{
            displayText = digitName
            isTyping = true
        }
    }
    
    @IBAction func operation(_ sender: UIButton) {
        guard let buttonName = sender.currentTitle else {return}
        displayText = function(name: buttonName, arg: displayText)
        isTyping = false
    }
}

