//
//  ViewController.swift
//  NekokichiKadai6
//
//  Created by Nekokichi on 2022/04/30.
//
/*
 工夫したこと
 ・ハードコーディングによるリテラルを減らし、変数やプロパティで代用
    ・箇所：UILabel,UISlider,UIAlertController
    ・理由：リテラルの書き換えをコンパイルで検出できないから
 ・あたりとはずれの場合をif文で網羅
 */

import UIKit

final class ViewController: UIViewController {

    @IBOutlet weak private var slider: UISlider!
    @IBOutlet weak private var answerNumberLabel: UILabel!

    private var correctAnswer = Int.random(in: 1...100)

    override func viewDidLoad() {
        super.viewDidLoad()

        // 初期設定
        answerNumberLabel.text = String(correctAnswer)
        setupSlider()
    }

    @IBAction func checkAnswerButton(_ sender: UIButton) {
        let alertMessage: String
        if correctAnswer == Int(slider.value) {
            alertMessage = "あたり！\nあなたの値：" + String(Int(slider.value))
        } else {
            alertMessage = "はずれ！\nあなたの値：" + String(Int(slider.value))
        }
        let alert = UIAlertController(title: "結果", message: alertMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "再挑戦", style: .cancel, handler: { _ in
            self.answerNumberLabel.text = String(Int.random(in: 1...100))
            self.resetSlider()
        }))
        present(alert, animated: true, completion: nil)
    }

    private func setupSlider() {
        slider.maximumValue = 100.0
        slider.minimumValue = 0.0
        slider.value = 50.0
    }

    private func resetSlider() {
        slider.value = 50.0
    }
}
