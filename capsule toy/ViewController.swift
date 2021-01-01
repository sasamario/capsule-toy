//
//  ViewController.swift
//  capsule toy
//
//  Created by 笹間巧馬 on 2020/12/31.
//

import UIKit

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //ガチャガチャボタンメソッド
    @IBAction func capsuleAction(_ sender: UIButton) {
        
        rotate(sender: sender)
        
    }
    
    //回転アニメーションメソッド
    func rotate(sender: UIButton) {
        //回転中ボタンを押せないようにする
        sender.isEnabled = false
        
        let rotationAnimation = CABasicAnimation(keyPath:"transform.rotation.z")
        
        //toValueで、アニメーション終了時の値（絶対的な値）を指定。ここで終了時の角度を指定する。
        //角度をラジアンに変換する式　θ = θo × π/180 [rad]　 θoに自分の指定したい角度を指定すれば良い。
        rotationAnimation.toValue = CGFloat(Double.pi / 180) * 180
        
        //durationでアニメーションの速度を指定
        rotationAnimation.duration = 0.4
        
        //アニメーションの回数
        rotationAnimation.repeatCount = 2
        
        //アニメーションの追加？
        sender.layer.add(rotationAnimation, forKey: "rotationAnimation")
        
        
        sender.isEnabled = true
    }
    
}

