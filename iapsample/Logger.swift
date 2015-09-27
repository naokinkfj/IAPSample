//
//  Logger.swift
//  iapsample
//
//  Created by Naoki Fujii on 9/27/15.
//  Copyright © 2015 nfujii. All rights reserved.
//

import UIKit

class Logger: NSObject {
    class func d(message: String, funcName: String = __FUNCTION__, lineNumber: Int = __LINE__) {
        printLog("[DEBUG]\"\(message)\"", funcName: funcName, lineNumber: lineNumber)
    }
    
    class func printLog(message: String, funcName: String, lineNumber: Int) {
        NSLog("\(message)[\(funcName) L\(lineNumber)]")
    }
}
