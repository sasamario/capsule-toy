//
//  CollectionViewController.swift
//  capsule toy
//
//  Created by 笹間巧馬 on 2021/01/04.
//

import UIKit

class CollectionViewController: UIViewController {
    
    //コレクションの配列
    var items: [String] = ["なし", "なし", "なし", "なし", "なし"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //デバイスに保存されているコレクションを表示させる
        for i in 0..<5 {
            if UserDefaults.standard.object(forKey: "\(i)") != nil {
                //デバイス内にアイテムデータがある場合、items配列に格納する
                items[i] = UserDefaults.standard.object(forKey: "\(i)") as! String
                
            } else {
                //デバイス内にアイテムデータがない場合、items配列なしを格納（この処理はなくても良いが一応）
                items[i] = "なし"
            }
            
            //デバック
            if items[i] != "なし" {
                print(items[i])
            }
        }
        //デバック
        print("------")
        
    }
    
    //戻る処理
    @IBAction func back(_ sender: Any) {
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
