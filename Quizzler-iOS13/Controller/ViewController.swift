//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var button0: UIButton!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    
    var buttons: [UIButton]? = nil
    @IBOutlet weak var scoreLabel: UILabel!
    
    var quizBrain = QuizBrain(multipleChoice: true)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        buttons = [button0, button1, button2]
        updateUI()
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        print("Answer button pressed")
        let userAnswer = sender.currentTitle! //True or False
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
    
        quizBrain.nextQuestion()
        Timer.scheduledTimer(timeInterval: 0.3, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
        
        
        
    }
    
    @objc func updateUI() {
        questionLabel.text = quizBrain.getQuestionText()
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        
        for i in 0...buttons!.count-1 {
            buttons![i].setTitle(quizBrain.getAnswerOption(i), for: .normal)
            buttons![i].backgroundColor = UIColor.clear
        }
        

    }
    
}

