//
//  BaseToolsExpand.swift
//  zFramework
//
//  Created by Computer on 15/3/8.
//  Copyright (c) 2015年 Computer. All rights reserved.
//
import UIKit
import Foundation

class JsonEasyControl {
   
    // MARK: - String to JSON <with normal>
    class func JsonToString(data: NSDictionary) -> NSString {
        let midict = NSJSONSerialization.dataWithJSONObject(data, options: NSJSONWritingOptions.PrettyPrinted, error: nil)
        let easyjson:NSString = NSString(data: midict!, encoding: NSUTF8StringEncoding)!
        return easyjson
    }

    // MARK: - String to JSON <with space>
    class func JsonToStringZero(data: NSDictionary) -> NSString {
        let midict = NSJSONSerialization.dataWithJSONObject(data, options: NSJSONWritingOptions.allZeros, error: nil)
        let easyjson:NSString = NSString(data: midict!, encoding: NSUTF8StringEncoding)!
        return easyjson
    }
}