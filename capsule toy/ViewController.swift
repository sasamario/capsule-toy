//
//  ViewController.swift
//  capsule toy
//
//  Created by 笹間巧馬 on 2020/12/31.
//

import UIKit

class ViewController: UIViewController, CAAnimationDelegate {

    @IBOutlet weak var capsuleButton: UIButton!
    
    @IBOutlet weak var image: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        image.alpha = 0
        
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
        
        rotationAnimation.delegate = self
        
        //toValueで、アニメーション終了時の値（絶対的な値）を指定。ここで終了時の角度を指定する。
        //角度をラジアンに変換する式　θ = θo × π/180 [rad]　 θoに自分の指定したい角度を指定すれば良い。
        rotationAnimation.toValue = CGFloat(Double.pi / 180) * 180
        
        //durationでアニメーションの速度を指定
        rotationAnimation.duration = 0.4
        
        //アニメーションの回数
        rotationAnimation.repeatCount = 2
        
        //アニメーションの追加？
        sender.layer.add(rotationAnimation, forKey: "rotationAnimation")
        
    }
    
    //アニメーション終了時に実行されるメソッド
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        
        UIView.animate(withDuration: 0.5, delay: 0.0, options: UIView.AnimationOptions.curveEaseOut, animations: {
            //クロージャ内ではプロパティやメソッドを使用する際にはselfをつける必要がある
            
            //カプセルの透過率を1にして表示させる
            self.image.alpha = 1.0
            
        }, completion: { finished in
            //アニメーション終了時の処理
            
            //ボタンを押せるようにする
            self.capsuleButton.isEnabled = true
            
            //カプセルを非表示にする
            self.image.alpha = 0
            
            //画面遷移
            self.performSegue(withIdentifier: "next", sender: nil)
        })
        
    }
    
    
    
}

