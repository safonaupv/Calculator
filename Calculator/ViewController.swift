import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var displayScreen: UILabel!
    @IBOutlet weak var operationLabel: UILabel!
    
    
    
    var isTyping: Bool = false
    var calculatorBrain = CalculatorFunctional()
    
    var displayText: String {
        get {return displayScreen.text!}
        set {displayScreen.text = newValue}
    }
    var operationText: String {
        get {return operationLabel.text!}
        set {operationLabel.text = newValue}
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
        displayText = calculatorBrain.function(name: buttonName, arg: displayText)
        if buttonName == "c"{
            operationText = ""
        } else {
            operationText = buttonName
        }
        isTyping = false
    }
}

