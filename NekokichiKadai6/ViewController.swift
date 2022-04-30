//
//  ViewController.swift
//  NekokichiKadai6
//
//  Created by Nekokichi on 2022/04/30.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var slider: UISlider!

    @IBOutlet weak var answerNumberLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        answerNumberLabel.text = "\(arc4random_uniform(100))"
        slider.maximumValue = 100.0
        slider.minimumValue = 0.0
        slider.value = 50.0
    }

    @IBAction func checkAnswerButton(_ sender: UIButton) {
        var alertMessage: String {
            if Int(answerNumberLabel.text ?? "") ?? 0 == Int(slider.value) {
                return "あたり！\nあなたの値：\(Int(slider.value))"
            } else {
                return "はずれ！\nあなたの値：\(Int(slider.value))"
            }
        }
        let alert: UIAlertController = UIAlertController(title: "結果", message: alertMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "再挑戦", style: .cancel, handler: { _ in
            self.answerNumberLabel.text = "\(arc4random_uniform(100))"
            self.slider.value = 50.0
        }))
        present(alert, animated: true, completion: nil)
    }

}
