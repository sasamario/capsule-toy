//
//  CollectionViewController.swift
//  capsule toy
//
//  Created by 笹間巧馬 on 2021/01/04.
//

import UIKit

class CollectionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    var number = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    //戻る処理
    @IBAction func back(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    //セクション内のセルの数（つまり、表示させたい要素の数）
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        //セルの数を返す
        return 12
    }
    
    //セルに表示する内容
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
    
    //セル選択時の処理
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        number = indexPath.row
        
        performSegue(withIdentifier: "itemView", sender: nil)
    }
    
    //segueが動作する際に処理されるメソッド
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //遷移先のCollectionItemViewControllerを取得
        let collectionItemVC = segue.destination as? CollectionItemViewController
        
        //遷移先（CollectionItemViewController）の変数に値を渡す
        collectionItemVC?.itemNumber = number
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
