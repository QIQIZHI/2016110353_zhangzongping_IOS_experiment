//
//  SecondViewController.swift
//  ElevenWork
//
//  Created by zhangzongping on 2018/12/17.
//  Copyright © 2018年 zongping.zhang. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    var stu: Student!
    
    @IBOutlet weak var ftNo: UITextField!
    @IBOutlet weak var ftName: UITextField!
    @IBOutlet weak var ftAge: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ftNo.text = stu.no
        ftName.text = stu.name
        ftAge.text = stu.age
        // Do any additional setup after loading the view.
    }
    @IBAction func back(_ sender: Any) {
        //        dismiss(animated: true, completion: nil)
        //对应pushViewController
        stu.no = ftNo.text!
        stu.name = ftName.text!
        stu.age = ftAge.text!
        //        delegate?.change(name: name
        //            , no: no)
        //        //强制转换依赖firstview
        //        for vc in self.navigationController!.viewControllers{
        //            if let firstVC = vc as? FirstViewController{
        //                firstVC.no = no
        //                firstVC.name = name
        //            }
        //        }
        navigationController?.popViewController(animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
