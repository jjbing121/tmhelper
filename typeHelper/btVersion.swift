//
//  versionHelper.swift
//  zFramework
//
//  Created by Computer on 15/3/2.
//  Copyright (c) 2015年 Computer. All rights reserved.
//
import UIKit

class versionHelper: NSObject {
    
    class func appVersion() -> String {
        let nsObject: AnyObject? = NSBundle.mainBundle().infoDictionary!["CFBundleShortVersionString"]
        return nsObject as! String
    }
    
    class func osVersion() -> CGFloat {
        var _float = UIDevice.currentDevice().systemVersion.toNSString().floatValue
        return CGFloat(_float)
    }

}