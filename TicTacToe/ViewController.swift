//
//  ViewController.swift
//  TicTacToe
//
//  Created by madhav sharma on 7/14/20.
//  Copyright © 2020 madhav sharma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var activeGame = true
    
    var activePlayer = 1
    
    let gameDrawState = [1 ,2 ,1 ,2 ,1 ,2 ,1 ,2 ,1 ]
    
    var gameState = [0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ]

    let winningCombinations = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    
    @IBAction func buttonPressed(_ sender: AnyObject) {
        
        let activePosition = sender.tag - 1
        
        if gameState[activePosition] == 0 && activeGame {
            
            gameState[activePosition] = activePlayer
            
            if activePlayer == 1 {
                
                sender.setImage(UIImage(named: "nought.png"), for: [])
                activePlayer = 2
                
            } else {
                
                sender.setImage(UIImage(named: "cross.png"), for: [])
                activePlayer = 1
                
            }
            
            for combination in winningCombinations {
                
                if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]] {
                    
                    activeGame = false
                    
                    playAgainBtn.isHidden = false
                    
                    if gameState[combination[0]] == 1 {
                        winnerLabelColorN.isHidden = false
                        winnerLabelBlackN.isHidden = false
                    } else {
                        winnerLabelColor.isHidden = false
                        winnerLabelBlack.isHidden = false
                    }
                    
                    UIView.animate(withDuration: 1) {
                        self.winnerLabelColor.center = CGPoint(x: self.winnerLabelColor.center.x + 500, y: self.winnerLabelColor.center.y)
                         self.winnerLabelColorN.center = CGPoint(x: self.winnerLabelColorN.center.x + 500, y: self.winnerLabelColorN.center.y)
                        self.winnerLabelBlack.center = CGPoint(x: self.winnerLabelBlack.center.x + 500, y: self.winnerLabelBlack.center.y)
                        self.winnerLabelBlackN.center = CGPoint(x: self.winnerLabelBlackN.center.x + 500, y: self.winnerLabelBlackN.center.y)
                        self.playAgainBtn.center = CGPoint(x: self.playAgainBtn.center.x + 500, y: self.playAgainBtn.center.y)
                    }
                    
                }
                
                if gameState.contains(0) {
                } else {
                    playAgainBtn.isHidden = false
                }
                
            }
            
        }
        
    }
    
    @IBOutlet weak var playAgainBtn: UIButton!
    
    @IBAction func playAgain(_ sender: Any) {
        
        activeGame = true
        
        activePlayer = 1
        
        gameState = [0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ]
        
        for i in 1..<10 {
            
            if let button = view.viewWithTag(i) as? UIButton {
                
                button.setImage(nil, for: [])
                button.layer.borderWidth = 2.5
                button.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                
            }
            
            winnerLabelBlack.isHidden = true
            winnerLabelColor.isHidden = true
            winnerLabelColorN.isHidden = true
            winnerLabelBlackN.isHidden = true
            playAgainBtn.isHidden = true
            
            winnerLabelColor.center = CGPoint(x: winnerLabelColor.center.x - 500, y: winnerLabelColor.center.y)
            winnerLabelColorN.center = CGPoint(x: winnerLabelColorN.center.x - 500, y: winnerLabelColorN.center.y)
            winnerLabelBlack.center = CGPoint(x: winnerLabelBlack.center.x - 500, y: winnerLabelBlack.center.y)
            winnerLabelBlackN.center = CGPoint(x: winnerLabelBlackN.center.x - 500, y: winnerLabelBlackN.center.y)
            playAgainBtn.center = CGPoint(x: playAgainBtn.center.x - 500, y: playAgainBtn.center.y)
            
        }
        
        
    }
    @IBOutlet weak var xno: UILabel!
    
    @IBOutlet weak var xnoBlack: UILabel!
    
    
    @IBOutlet weak var boardBlack: UIImageView!
    
    @IBOutlet weak var boardColor: UIImageView!
    
    @IBOutlet weak var winnerLabelColor: UILabel!
    
    @IBOutlet weak var winnerLabelBlack: UILabel!
    
    @IBOutlet weak var winnerLabelColorN: UILabel!
    
    @IBOutlet weak var winnerLabelBlackN: UILabel!
    
    @IBOutlet weak var btn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //btn.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        //btn.layer.borderWidth = 2.5
        
        for i in 1..<10 {
        
            if let button = view.viewWithTag(i) as? UIButton {
            
                button.setImage(nil, for: [])
                button.layer.borderWidth = 2.5
                button.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            
            }
        }
        
        boardColor.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        boardColor.layer.borderWidth = 2.5
        
        playAgainBtn.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        playAgainBtn.layer.borderWidth = 2.0
        playAgainBtn.layer.cornerRadius = 5.0
        
        let strokeTextAttributes = [
        NSAttributedString.Key.strokeColor : UIColor.black,
        NSAttributedString.Key.strokeWidth : -4.0]
        as [NSAttributedString.Key : Any]
        
        winnerLabelBlackN.attributedText = NSAttributedString(string: "NOUGHTS HAVE WON!", attributes: strokeTextAttributes)
        winnerLabelBlack.attributedText = NSAttributedString(string: "CROSSES HAVE WON!", attributes: strokeTextAttributes)
        xnoBlack.attributedText = NSAttributedString(string: "X  O", attributes: strokeTextAttributes)
        playAgainBtn.titleLabel?.attributedText = NSAttributedString(string: "Play Again!", attributes: strokeTextAttributes)
        
        winnerLabelBlack.isHidden = true
        winnerLabelColor.isHidden = true
        winnerLabelColorN.isHidden = true
        winnerLabelBlackN.isHidden = true
        playAgainBtn.isHidden = true
        
        winnerLabelColor.center = CGPoint(x: winnerLabelColor.center.x - 500, y: winnerLabelColor.center.y)
        winnerLabelColorN.center = CGPoint(x: winnerLabelColorN.center.x - 500, y: winnerLabelColorN.center.y)
        winnerLabelBlack.center = CGPoint(x: winnerLabelBlack.center.x - 500, y: winnerLabelBlack.center.y)
        winnerLabelBlackN.center = CGPoint(x: winnerLabelBlackN.center.x - 500, y: winnerLabelBlackN.center.y)
        playAgainBtn.center = CGPoint(x: playAgainBtn.center.x - 500, y: playAgainBtn.center.y)
        
        
        
        // Do any additional setup after loading the view.
    }


}

