//
//  ViewController.swift
//  NekokichiKadai6
//
//  Created by Nekokichi on 2022/04/30.
//

import UIKit

final class ViewController: UIViewController {

    struct AnswerMessage {
        let right = "あたり!\nあなたの値:"
        let wrong = "はずれ!\nあなたの値:"
    }

    @IBOutlet weak private var slider: UISlider!
    @IBOutlet weak private var answerNumberLabel: UILabel!
    private var answerNumber = Int.random(in: 1...100)

    @IBAction func checkAnswerButton(_ sender: UIButton) {
        let sliderValue = Int(slider.value)
        let message: String

        if sliderValue == answerNumber {
            message = AnswerMessage().right + "\(sliderValue)"
        } else {
            message = AnswerMessage().wrong + "\(sliderValue)"
        }

        showAlert(message: message)
    }

    override func viewDidLoad() {
        answerNumberLabel.text = "\(answerNumber)"
    }

    private func showAlert(message: String) {
        let alertController = UIAlertController(title: "結果", message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { _ in
            self.answerNumber = Int.random(in: 1...100)
            self.answerNumberLabel.text = "\(self.answerNumber)"
        }))
        present(alertController, animated: true, completion: nil)
    }
}
