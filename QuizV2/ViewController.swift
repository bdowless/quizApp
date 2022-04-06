//
//  ViewController.swift
//  QuizV2
//
//  Created by Brandon Dowless on 12/3/21.
//

import UIKit

class ViewController: UIViewController {
    var index = 0
    let quiz = racingQuiz
    lazy var questions = quiz.questions

    
    //MARK: Properties
    
    var buttonArray = [UIButton]()

    let questionlabel: UILabel = {
        let label = UILabel()
        label.text = "This is the first question"
        label.font = UIFont.systemFont(ofSize: 24)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        configureUI()
        configureQuestion()
    }
    
    //MARK: Selectors
    
    @objc func ButtonTapped(sender: UIButton) {
        
        let question = questions[index]
        let answers = question.answers
        
        guard let correctAnswer = answers.filter({ $0.correct}).first else { return }
        guard let selectedText = sender.titleLabel?.text else { return }
        
        if selectedText == correctAnswer.text {
            print("Correct Answer")
            index += 1
            configureQuestion()
        }
        else {
            print("Wrong Answer")
        }

    }

    
    func configureUI() {
        view.addSubview(questionlabel)
        questionlabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 70) .isActive = true
        questionlabel.centerXAnchor.constraint(equalTo: view.centerXAnchor) .isActive = true
        
        for _ in 1 ... 4 {
            let button = UIButton()
            button.setTitle("Answer", for: .normal)
            button.layer.cornerRadius = 10
            button.backgroundColor = .red
            button.heightAnchor.constraint(equalToConstant: 50) .isActive = true
            button.widthAnchor.constraint(equalToConstant: 200) .isActive = true
            button.translatesAutoresizingMaskIntoConstraints = false
            button.addTarget(self, action: #selector(ButtonTapped), for: .touchUpInside)
            buttonArray.append(button)
            
        }
            
            let stack = UIStackView(arrangedSubviews: buttonArray)
            stack.axis = .vertical
            stack.spacing = 12
            stack.distribution = .fill
            stack.translatesAutoresizingMaskIntoConstraints = false
            
            view.addSubview(stack)
        stack.centerXAnchor.constraint(equalTo: view.centerXAnchor) .isActive = true
        stack.centerYAnchor.constraint(equalTo: view.centerYAnchor) .isActive = true

    }

    func configureQuestion() {

        let question = questions[index]
        let answers = question.answers
        
        for i in 0 ..< buttonArray.count {
            let answer = answers[i]
            buttonArray[i].setTitle(answer.text, for: .normal)
        }
        
        questionlabel.text = question.text
        
        
    }
        
    

}

