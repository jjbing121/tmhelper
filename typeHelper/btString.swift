//
//  stringHelper.swift
//  zFramework
//
//  Created by Computer on 15/3/2.
//  Copyright (c) 2015年 Computer. All rights reserved.
//
import UIKit
import Foundation

class stringHelper: NSObject {
    
    class func i18n(code: String) -> String {
        return NSLocalizedString(code, tableName: nil, bundle: NSBundle.mainBundle(), value: "", comment: "")
    }
}

extension String {
    
    func isBank() -> Bool {
        var tmp: NSString = self.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
        return tmp.length == 0
    }
    
    func isBlankByTrimming() -> Bool {
        var tmp: NSString = self.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
        return tmp.length == 0
    }

    func len() -> Int {
        return count(self)
    }
    
    func toNSDate() -> NSDate {
        let sInt = self.toInt()
        let sDouble = Double(sInt!)
        return NSDate(timeIntervalSince1970: sDouble)
    }
    
    func toBool() -> Bool {
        if self.toInt() > 0 {
            return true
        } else {
            return false
        }
    }
    
    func toNSString() -> NSString {
        var s: NSString = NSString(CString: self.cStringUsingEncoding(NSUTF8StringEncoding)!,
            encoding: NSUTF8StringEncoding)!
        return s
    }
    
    func numberOfLines() -> Int {
        return self.componentsSeparatedByString("\n").count + 1
    }
    
    func heightWithWidth(width: CGFloat, font: UIFont) -> CGFloat {
        let str = self.toNSString()
        let attributedText = NSAttributedString(string: str as String, attributes: [NSFontAttributeName : font])
        let rect = attributedText.boundingRectWithSize(CGSizeMake(width, CGFloat.max), options:NSStringDrawingOptions.UsesLineFragmentOrigin, context: nil)
        return rect.height
    }
    
    func widthWithHeight(height: CGFloat, font: UIFont) -> CGFloat {
        let str = self.toNSString()
        let attributedText = NSAttributedString(string: str as String, attributes: [NSFontAttributeName : font])
        let rect = attributedText.boundingRectWithSize(CGSizeMake(CGFloat.max, height), options:NSStringDrawingOptions.UsesLineFragmentOrigin, context: nil)
        return rect.width
    }
    
    var md5: String! {
        let str = self.cStringUsingEncoding(NSUTF8StringEncoding)
        let strLen = CC_LONG(self.lengthOfBytesUsingEncoding(NSUTF8StringEncoding))
        let digestLen = Int(CC_MD5_DIGEST_LENGTH)
        let result = UnsafeMutablePointer<CUnsignedChar>.alloc(digestLen)
        
        CC_MD5(str!, strLen, result)
        
        var hash = NSMutableString()
        for i in 0..<digestLen {
            hash.appendFormat("%02x", result[i])
        }
        
        result.destroy()
        
        return String(format: hash as String)
    }

}