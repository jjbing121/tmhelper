//
//  sizeHelper.swift
//  zFramework
//
//  Created by Computer on 15/3/2.
//  Copyright (c) 2015年 Computer. All rights reserved.
//
import UIKit

class sizeHelper: NSObject {
    
    class func deviceScreenSize() -> CGSize {
        return UIScreen.mainScreen().bounds.size
    }
    
}