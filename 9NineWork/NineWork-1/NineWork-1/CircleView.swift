//
//  CircleView.swift
//  实验九模拟
//
//  Created by zhangzongping on 2018/11/24.
//  Copyright © 2018年 zongpingzhang. All rights reserved.
//

import UIKit
@IBDesignable
class CircleView: UIView {

    @IBInspectable var fillColor: UIColor?
    @IBInspectable var strokeColor:UIColor?
    
    
    func setup(){
        let panRecognizer = UIPanGestureRecognizer(target: self, action: #selector(pan(recognizer:)))
        self.addGestureRecognizer(panRecognizer)
        
        let pinchRecognizer = UIPinchGestureRecognizer(target: self, action: #selector(pinch(recognizer:)))
        self.addGestureRecognizer(pinchRecognizer)
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(tap(recognizer:)))
        self.addGestureRecognizer(tapRecognizer)
        
        let rotateGuesture = UIRotationGestureRecognizer(target: self, action: #selector(rotate(recognizer:)))
        self.addGestureRecognizer(rotateGuesture)
        
        tapRecognizer.numberOfTouchesRequired = 1
        tapRecognizer.numberOfTapsRequired = 2
    }

    @objc func pan(recognizer:UIPanGestureRecognizer){
        switch recognizer.state{
        case .changed:
            fallthrough
        case .ended:
            let translation = recognizer.translation(in: self)
            center.x += translation.x
            center.y += translation.y
            recognizer.setTranslation(.zero, in: self)
        default:
            break
        }
    }
    @objc func pinch(recognizer:UIPinchGestureRecognizer){
        switch recognizer.state{
        case .changed:
            fallthrough
        case .ended:
            bounds.size = CGSize(width:bounds.width*recognizer.scale,height:bounds.height*recognizer.scale)
            recognizer.scale = 1
        default:
            break
        }
    }
    @objc func tap(recognizer:UITapGestureRecognizer){
        switch recognizer.state{
        case .recognized:
            print("double clicked")
        default:
            break
        }
    }
    @objc func rotate(recognizer:UIRotationGestureRecognizer){
        let rotation = recognizer.rotation
        self.transform = self.transform.rotated(by:rotation)
        recognizer.rotation = 0
    }
    override init(frame:CGRect){
        super.init(frame:frame)
        setup()
    }
    required init?(coder aDecoder:NSCoder){
        super.init(coder:aDecoder)
        setup()
    }
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        let path = UIBezierPath(ovalIn: rect)
        fillColor?.setFill()
        strokeColor?.setStroke()
        path.fill()
        path.stroke()
    }
    

}
