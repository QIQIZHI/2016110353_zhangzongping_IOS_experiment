//
//  ViewController.swift
//  SqliteDemo
//
//  Created by zhangzongping on 2018/12/17.
//  Copyright © 2018年 zongping.zhang. All rights reserved.
//

import UIKit
import SQLite3

class ViewController: UIViewController {

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var phoneNum: UITextField!
    let db = SQLiteDB.shared
    override func viewDidLoad() {
        super.viewDidLoad()
        let result = SQLiteDB.shared.open(dbPath: "", copyFile: true)
        let r = db.execute(sql: "create table if not exists person(name varchar(20),phone varchar(20))")
        print("result:\(r)")
        print(NSHomeDirectory())
        print(Bundle.main.bundlePath)
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func add(_ sender: Any) {
        let r = db.execute(sql: "insert into person(name,phone) values('\(name.text!)','\(phoneNum.text!)')")
        print("result:\(r)")
    }
    @IBAction func update(_ sender: Any) {
        let r = db.execute(sql: "update person set phone = '\(phoneNum.text!)' where name = '\(name.text!)'")
        print("result:\(r)")
    }
    @IBAction func del(_ sender: Any) {
        let r = db.execute(sql: "delete from person  where name = '\(name.text!)'")
        print("result:\(r)")
    }
    
    @IBAction func query(_ sender: Any) {
        let persons = db.query(sql: "select * from person where name = '\(name.text!)'")
        if let person = persons.first,let phone = person["phone"] as? String{
            phoneNum.text = phone
        }
    }
    
}

