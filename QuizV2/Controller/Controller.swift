//
//  Controller.swift
//  QuizV2
//
//  Created by Brandon Dowless on 12/6/21.
//

import UIKit

class constructerController: UIViewController {
    var index = 0
    let quiz = racingQuiz
    var correctAnswers = 1
    var currentQuizQuestionNumber = 1
    

    
    var buttons = [UIButton]()
    
    
    var progressBar: UIProgressView = {
        let progressBar = UIProgressView()
        progressBar.progress = 0.1
        progressBar.heightAnchor.constraint(equalToConstant: 10) .isActive = true
        progressBar.tintColor = .systemRed
        progressBar.translatesAutoresizingMaskIntoConstraints = false
        return progressBar
    }()
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Who is the best MotoGP rider?"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var currentQuestionLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureUI()
        configureQuiz()
    }
    
    //MARK: - Selectors
    
    @objc func didTapAnswerButton(sender: UIButton) {
        let quiz = racingQuiz
        let question = quiz.questions[index]
        let answers = question.answers
        guard let selecetedAnswer = sender.currentTitle else { return }
        guard let correctAnswer = answers.filter({ $0.correct }).first else { return }
        
        if index < quiz.questions.count - 1 {
            currentQuizQuestionNumber += 1
            currentQuestionLabel.text = "Question \(currentQuizQuestionNumber) / \(quiz.questions.count)"
        if selecetedAnswer == correctAnswer.text {
            sender.backgroundColor = .systemGreen

        } else {
            sender.backgroundColor = .systemRed
        }

            Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(configureQuiz), userInfo: nil, repeats: false)
        index += 1
        progressBar.progress = Float(index + 1) / Float(quiz.questions.count)
        }
        else {
           let controller = finalResultController()
            controller.finalResultLabel.text = "Correct Answers \(correctAnswers) / \(quiz.questions.count)"
            present(controller, animated: true, completion: nil)
        }
    }
    
    
    func configureUI() {
        for _ in 0 ... 3 {
            let button = templateButton(text: "Rossi")
            buttons.append(button)
        }
        
        let stack = UIStackView(arrangedSubviews: buttons)
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 20
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100) .isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor) .isActive = true
        
        view.addSubview(stack)
        stack.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20) .isActive = true
        stack.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20) .isActive = true
        stack.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 100) .isActive = true
        
        view.addSubview(progressBar)
        progressBar.topAnchor.constraint(equalTo: stack.bottomAnchor, constant: 100) .isActive = true
        progressBar.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20) .isActive = true
        progressBar.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20) .isActive = true
        
        view.addSubview(currentQuestionLabel)
        currentQuestionLabel.topAnchor.constraint(equalTo: progressBar.bottomAnchor, constant: 40) .isActive = true
        currentQuestionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor) .isActive = true
        currentQuestionLabel.text = "Question 1 / \(quiz.questions.count)"
    }
    
    @objc func configureQuiz() {
        let question = quiz.questions[index]
        titleLabel.text = question.text
        let answers = question.answers
        for i in 0 ..< buttons.count {
            let answer = answers[i]
            buttons[i].setTitle(answer.text, for: .normal)
            buttons[i].backgroundColor = .white
        }
    }
    
    
    //MARK: - Helpers
    func templateButton(text: String) -> UIButton {
        let button = UIButton()
        button.backgroundColor = .white
        button.heightAnchor.constraint(equalToConstant: 50) .isActive = true
        button.setTitle(text, for: .normal)
        button.layer.cornerRadius = 10
        button.layer.borderColor = UIColor.darkGray.cgColor
        button.layer.borderWidth = 1 / 2
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didTapAnswerButton), for: .touchUpInside)
        return button
    }
}
