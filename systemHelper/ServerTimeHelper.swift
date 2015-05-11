//
//  serverTimeHelper.swift
//  zFramework
//
//  Created by Computer on 15/3/2.
//  Copyright (c) 2015年 Computer. All rights reserved.
//

import UIKit

class AppRecord: NSObject {
    
    private var serverTimeDiff: Int = 0
    
    private (set) var serverTime: NSDate! {
        get {
            let time = NSDate().timeIntervalSince1970
            let servetSec = Double(Int(time) + serverTimeDiff)
            let serverTime = NSDate(timeIntervalSince1970: servetSec)
            return serverTime
        }
        set(date) {
            
        }
    }
    
    //MARK: - Persistence
    func save() {
        var dict = NSMutableDictionary()
        dict["serverTimeDiff"] = serverTimeDiff
        var userDefault = NSUserDefaults.standardUserDefaults()
        userDefault.setObject(dict, forKey: lStoreKeyAppRecord)
        userDefault.synchronize()
    }
    
    class func loadAppRecord() -> AppRecord {
        let userDefault = NSUserDefaults.standardUserDefaults()
        var record = AppRecord()
        if let userDict = userDefault.objectForKey(lStoreKeyAppRecord) as? NSDictionary {
            if let timeDiff = userDict["serverTimeDiff"] as? Int {
                record.serverTimeDiff = timeDiff
            }
        }
        return record
    }
    
    func resetServerTimeDiff(serverTime: Int) {
        let diff = serverTime - Int(NSDate().timeIntervalSince1970)
        self.serverTimeDiff = diff
    }
    
    
}

