//
//  MyViewController.swift
//  实验六-2
//
//  Created by zhangzongping on 2018/11/22.
//  Copyright © 2018年 zongpingzhang. All rights reserved.
//

import UIKit

class MyViewController: UIViewController {
    //声明3个UIView
    var view1: UIView!
    var view2: UIView!
    var view3: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //将背景颜色设置为白色
        view.backgroundColor = UIColor.white
        //创建view1（橘色）
        view1 = UIView(frame:CGRect(x:20,y:100,width:360,height:200))
        //设置背景颜色
        view1.backgroundColor = UIColor.orange
        view.addSubview(view1)
        //创建view2（绿色）
        view2 = UIView(frame:CGRect(x:20,y:300,width:360,height:200))
        //设置背景颜色
        view2.backgroundColor = UIColor.green
        view.addSubview(view2)
        //创建view3（棕色）
        view3 = UIView(frame:CGRect(x:20,y:500,width:360,height:200))
        //设置背景颜色
        view3.backgroundColor = UIColor.brown
        view.addSubview(view3)
        
        //模块加入总的stack视图，视图属性设置
        let stackView = UIStackView(arrangedSubviews: [view1,view2,view3])
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 20
        
        //设置stackView的参数
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        stackView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -20).isActive = true
        stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true

        // Do any additional setup after loading the view.
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
