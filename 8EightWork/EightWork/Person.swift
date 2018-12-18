//
//  Person.swift
//  实验八
//
//  Created by zhangzongping on 2018/11/24.
//  Copyright © 2018年 zongpingzhang. All rights reserved.
//

import Foundation

class Person{
    //存储属性
    var name:String
    var age:Int = 0
    var gender:String
    var grade:Int = 0
    //构造函数
    init(name:String,age:Int,gen:String,grade:Int){
        self.name = name
        self.age = age
        self.gender = gen
        self.grade = grade
    }
}
class Teacher:Person{
    init(name:String,age:Int,gender:String,grade:Int){
        super.init(name:name,age:age,gen:gender,grade:grade)
    }
}
class Student:Person{
    init(name:String,age:Int,gender:String,grade:Int){
        super.init(name:name,age:age,gen:gender,grade:grade)
    }

}
