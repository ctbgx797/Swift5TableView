//
//  NextViewController.swift
//  Swift5TableViewBasic
//
//  Created by 西谷恭紀 on 2020/11/28.
//

import UIKit

class NextViewController: UIViewController {

    var todoString = String()
    @IBOutlet var todoLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        todoLabel.text = todoString
     
    }
    
    //画面が表示されるたびに何回も呼ばれる NavigationBarを表示にする
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
    }
    
    

}
