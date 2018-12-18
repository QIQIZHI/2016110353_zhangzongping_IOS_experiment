//: Playground - noun: a place where people can play

import UIKit

////实验5
//判断文件或文件夹是否存在
//判断图片文件是否存在，不存在则从网络上下载图片到该文件里
let fileManager = FileManager.default
if var docPath = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first {
    docPath.appendPathComponent("zzp")
    if !fileManager.fileExists(atPath: docPath.path) {
        try? fileManager.createDirectory(at: docPath, withIntermediateDirectories: true, attributes: nil)
    }
    docPath.appendPathComponent("_image1.jpg")
    print(docPath.path)
    if !fileManager.fileExists(atPath: docPath.path) {
        let url = URL(string: "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1541742161361&di=ef680a1a504bb154117c20459f710ba5&imgtype=0&src=http%3A%2F%2Fpic1.win4000.com%2Fmobile%2F2017-11-15%2F5a0c2d2313c90.jpg")
        let data = try? Data(contentsOf: url!)
        try? data?.write(to: docPath)
    }
}
