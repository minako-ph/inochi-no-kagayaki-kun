//
//  ViewController.swift
//  koroshite-kun
//
//  Created by Minako Redrendo Yamamoto on 2020/08/27.
//  Copyright © 2020 Minako Redrendo Yamamoto. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate {

    let frame: UIView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // コロシテくんを格納する枠を画面の中央に用意する
        initFrame()
        // コロシテくんの生成
        createKoroshiteKun()

        // タップイベントの生成
        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapped(_:)))
        tapGesture.delegate = self
        self.view.addGestureRecognizer(tapGesture)
    }

    func initFrame() {
        frame.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(frame)

        frame.widthAnchor.constraint(equalToConstant: 300).isActive = true
        frame.heightAnchor.constraint(equalToConstant: 300).isActive = true
        frame.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        frame.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
    }

    func createKoroshiteKun() {
        // 胴体の位置とサイズ一覧
        let doutaiList: [CGRect] = [
            CGRect(x: 100, y: 0, width: 60, height: 60),
            CGRect(x: 150, y: 5, width: 80, height: 80),
            CGRect(x: 170, y: 70, width: 90, height: 43),
            CGRect(x: 190, y: 100, width: 55, height: 70),
            CGRect(x: 165, y: 160, width: 85, height: 85),
            CGRect(x: 120, y: 215, width: 80, height: 80),
            CGRect(x: 70, y: 220, width: 65, height: 65),
            CGRect(x: 50, y: 160, width: 45, height: 85),
            CGRect(x: 15, y: 110, width: 80, height: 80),
            CGRect(x: 60, y: 70, width: 65, height: 65),
            CGRect(x: 15, y: 50, width: 70, height: 70),
            CGRect(x: 60, y: 25, width: 55, height: 60)
        ]

        // 白目の位置とサイズ一覧
        let shiromeList: [CGRect] = [
            CGRect(x: 175, y: 10, width: 40, height: 40),
            CGRect(x: 205, y: 185, width: 40, height: 40),
            CGRect(x: 145, y: 255, width: 30, height: 30),
            CGRect(x: 45, y: 140, width: 35, height: 35),
            CGRect(x: 25, y: 65, width: 35, height: 35),
        ]

        // 黒目の位置とサイズ一覧
        let kuromeList: [CGRect] = [
            CGRect(x: 193, y: 13, width: 20, height: 20),
            CGRect(x: 225, y: 190, width: 20, height: 20),
            CGRect(x: 153, y: 271, width: 15, height: 15),
            CGRect(x: 55, y: 140, width: 18, height: 18),
            CGRect(x: 28, y: 67, width: 16, height: 16),
        ]

        // 胴体の生成
        for doutai in doutaiList {
            let doutai: KoroshiteKunGenerator = KoroshiteKunGenerator(frame: doutai);
            doutai.color = UIColor(red: 247/255, green: 5/255, blue: 2/255, alpha: 1)
            doutai.isOpaque = false
            frame.addSubview(doutai)
        }

        // 白目の生成
        for shirome in shiromeList {
            let shirome: KoroshiteKunGenerator = KoroshiteKunGenerator(frame: shirome);
            shirome.color = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
            shirome.isOpaque = false
            frame.addSubview(shirome)
        }

        // 黒目の生成
        for kurome in kuromeList {
            let kurome: KoroshiteKunGenerator = KoroshiteKunGenerator(frame: kurome);
            kurome.color = UIColor(red: 15/255, green: 125/255, blue: 252/255, alpha: 1)
            kurome.isOpaque = false
            frame.addSubview(kurome)
        }
    }

    // 画面のどこかしらをタップされた時
    @objc func tapped(_ sender: UITapGestureRecognizer) {
        let width: Int = Int(UIScreen.main.bounds.size.width)
        let height: Int = Int(UIScreen.main.bounds.size.height)

        let random_y: Int = Int.random(in: 1..<height)
        let random_x: Int = Int.random(in: 1..<width)

        if sender.state == .ended {
            let tsubuyaki: UILabel = UILabel()
            tsubuyaki.frame = CGRect(x: random_x, y: random_y, width: 160, height: 30)
            tsubuyaki.text = "ｺﾛｼﾃ... ｺﾛｼﾃ.."
            self.view.addSubview(tsubuyaki)

            Timer.scheduledTimer(withTimeInterval: 1.5, repeats: false, block: { (timer) in
                UIView.animate(withDuration: 0.5, delay: 0.5, options: .curveEaseOut, animations: {
                    tsubuyaki.alpha = 0.0
                }, completion: nil)
            })
        }
    }
}
// コロシテくんを生成するクラス
class KoroshiteKunGenerator: UIView {
    var color: UIColor!

    override func draw(_ rect: CGRect) {
        let oval: UIBezierPath = UIBezierPath(ovalIn: rect)
        color.setFill()
        oval.fill()
    }
}
