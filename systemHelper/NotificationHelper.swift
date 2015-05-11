//
//  notificationHelper.swift
//  zFramework
//
//  Created by Computer on 15/3/2.
//  Copyright (c) 2015年 Computer. All rights reserved.
//
import UIKit


enum NotificationType: String {
    case NetworkResponse = "NetworkResponse"
    case LocationChanged = "LocationChanged"
}

class NotificationHelper: NSObject {
    
    class func send(type: NotificationType) {
        NSNotificationCenter.defaultCenter().postNotificationName(type.rawValue, object: nil)
    }
    
    class func send(type: NotificationType, userInfo:[NSObject:AnyObject]?) {
        NSNotificationCenter.defaultCenter().postNotificationName(type.rawValue, object: nil, userInfo: userInfo)
    }
    
    class func register(type: NotificationType, receiver: NSObject!, action: Selector!) {
        NSNotificationCenter.defaultCenter().addObserver(receiver, selector: action, name: type.rawValue, object: nil)
    }
    
    class func remove(type: NotificationType, receiver: NSObject!) {
        NSNotificationCenter.defaultCenter().removeObserver(receiver, name: type.rawValue, object: nil)
    }
    
}

