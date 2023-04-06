//
//  TransitionStyle.swift
//  OLFramework
//
//  Created by Junhee Yoon on 2022/08/16.
//

import UIKit

open class OpenWebView {

    public enum TransitionStyle {
        case present
        case push
    }
    
    public static func presentWebViewController(_ viewController: UIViewController, instance: UIViewController, transitionStyle: TransitionStyle) {
        
        let vc = instance
        
        switch transitionStyle {
        case .present:
            viewController.present(vc, animated: true)
        case .push:
            viewController.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
