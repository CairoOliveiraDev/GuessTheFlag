//
//  ViewController.swift
//  GuessTheFlag
//
//  Created by Cairo Oliveira on 15/05/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        
        finalScore()
        askQuestion(action: nil)
        
    }
    
    func askQuestion(action: UIAlertAction!){
        
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        title = countries[correctAnswer].uppercased()
        
        
    }

    @IBAction func buttonTap(_ sender: UIButton) {
        var title: String
        
        if sender.tag == correctAnswer{
            title = "YESSSIR"
            score += 1
            
        }else{
            title = "Wrong"
            score -= 1
        }
        
        let ac = UIAlertController(title: title, message: "Your score is \(score).", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        present(ac, animated: true)
    }
    
    func finalScore(){
        if score == 2{
            let endGame = UIAlertController(title: title, message: "Congrats", preferredStyle: .alert)
            endGame.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
            present(endGame, animated: true)
        }
    }
    
}

