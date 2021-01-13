//
//  CollectionItemViewController.swift
//  capsule toy
//
//  Created by 笹間巧馬 on 2021/01/12.
//

import UIKit

class CollectionItemViewController: UIViewController {

    @IBOutlet weak var message: UILabel!
    
    @IBOutlet weak var itemLabel: UILabel!
    
    @IBOutlet weak var itemImage: UIImageView!
    
    var itemNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if UserDefaults.standard.object(forKey: "\(itemNumber)") != nil {
            //imageViewに画像を反映させる
            
            itemLabel.text = UserDefaults.standard.object(forKey: "\(itemNumber)") as! String
            
        } else {
            message.text = "まだ持っていません"
            itemImage.image = UIImage(named: "mark_question")
        }
        
        // Do any additional setup after loading the view.
    }
    
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
