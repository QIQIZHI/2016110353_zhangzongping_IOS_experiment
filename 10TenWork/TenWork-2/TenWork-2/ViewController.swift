//
//  ViewController.swift
//  TenWork-2
//
//  Created by student on 2018/12/18.
//  Copyright © 2018年 zongpingzhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myView1: UIView!
    @IBOutlet weak var myView2: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func btnClicked1(_ sender: Any) {
        UIView.transition(with: myView1, duration: 2, options: .transitionCurlUp, animations: {
            self.myView1.backgroundColor = #colorLiteral(red: 0.6103215218, green: 0.9613727927, blue: 0.9741045833, alpha: 1)
        }, completion: nil)
    }
    @IBAction func btnClicked2(_ sender: Any) {
        let imageView = UIImageView(frame: CGRect(x: 150, y: 300, width: 100, height: 100))
        imageView.image = UIImage(named: "ping")
        UIView.transition(from: myView2, to: imageView, duration: 2, options: .transitionFlipFromRight, completion: nil)
    }
    

}

