//
//  AssociatedObjects.swift
//
//
//  Created by Kristóf Kálai on 2023. 09. 26..
//

import Foundation

public func getAssociatedObject<T>(_ object: Any, _ key: UnsafeRawPointer) -> T? {
    objc_getAssociatedObject(object, key) as? T
}

public func getAssociatedObject<T>(_ object: Any, _ key: inout String) -> T? {
    getAssociatedObject(object, key) as T?
}

public func getAssociatedObject<T>(_ object: Any, _ key: UnsafeRawPointer, defaultValue: T) -> T {
    getAssociatedObject(object, key) ?? defaultValue
}

public func getAssociatedObject<T>(_ object: Any, _ key: inout String, defaultValue: T) -> T {
    getAssociatedObject(object, key, defaultValue: defaultValue)
}

public func setAssociatedObject<T>(_ object: Any, _ key: UnsafeRawPointer, _ value: T?, _ policy: objc_AssociationPolicy = .OBJC_ASSOCIATION_RETAIN) {
    objc_setAssociatedObject(object, key, value, policy)
}

public func setAssociatedObject<T>(_ object: Any, _ key: inout String, _ value: T?, _ policy: objc_AssociationPolicy = .OBJC_ASSOCIATION_RETAIN) {
    setAssociatedObject(object, key, value, policy)
}
