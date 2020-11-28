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
    

}
