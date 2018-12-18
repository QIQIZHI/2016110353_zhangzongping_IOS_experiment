//
//  ViewController.swift
//  动画
//
//  Created by Jerome on 2018/11/27.
//  Copyright © 2018年 zongping.zhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var backView: UIView!
    lazy var animator = UIDynamicAnimator(referenceView:self.backView)
    
    let gravity = UIGravityBehavior()
    let collision = UICollisionBehavior()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        animator.addBehavior(gravity)
        animator.addBehavior(collision)
        collision.translatesReferenceBoundsIntoBoundary = true
    }

    @IBAction func add(_ sender: Any) {
        let width = Int(backView.bounds.width / 10)
        let randx = Int(arc4random())%Int(backView.bounds.width)
        let label = UILabel(frame:CGRect(x:randx,y:20,width:width,height:width))
        label.backgroundColor = UIColor.green
        label.text = "Z"
        label.textAlignment = .center
        backView.addSubview(label)
        
        gravity.addItem(label)
        collision.addItem(label)
    }
    @IBAction func up(_ sender: Any) {
        gravity.gravityDirection = CGVector(dx:0,dy:-1)
    }
    @IBAction func down(_ sender: Any) {
        gravity.gravityDirection = CGVector(dx:0,dy:1)
    }
    @IBAction func left(_ sender: Any) {
        gravity.gravityDirection = CGVector(dx:-1,dy:0)
    }
    @IBAction func right(_ sender: Any) {
        gravity.gravityDirection = CGVector(dx:1,dy:0)
    }
    @IBAction func deleteAll(_ sender: Any) {
        for item in backView.subviews{
            item.removeFromSuperview()
            gravity.removeItem(item)
            collision.removeItem(item)
        }
    }
    
}

