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

    override func viewDidLoad() {
        super.viewDidLoad()

        // 初期設定
        answerNumberLabel.text = String(arc4random_uniform(100))
        slider.setUp()
        slider.reset()
    }

    @IBAction func checkAnswerButton(_ sender: UIButton) {
        // extensionのプロパティを使用するために定義
        var alert = UIAlertController()
        var alertMessage: String {
            if Int(answerNumberLabel.text ?? "") ?? 0 == Int(slider.value) {
                return alert.rightAnswerMessage + String(Int(slider.value))
            } else {
                return alert.wrongAnswerMessage + String(Int(slider.value))
            }
        }
        alert = UIAlertController(title: alert.alertTitle, message: alertMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: alert.actionTitle, style: .cancel, handler: { _ in
            self.answerNumberLabel.text = String(arc4random_uniform(100))
            self.slider.reset()
        }))
        present(alert, animated: true, completion: nil)
    }
}

// スライダーのリテラルを防ぐため
private extension UISlider {
    func setUp() {
        self.maximumValue = 100.0
        self.minimumValue = 0.0
    }

    func reset() {
        self.value = 50.0
    }
}

// 文字列のリテラルを防ぐため
private extension UIAlertController {
    var alertTitle: String {
        "結果"
    }
    var actionTitle: String {
        "再挑戦"
    }
    var rightAnswerMessage: String {
        "あたり！\nあなたの値："
    }
    var wrongAnswerMessage: String {
        "はずれ！\nあなたの値："
    }
}
