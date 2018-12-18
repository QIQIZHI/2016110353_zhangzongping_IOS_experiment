//: Playground - noun: a place where people can play

import UIKit

//(1)
var dic1 = ["name":"kiko","age":"26"]
var dic2 = ["name":"mizuhara","age":"18"]
let dicarr = [dic1,dic2].map{
    return $0["name"]!
}
print(dicarr)

///(2)
let str1 = ["mao","sdas","13","das","99"].filter{
    return Int($0) != nil
}
print(str1)

//(3)
let str2 = ["yes","no","thanks"].reduce(""){
    return $0+","+$1
}
print(str2)

//(4)
var numArray = [1,2,3,4,5]
let temp = numArray.reduce((max:Int.min,min:Int.max,sum:0)){
    (temp,i) in
        return (max(temp.max,i),min(temp.min,i),temp.sum+i)
}
print("最大值为:\(temp.max)")
print("最小值为:\(temp.min)")
print("总数和为:\(temp.sum)")

//(5)
func f1(x:Int)->Int{
    print("f1是一个参数为整型，返回值为整型的函数\n")
    return 1
}
func f2()->Int{
    return 2
}
func f3(x:Double)->Double{
    return x
}
let f = [f1,f2,f3].filter{
    return $0 is (Int)->Int
}
for (index,_) in f.enumerated() {
    print("符合条件的函数的下标是:\(index)")
}

//（6）
extension Int{
    mutating func sqrt()->Double{
        let a1:Double = Double(self)
        let a2:Double = a1*a1
        return a2
    }
}
var x:Int = 2
print(x.sqrt())

//(7)
func searchMaxAndMin<T:Comparable>(data:[T])->(max:T,min:T){
    var max = data[0]
    var min = data[0]
    for i in data{
        if max < i{
            max = i
        }else if min > i{
            min = i
        }
    }
    return (max,min)
}
let tempInt = searchMaxAndMin(data:[8,10,6,33])
print("传入整数时最大值为:\(tempInt.max),最小值为:\(tempInt.min)")

let tempDouble = searchMaxAndMin(data:[11.2,33.9,9.0,7,7])
print("传入浮点数时最大值为:\(tempDouble.max),最小值为:\(tempDouble.min)")

let tempString = searchMaxAndMin(data:["R","X","L"])
print("传入字符串时：最大值为:\(tempString.max),最小值为：\(tempString.min)")




