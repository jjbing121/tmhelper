//
//  alertHelper.swift
//  zFramework
//
//  Created by Computer on 15/3/2.
//  Copyright (c) 2015年 Computer. All rights reserved.
//
import UIKit

class alertHelper: NSObject {
    
    // MARK: - 原生
    class func showAlert(message: String!) {
        var alert = UIAlertView(title: message, message: nil, delegate: nil, cancelButtonTitle: stringHelper.i18n("unithelper.confirm"))
        alert.show()
    }
    
    class func waitingAlert() -> UIAlertView {
        var alert = UIAlertView(title: nil, message: stringHelper.i18n("unithelper.waiting"), delegate: nil, cancelButtonTitle: nil)
        return alert
    }
    
    // MARK: - TAlert
    class func showAlertAutoClose(message: String) {
        TAlertView(title: stringHelper.i18n("unithelper.tips"), andMessage: message).show()
    }
    
    // MARK: - SweetAlert
    class func showSuccessAlertWithConfirm(title: String, content: String) {
        SweetAlert().showAlert(title, subTitle: content, style: AlertStyle.Success)
    }
    
    class func showErrorAlertWithConfirm(title: String, content: String) {
        SweetAlert().showAlert(title, subTitle: content, style: AlertStyle.Error)
    }

}
