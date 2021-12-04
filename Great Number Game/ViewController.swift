//
//  ViewController.swift
//  Great Number Game
//
//  Created by administrator on 04/12/2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var guessNumTextField: UITextField!
    
    var answer=Int.random(in: 1...100)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changeViewRaduis()
        
    }
    
    func changeViewRaduis(){
        mainView.layer.cornerRadius=30
        mainView.clipsToBounds=true
    }
    
    
    @IBAction func submitButton(_ sender: Any) {
        if let guessNumber = Int(guessNumTextField.text!){
            
            if guessNumber==answer{
                showAlert(AlertTitle: "Correct", AlertMessage: "\(guessNumber) was correct!!", GuessStatus: true)
            }else if guessNumber>answer{
                showAlert(AlertTitle: "Incorrect", AlertMessage: "\(guessNumber) is too high", GuessStatus: false)
            }else{
                showAlert(AlertTitle: "Incorrect", AlertMessage: "\(guessNumber) is too low", GuessStatus: false)
            }
        }
        guessNumTextField.text?.removeAll()
        
        
    }
    
    func showAlert(AlertTitle:String,AlertMessage:String,GuessStatus:Bool) {
        let alert = UIAlertController(title: AlertTitle, message: AlertMessage, preferredStyle: .alert)
        
        
        // Accessing buttons tintcolor :
        alert.view.tintColor = UIColor.black
        
        
        if GuessStatus==false{
            alert.addAction(UIAlertAction(title: "Guess Again", style: UIAlertAction.Style.default, handler: nil))
            // Accessing alert view backgroundColor :
            alert.view.subviews.first?.subviews.first?.subviews.first?.backgroundColor = UIColor.red.withAlphaComponent(0.2)
            
        }else{
            alert.addAction(UIAlertAction(title: "Play Again", style: UIAlertAction.Style.default, handler: nil))
            answer=Int.random(in: 1...100)
            // Accessing alert view backgroundColor :
            alert.view.subviews.first?.subviews.first?.subviews.first?.backgroundColor = UIColor.green.withAlphaComponent(0.2)

        }
        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
}

