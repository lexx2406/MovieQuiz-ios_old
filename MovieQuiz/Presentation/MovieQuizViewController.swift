import UIKit

final class MovieQuizViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        noButton.titleLabel?.font = UIFont(name: "YS Display-Medium", size: 20)
        yesButton.titleLabel?.font = UIFont(name: "YS Display-Medium", size: 20)
        textLabel.font = UIFont(name: "YS Display-Bold", size: 26)
        counterLabel.font = UIFont(name: "YS Display-Medium", size: 20)
        labelQuestion.font = UIFont(name: "YS Display-Medium", size: 20)
        imageView.layer.masksToBounds = true
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.cornerRadius = 6
    }
    @IBOutlet weak private var noButton: UIButton!
    @IBOutlet weak private var yesButton: UIButton!
    @IBOutlet weak private var imageView: UIImageView!
    @IBOutlet weak private var textLabel: UILabel!
    @IBOutlet weak private var counterLabel: UILabel!
    @IBAction private func noButtonClicked(_ sender: Any) {
        let currentQuestion = questions[currentQuestionIndex]
        let givenAnswer = false
        showAnswerResult(isCorrect: givenAnswer == currentQuestion.correctAnswer)
    }
    @IBAction private func yesButtonClicked(_ sender: Any) {
        let currentQuestion = questions[currentQuestionIndex]
        let givenAnswer = true
        showAnswerResult(isCorrect: givenAnswer == currentQuestion.correctAnswer)
        
    }
    @IBOutlet weak private var labelQuestion: UILabel!
    
    private func show(quiz step: QuizStepViewModel) {
        imageView.image = step.image
        textLabel.text = step.question
        counterLabel.text = step.questionNumber
    }
    
    private func showNextQuestionOrResults() {
        if currentQuestionIndex == questions.count - 1 { // 1
            // идём в состояние "Результат квиза"
        } else {
            currentQuestionIndex += 1
            let nextQuestion = questions[currentQuestionIndex]
            let newModel = convert(model: nextQuestion)
            show(quiz: viewModel)
        }
    }
        private func showAnswerResult(isCorrect: Bool) {
                imageView.layer.masksToBounds = true
                imageView.layer.borderWidth = 8
                imageView.layer.borderColor = isCorrect ? UIColor.ysGreen.cgColor : UIColor.ysRed.cgColor
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    self.showNextQuestionOrResults()
                }
            }
                
    
        let alert = UIAlertController(
            title: "Этот раунд окончен!",
            message: "Ваш результат ???",
            preferredStyle: .alert)
        let action = UIAlertAction(title: result.buttonText, style: .default) { _ in
            self.currentQuestionIndex = 0
            self.correctAnswers = 0
            let firstQuestion = self.questions[self.currentQuestionIndex]
            let viewModel = self.convert(model: firstQuestion)
            self.show(quiz: viewModel)
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
        }
    private let questions: [QuizQuestion] = [
        QuizQuestion (image: "The Godfather",
                      question: "Рейтинг этого фильма больше чем 6?",
                      correctAnswer: true),
        QuizQuestion (image: "The Dark Knight",
                      question: "Рейтинг этого фильма больше чем 6?",
                      correctAnswer: true),
        
        QuizQuestion (image: "Kill Bill",
                      question: "Рейтинг этого фильма больше чем 6?",
                      correctAnswer: true),
        QuizQuestion (image: "The Avengers",
                      question: "Рейтинг этого фильма больше чем 6?",
                      correctAnswer: true),
        QuizQuestion (image: "Deadpool",
                      question: "Рейтинг этого фильма больше чем 6?",
                      correctAnswer: true),
        QuizQuestion (image: "The Green Knight",
                      question: "Рейтинг этого фильма больше чем 6?",
                      correctAnswer: true),
        
        QuizQuestion (image: "Old",
                      question: "Рейтинг этого фильма больше чем 6?",
                      correctAnswer: false),
        QuizQuestion (image: "The Ice Age Adventures of Buck Wild",
                      question: "Рейтинг этого фильма больше чем 6?",
                      correctAnswer: false),
        QuizQuestion (image: "Tesla",
                      question: "Рейтинг этого фильма больше чем 6?",
                      correctAnswer: false),
        
        QuizQuestion (image: "Vivarium",
                      question: "Рейтинг этого фильма больше чем 6?",
                      correctAnswer: false),
    ]
    
struct QuizQuestion {
    let image:String
    let question:String
    let correctAnswer:Bool
}
    private var currentQuestionIndex = 0
    private var correctAnswer = 0
    struct QuizStepViewModel {
        let image: UIImage
        let question: String
        let questionNumber: String
    }
    private func convert(model: QuizQuestion) -> QuizStepViewModel {
        let questionStep = QuizStepViewModel(
            image: UIImage(named: model.image) ?? UIImage(),
            question: model.question,
            questionNumber: "\(currentQuestionIndex + 1)/\(questions.count)")
        return questionStep
    }
}
