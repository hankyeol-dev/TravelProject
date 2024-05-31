//
//  ArrayHookFunctions.swift
//  TravelProject
//
//  Created by 강한결 on 5/31/24.
//

import Foundation
import UIKit

func _map<T, K>(_ array: [T], cb callBack: (T) -> K) -> [K] {
    var resultArray = [K]() // same as -> var resultArray: [Any] = []
    
    for element in array {
        resultArray.append(callBack(element))
    }
    
    return resultArray
}

func _filter<T>(_ array: [T], cb callBack: (T) -> Bool) -> [T] {
    var resultArray = [T]()
    
    for element in array {
        if callBack(element) {
            resultArray.append(element)
        }
    }
    
    return resultArray
}

