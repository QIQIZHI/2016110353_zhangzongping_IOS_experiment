//
//  ViewController.swift
//  实验九-3模拟
//
//  Created by zhangzongping on 2018/11/24.
//  Copyright © 2018年 zongpingzhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIScrollViewDelegate {

    @IBOutlet weak var seeScrollView: UIScrollView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self

        let imageView1 = UIImageView(image: UIImage(named: "1"))
        seeScrollView.addSubview(imageView1)
        seeScrollView.contentSize = imageView1.bounds.size
        seeScrollView.minimumZoomScale = 0.2
        seeScrollView.maximumZoomScale = 5
        seeScrollView.delegate = self
        
        for i in 1...7 {
            let imageView = UIImageView(image: UIImage(named: "\(i)"))
            imageView.contentMode = .scaleAspectFit
            imageView.frame = CGRect(x: CGFloat(i-1) * scrollView.bounds.width, y: 0, width: scrollView.bounds.width, height: scrollView.bounds.height)
            scrollView.addSubview(imageView)
        }
        scrollView.contentSize = CGSize(width: scrollView.bounds.width * 7, height: scrollView.bounds.height)
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        
        pageControl.numberOfPages = 7
        pageControl.currentPage = 0
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return seeScrollView.subviews.first
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView.contentOffset.x / scrollView.bounds.width)
    }
    @IBAction func pageControl(_ sender: UIPageControl) {
        let currentPage = sender.currentPage
        let rect = CGRect(x: CGFloat(currentPage) * scrollView.bounds.width, y: 0, width: scrollView.bounds.width, height: scrollView.bounds.height)
        scrollView.scrollRectToVisible(rect, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

