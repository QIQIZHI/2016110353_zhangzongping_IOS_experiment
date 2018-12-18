//
//  MyView.swift
//  实验五
//
//  Created by zhangzongping on 2018/11/22.
//  Copyright © 2018年 zongpingzhang. All rights reserved.
//

import UIKit

class MyView: UIView {

    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override init(frame: CGRect) {
        super.init(frame:frame)
        self.backgroundColor = UIColor.clear
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath(ovalIn:rect)

        UIColor.blue.setStroke()
        path.stroke()

        UIColor.white.setFill()
        path.fill()
    }
}
