//: Playground - noun: a place where people can play

import UIKit
//性别枚举
enum Gender:Int{
    case man = 0
    case women = 1
}

class Person:CustomStringConvertible{
    //存储属性
    var firstname:String
    var lastname:String
    var age:Int = 0
    var gender:Gender
    //计算属性
    var fullname:String{
        get{
            return firstname + lastname
        }
    }
    //构造函数
    init(fname:String,lname:String,age:Int,gen:Gender){
        self.firstname = fname
        self.lastname = lname
        self.age = age
        self.gender = gen
    }
    //便利构造函数
    convenience init(cfname:String,clname:String,cage:Int,cgen:Gender){
        self.init(fname:cfname,lname:clname,age:cage,gen:cgen)
    }
    //==比较
    static func== (p1:Person,p2:Person)->Bool{
        if p1.age == p2.age && p1.fullname == p2.fullname && p1.gender==p2.gender{
            return false
        }else{
            print("p1 == p2")
            return true
        }
    }
    //!=比较
    static func != (p1:Person,p2:Person)->Bool{
        if p1.age == p2.age && p1.fullname == p2.fullname && p1.gender==p2.gender{
            return false
        }else{
            print("p1 != p2")
            return true
        }
    }
    var description:String{
        return "全名:\(fullname) 年龄:\(age) 性别:\(gender)\n"
    }
}
class Teacher:Person{
    var title:String
    init(firstname:String,lastname:String,age:Int,gender:Gender,title:String){
        self.title = title
        super.init(fname:firstname,lname:lastname,age:age,gen:gender)
    }
   override var description:String{
        return "全名:\(fullname) 年龄:\(age) 性别:\(gender)标签:\(title)\n"
    }
}
class Student:Person{
    var stuNo:Int
    init(firstname:String,lastname:String,age:Int,gender:Gender,no:Int){
        self.stuNo = no
        super.init(fname:firstname,lname:lastname,age:age,gen:gender)
    }
    override var description:String{
        return "全名:\(fullname) 年龄:\(age) 性别:\(gender)编号:\(stuNo)\n"
    }
}
//实例化两个Person对象
var p1 = Person(fname:"sun",lname:"wukong",age:18,gen:Gender.man)
var p2 = Person(fname:"sun",lname:"wufan",age:0,gen:.man)
print(p1 != p2)
print(p1)
//实例化Teacher对象
var t1 = Teacher(firstname:"feng",lastname:"qingyang",age:60,gender: .man,title:"ios")
var t2 = Teacher(firstname:"jiang",lastname:"ailing",age:60,gender: .man,title:"java")
//实例化Student对象
var s1 = Student(firstname:"zhang",lastname:"zongping",age:18,gender:.women,no:1)
var s2 = Student(firstname:"zhou",lastname:"ruyu",age:21,gender:.women,no:2)

print(t1)
print(t2)

print(s1)
print(s2)

var recordArray = [p1,p2,t1,t2,s1,s2]
var p = [Person]()
var t = [Teacher]()
var s = [Student]()
for i in recordArray{
    if let stu = i as? Student{
        s.append(stu)
    }else if let tea = i as? Teacher{
        t.append(tea)
    }else if let per = i as? Person{
        p.append(per)
    }
}
print("Person对象个数：")
print(p.count)
print("Teacher对象个数：")
print(t.count)
print("Student对象个数：")
print(s.count)

var dictionary =  ["Person":p,"Teacher":t,"Student":s]
print(dictionary)

print("************按age排序**********")
recordArray.sort{$0.age>$1.age}
print(recordArray)
print("************按fullname排序**********")
recordArray.sort{$0.fullname>$1.fullname}
print(dictionary)
print("************按gender+age排序**********")
recordArray.sort{
    p1,p2 in
    if p1.gender == p2.gender{
        return p1.age>p2.age
    }else{
        return p1.gender.rawValue>p2.gender.rawValue
    }
}
print(recordArray)






