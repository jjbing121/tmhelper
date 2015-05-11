//
//  dateHelper.swift
//  zFramework
//
//  Created by Computer on 15/3/2.
//  Copyright (c) 2015年 Computer. All rights reserved.
//

import UIKit

class dateHelper: NSObject {
    
}

extension NSDate {
    
    private func formatDate(#format: String) -> String {
        var formatter = NSDateFormatter()
        formatter.dateFormat = format
        return formatter.stringFromDate(self)
    }
    
    func toyyyymmddHHmm() -> String {
        return formatDate(format: "yyyy-MM-dd HH:mm")
    }
    
    func toyyyymmdd() -> String {
        return formatDate(format: "yyyy.MM.dd")
    }
    
    func toYYYYmmdd() -> String {
        return formatDate(format: "yyyy-MM-dd")
    }
    
    func getNowTime() -> String {
        var _time = NSDate(timeIntervalSinceNow: 0)
        var _now = (_time.timeIntervalSince1970)*1000
        return NSString(format: "%f", _now).substringWithRange(NSMakeRange(0, 10))
    }
    
    var millisSecondSince1970: Double {
        let ms = NSDate().timeIntervalSince1970
        return ms * 1000
    }
    
    var secondSince1970: Double {
        let s = NSDate().timeIntervalSince1970
        return s
    }
}