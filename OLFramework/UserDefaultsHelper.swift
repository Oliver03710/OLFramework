//
//  UserDefaultsHelper.swift
//  OLFramework
//
//  Created by Junhee Yoon on 2022/08/16.
//

import Foundation

public class UserdefaultsHelper {
    
    private init() { }
    
    public static let standard = UserdefaultsHelper()
    
    let userDefaults = UserDefaults.standard
    
    enum Key: String {
        case intro
    }
    
    public var intro: Bool {
        get {
            return userDefaults.bool(forKey: Key.intro.rawValue)
        }
        set {
            userDefaults.set(newValue, forKey: Key.intro.rawValue)
        }
    }
        
    public func reset() {
        if let appDomain = Bundle.main.bundleIdentifier {
            userDefaults.removePersistentDomain(forName: appDomain)
        }
    }
    
}
