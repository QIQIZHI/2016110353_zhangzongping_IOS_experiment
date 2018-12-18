//
//  ViewController.swift
//  实验九模拟
//
//  Created by zhangzongping on 2018/11/24.
//  Copyright © 2018年 zongpingzhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let rotateRecognizer = UIRotationGestureRecognizer(target: self, action: #selector(rotate(recognizer:)))
    @IBAction func addLabel(_ sender: Any) {
        let x = Int(arc4random())%Int(view.bounds.width)
        let y = Int(arc4random())%Int(view.bounds.height)
        let label = UILabel(frame:CGRect(x:x,y:y,width:30,height:30))
        label.text = "zzp"
        label.textAlignment = .center
        label.backgroundColor = #colorLiteral(red: 0.7832920551, green: 0.9497991204, blue: 0.9424438477, alpha: 1)
        
        label.layer.shadowColor = UIColor.gray.cgColor
        label.layer.shadowOffset = CGSize(width:5,height:5)
        label.layer.shadowOpacity = 1
        
        
        //
        let panRecognizer = UIPanGestureRecognizer(target: self, action: #selector(pan(recognizer:)))
        label.addGestureRecognizer(panRecognizer)
        
        
        //设置rotate手势
       
        label.addGestureRecognizer(rotateRecognizer)
        
        label.isUserInteractionEnabled = true
        view.addSubview(label)
        //rotateRecognizer.delegate = self as! UIGestureRecognizerDelegate
    }
    
    //旋转
    @objc func rotate(recognizer: UIRotationGestureRecognizer){
        recognizer.view?.transform = (recognizer.view?.transform.rotated(by: recognizer.rotation))!
        recognizer.rotation = 0
    }
    
    @objc func pan(recognizer:UIPanGestureRecognizer){
        switch recognizer.state{
        case .changed:
            fallthrough
        case .ended:
            let translation = recognizer.translation(in: self.view)
            recognizer.view?.center.x += translation.x
            recognizer.view?.center.y += translation.y
            recognizer.setTranslation(.zero, in: self.view)
        default:
            break
        }
    }
    @IBAction func moveLabel(_ sender: Any) {
        for label in view.subviews{
            if label is UILabel{
                UIView.animate(withDuration: 1){
                    let x = Int(arc4random())%Int(self.view.bounds.width)
                    let y = Int(arc4random())%Int(self.view.bounds.height)
                    label.center.x = CGFloat(x)
                    label.center.y = CGFloat(y)
                }
            }
        }
    }
    @IBAction func deleteLabel(_ sender: Any) {
        for label in view.subviews{
            if label is UILabel{
                label.removeFromSuperview()
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

























