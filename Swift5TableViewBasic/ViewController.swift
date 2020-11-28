//
//  ViewController.swift
//  Swift5TableViewBasic
//
//  Created by 西谷恭紀 on 2020/11/27.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate {
    
    @IBOutlet var textField: UITextField!
    @IBOutlet var tableView: UITableView!
    
    var textArray = [String]()  //String型の配列
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //デリゲートの設定
        tableView.delegate = self
        tableView.dataSource = self
        textField.delegate = self
        
    }
    
    /*TableViewDelegateにおいて必要なメソッド
     func tableView
     これはFixでXcodeが出してくれる
     
     どの順番で呼ばれるのか？
     1.セクションの数を確認
     func numberOfSections(in tableView: UITableView) -> Int {
     
     2.セクションの中のセルの数を確認
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     
     3｡最後にセルを構築する箇所が呼ばれる
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     */
    
    //セルの中のセクションの数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //textFieldに入力されたセルの値を返す
        return textArray.count
        
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    
    //セルが構築されるときに呼ばれる
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = textArray[indexPath.row]
        cell.imageView!.image = UIImage(named: "checkImage")
        
        return cell
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //タップしたときに､その配列の番号の中身を取り出して値を渡す
        let nextVC = storyboard?.instantiateViewController(identifier: "next") as! NextViewController
        nextVC.todoString = textArray[indexPath.row]
        navigationController?.pushViewController(nextVC, animated: true)
        
    }
    
    
    func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) -> CGFloat {
        
        return view.frame.size.height/6
    }
    
    //returnキーを押したときの挙動
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textArray.append(textField.text!)
        textField.resignFirstResponder()
        textField.text = ""
        tableView.reloadData() //tableViewの構築処理をもう一度実施する
        
        return true
        
    }
    
}

