//
//  ViewController.swift
//  WordGuess
//
//  Created by Srilekha Janagam
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var DisplayLabel: UILabel!
    
    
    @IBOutlet weak var HintLabel: UILabel!
    
    
    @IBOutlet weak var letterEntered: UITextField!
    
    
    @IBOutlet weak var CheckButton: UIButton!
    
    
    @IBOutlet weak var statusLabel: UILabel!
    
    
    @IBOutlet weak var PlayAgainButton: UIButton!
    
   var words = [["SRILEKHA", "name"],
             ["SUBJECT", "WHITE"],
             ["COMPUTER", "Two wheeler"]]
    
    var count = 0;
    var word = ""
    var lettersGuessed = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        CheckButton.isEnabled = false;
        
        word = words[count][0]
        
        DisplayLabel.text = ""
        
       
        updateUnderscores();
        HintLabel.text = "Hint: "+words[count][1]
        statusLabel.text = ""
    }

    @IBAction func CheckButtonClicked(_ sender: Any) {
   
        var letter = letterEntered.text!
        
     
        lettersGuessed = lettersGuessed + letter
         var revealedWord = ""
        for l in word{
            if lettersGuessed.contains(l){
                revealedWord += "\(l)"
            }
            else{
                revealedWord += "_ "
            }
        }
        DisplayLabel.text = revealedWord
        letterEntered.text = ""
        
       
        if DisplayLabel.text!.contains("_") == false{
            PlayAgainButton.isHidden = false;
            CheckButton.isEnabled = false;
        }
        CheckButton.isEnabled = false
    }
    
    
    
    @IBAction func PlayAgainButton(_ sender: Any) {
        PlayAgainButton.isHidden = true
      
        lettersGuessed = ""
        count += 1
       
        if count == words.count{
            
            statusLabel.text = "Congruations!"
         
            DisplayLabel.text = ""
            HintLabel.text = ""
        }
        else{
            word = words[count][0]
           
            HintLabel.text = "Hint: "
            HintLabel.text! += words[count][1]
            
            CheckButton.isEnabled = true
            
            DisplayLabel.text = ""
            updateUnderscores()
        }
    }
    
    @IBAction func enterLabelChanged(_ sender: UITextField) {
        //Read the data from the text field
        var textEnterd = letterEntered.text!;
        
        textEnterd = String(textEnterd.last ?? " ").trimmingCharacters(in: .whitespaces)
        letterEntered.text = textEnterd
       
        if textEnterd.isEmpty{
            CheckButton.isEnabled = false
        }
        else{
            CheckButton.isEnabled = true
        }
        
    }
    
    func updateUnderscores(){
        for letter in word{
            DisplayLabel.text! += "- "
        }
    }
    
    
}

