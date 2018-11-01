//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Place your instance variables here
    
    let allQuestions = QuestionBank()
    var pickedAnswer : Bool = false
    var questionNumber : Int = 0
    var score : Int = 0
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextQuestion()
        updateUI()
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        if sender.tag == 1 {
           pickedAnswer = true
        }
        else {
            pickedAnswer = false
        }
        checkAnswer()
        //Increment the question number
        questionNumber = questionNumber + 1
        nextQuestion()
    }
    
    
    func updateUI() {
        progressLabel.text = "\(questionNumber + 1) / 13"
        scoreLabel.text = "Score: \(score)"
    }
    

    func nextQuestion() {
        
        if questionNumber <= 12 {
            questionLabel.text = allQuestions.list[questionNumber].questionText
        }
        else {
            let alert = UIAlertController(title: "Awesome", message: "You've finished all the questions, Do you want to start over?", preferredStyle: .alert)
            let restartAction = UIAlertAction(title: "Restart", style: .default) { (UIAlertAction) in
                self.startOver()
            }
            alert.addAction(restartAction)
            present(alert, animated: true, completion: nil)
        }
    }
    
    
    func checkAnswer() {
        if allQuestions.list[questionNumber].answer == pickedAnswer {
            score = score + 1
        }
        else {
            print("Wrong answer")
        }
        updateUI()
    }
    
    
    func startOver() {
        questionNumber = 0
        nextQuestion()
    }
    

    
}
