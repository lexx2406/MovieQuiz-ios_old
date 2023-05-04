import UIKit

final class MovieQuizViewController: UIViewController {
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        noButton.titleLabel?.font = UIFont(name: "YS Display-Medium", size: 20)
        yesButton.titleLabel?.font = UIFont(name: "YS Display-Medium", size: 20)
        textLabel.font = UIFont(name: "YS Display-Bold", size: 26)
        counterLabel.font = UIFont(name: "YS Display-Medium", size: 20)
        labelQuestion.font = UIFont(name: "YS Display-Medium", size: 20)
    }
    @IBOutlet weak private var noButton: UIButton!
    @IBOutlet weak private var yesButton: UIButton!
    @IBOutlet weak private var imageView: UIImageView!
    @IBOutlet weak private var textLabel: UILabel!
    @IBOutlet weak private var counterLabel: UILabel!
    @IBAction private func noButtonClicked(_ sender: Any) {
    }
    @IBAction private func yesButtonClicked(_ sender: Any) {
    }
    @IBOutlet weak private var labelQuestion: UILabel!
    
    private func show(quiz step: QuizStepViewModel) {
      imageView.image = step.image
      textLabel.text = step.question
      counterLabel.text = step.questionNumber
    }
}

/*
 Mock-данные
 
 
 Картинка: The Godfather
 Настоящий рейтинг: 9,2
 Вопрос: Рейтинг этого фильма больше чем 6?
 Ответ: ДА


 Картинка: The Dark Knight
 Настоящий рейтинг: 9
 Вопрос: Рейтинг этого фильма больше чем 6?
 Ответ: ДА


 Картинка: Kill Bill
 Настоящий рейтинг: 8,1
 Вопрос: Рейтинг этого фильма больше чем 6?
 Ответ: ДА


 Картинка: The Avengers
 Настоящий рейтинг: 8
 Вопрос: Рейтинг этого фильма больше чем 6?
 Ответ: ДА


 Картинка: Deadpool
 Настоящий рейтинг: 8
 Вопрос: Рейтинг этого фильма больше чем 6?
 Ответ: ДА


 Картинка: The Green Knight
 Настоящий рейтинг: 6,6
 Вопрос: Рейтинг этого фильма больше чем 6?
 Ответ: ДА


 Картинка: Old
 Настоящий рейтинг: 5,8
 Вопрос: Рейтинг этого фильма больше чем 6?
 Ответ: НЕТ


 Картинка: The Ice Age Adventures of Buck Wild
 Настоящий рейтинг: 4,3
 Вопрос: Рейтинг этого фильма больше чем 6?
 Ответ: НЕТ


 Картинка: Tesla
 Настоящий рейтинг: 5,1
 Вопрос: Рейтинг этого фильма больше чем 6?
 Ответ: НЕТ


 Картинка: Vivarium
 Настоящий рейтинг: 5,8
 Вопрос: Рейтинг этого фильма больше чем 6?
 Ответ: НЕТ
 */
struct QuizQuestion {
    let image:String
    let question:String
    let correctAnswer:Bool
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
