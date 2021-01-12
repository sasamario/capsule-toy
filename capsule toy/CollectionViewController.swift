//
//  CollectionViewController.swift
//  capsule toy
//
//  Created by 笹間巧馬 on 2021/01/04.
//

import UIKit

class CollectionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    //コレクションの配列
    var items: [String] = ["なし", "なし", "なし", "なし", "なし"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        //デバイスに保存されているコレクションを表示させる
//        for i in 0..<5 {
//            if UserDefaults.standard.object(forKey: "\(i)") != nil {
//                //デバイス内にアイテムデータがある場合、items配列に格納する
//                items[i] = UserDefaults.standard.object(forKey: "\(i)") as! String
//
//            } else {
//                //デバイス内にアイテムデータがない場合、items配列なしを格納（この処理はなくても良いが一応）
//                items[i] = "なし"
//            }
//
//            //デバック
//            if items[i] != "なし" {
//                print(items[i])
//            }
//        }
//        //デバック
//        print("------")
//
    }
    
    //戻る処理
    @IBAction func back(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    //セクション内のセルの数（つまり、表示させたい要素の数）
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        //セルの数＝アイテムの数のためアイテム数を返す
        return items.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell:UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        
        let itemImage = cell.contentView.viewWithTag(1) as! UIImageView
        
        //Tag番号を指定して、ラベルのインスタンスを生成
        let itemLabel = cell.contentView.viewWithTag(2) as! UILabel
        
        if UserDefaults.standard.object(forKey: "\(indexPath.row)") != nil {
            //imageViewに画像を反映させる
            itemImage.image = UIImage(named: "makimono_item")
            
            itemLabel.text = "\(indexPath.row + 1)"
            
        } else {
            //imageViewに画像を反映させる
            itemImage.image = UIImage(named: "mark_question")
            
            itemLabel.text = "\(indexPath.row + 1)"
        }
       
        return cell
    }
    
    //セクション数
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
    }
    
    //セルのサイズを指定する処理
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // 横方向のスペース調整
            let horizontalSpace:CGFloat = 5
            let cellSize:CGFloat = self.view.bounds.width/3 - horizontalSpace*2
            // 正方形で返すためにwidth,heightを同じにする
            return CGSize(width: cellSize, height: cellSize)
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
