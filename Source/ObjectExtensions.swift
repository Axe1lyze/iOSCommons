//
//  ObjectExtensions.swift
//  iOSUtils
//
//  Created by Masaharu Tsukamoto on 2022/04/15.
//

import Foundation

extension NSObject {
    
    static var props:[NSObject:[String:Any]] = [:]
    
    public func getProp(key:String) -> Any? { NSObject.props[self]?[key] }
    public func setProp(key:String, value:Any) {
        NSObject.props[self] = NSObject.props[self] ?? [:]
        NSObject.props[self]?[key] = value
    }
    
    
}
