//
//  AlertController.swift
//  BuildingMng
//
//  Created by Israel Manzo on 6/10/19.
//  Copyright © 2019 Israel Manzo. All rights reserved.
//

import UIKit

/*
 ================== ALERT CONTROLLER EXTENSION ===================
 - This Alertcontroller can be accessed from any where in the application.
 - Tow methods: Alert & ActionSheet.
 ==================================================================
 */

struct AlertController {
    
    // MARK: - Alert controller method
    static func alert(_ viewController: UIViewController, title: String, message: String){
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertController.addAction(action)
        
        viewController.present(alertController, animated: true, completion: nil)
    }
    
    // MARK: - ActionSheet controller method
    static func actionSheet(_ viewController: UIAlertController, title: String, message: String){
        let actionSheet = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        // TODO: add aditional buttons
        
        actionSheet.addAction(cancel)
        // TODO: add aditional buttons in actionSheet
        
        viewController.present(actionSheet, animated: true, completion: nil)
    }
}
