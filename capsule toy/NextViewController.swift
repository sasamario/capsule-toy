//
//  NextViewController.swift
//  capsule toy
//
//  Created by 笹間巧馬 on 2021/01/03.
//

import UIKit

class NextViewController: UIViewController {
    
    let messageArray = [
        "今日も1日お疲れ様です！早く寝ましょう。",
        "ナイスファイト！最高！",
        "明日はゆっくり休みましょう",
        "おつかれい！",
        "ナイス！",
        "良くできました",
        "良くがんばりました",
        "明日も頑張りましょう",
        "自分にご褒美をあげましょう",
        "土日はゆっくりしよう",
        "お風呂に浸かろう",
        "お酒でも飲もう"
        
    ]
    
    @IBOutlet weak var message: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        //指定範囲内でランダムな整数を生成
        let randomInt = Int.random(in: 0..<12)
        
        message.text = messageArray[randomInt]
        
        //もしデバイス内にメッセージが保存されていなかったら保存する
        if UserDefaults.standard.object(forKey: "\(randomInt)") == nil {
            UserDefaults.standard.set(messageArray[randomInt], forKey: "\(randomInt)")
        }
        
    }
    
    
    @IBAction func back(_ sender: Any) {
        
        //前の画面に戻る
        dismiss(animated: true, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
