// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

func power (num: Double, power: Double) -> Double {
    return pow (num, power)
}

var penny:Double = 1
for index in 2...30 {
    var pow = Double(index)
    penny += (penny * penny)
}
println(penny)

