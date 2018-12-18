//
//  FirstViewController.swift
//  ElevenWork
//
//  Created by zhangzongping on 2018/12/17.
//  Copyright © 2018年 zongping.zhang. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    var stu = Student()
    
    var name = ""
    var no = ""
    var age = ""
    
    @IBOutlet weak var ftNo: UITextField!
    @IBOutlet weak var ftName: UITextField!
    @IBOutlet weak var ftAge: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //反向传参
    override func viewWillAppear(_ animated: Bool) {
        ftNo.text = stu.no
        ftName.text = stu.name
        ftAge.text = stu.age
    }
    
    @IBAction func showSecondVC(_ sender: Any) {
        stu.no = ftNo.text!
        stu.name = ftName.text!
        stu.age = ftAge.text!
        //文件里面恢复视图,不是代码里面构造界面
        let secVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SecondVC") as! SecondViewController
        //指向同一个对象，一方
        secVC.stu = stu
        //        //正向传参
        //        secVC.no = stu.no
        //        secVC.name = stu.name
        //        secVC.delegate = self
        //        secVC.no = ftNo.text!
        //        secVC.name = tfName.text!
        //模式方法，model,不希望全部展示
        //        present(secVC,animated:true,completion: nil)
        //push推出，关闭的时候要对应popViewController
        self.navigationController?.pushViewController(secVC, animated: true)
    }
    @IBAction func showThirdVC(_ sender: Any) {
        //文件里面恢复视图,不是代码里面构造界面
        let thirdVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ThirdVC")
        //模式方法，model,persent配对miss
        present(thirdVC,animated:true,completion: nil)
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
