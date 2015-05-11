//
//  authorizedHelper.swift
//  zFramework
//
//  Created by Computer on 15/3/2.
//  Copyright (c) 2015年 Computer. All rights reserved.
//
import UIKit

class authorizedHelper: NSObject {
    
    // 相机权限
    class func permissionCaptureEnable() -> Bool {
        let authStatus = AVCaptureDevice.authorizationStatusForMediaType(AVMediaTypeVideo)
        switch authStatus {
        case AVAuthorizationStatus.Authorized:
            return true;
        case AVAuthorizationStatus.Denied:
            return false;
        case AVAuthorizationStatus.NotDetermined:
            return true;
        case AVAuthorizationStatus.Restricted:
            return false;
        default:
            return false;
            
        }
    }
    
    // 相册权限
    class func permissionAlbumEnable() -> Bool {
        let authStatus = ALAssetsLibrary.authorizationStatus()
        switch authStatus {
        case ALAuthorizationStatus.Authorized:
            return true;
        case ALAuthorizationStatus.Denied:
            return false;
        case ALAuthorizationStatus.NotDetermined:
            return true;
        case ALAuthorizationStatus.Restricted:
            return false;
        default:
            return false;
            
        }
    }

    // 麦克风权限
    class func permissionMicophoneEnable() -> Bool {
        let authStatus = AVCaptureDevice.authorizationStatusForMediaType(AVMediaTypeAudio)
        switch authStatus {
        case AVAuthorizationStatus.Authorized:
            return true;
        case AVAuthorizationStatus.Denied:
            return false;
        case AVAuthorizationStatus.NotDetermined:
            return true;
        case AVAuthorizationStatus.Restricted:
            return false;
        default:
            return false;
        }
    }
    
    // 定位权限
    class func permissionLBSEnable() -> Bool {
        let authStatus = CLLocationManager.authorizationStatus()
        switch authStatus {
        case .NotDetermined:
            return true;
        case .Restricted:
            return false;
        case .Denied:
            return false;
        case .AuthorizedAlways:
            return true;
        case .AuthorizedWhenInUse:
            return true;
        default:
            return false;
        }
    }

}