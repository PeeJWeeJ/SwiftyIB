//
//  NibStructureExtensionsGenerator.swift
//  SwiftyIB
//
//  Created by Paul Fechner on 9/4/18.
//  Copyright © 2018 peejweej.inc. All rights reserved.
//

import Foundation


class NibStructureExtensionsGenerator {
    
    private static let nibExtensionsDocumentations = """
/// Automatically generated from SwiftyIB

import SwiftyIB
"""
    
    static func  makeNibExtensions(from nibs: [IBNib]) -> String? {
    
        let nibAndClassCombinations: [(String, String)] = nibs.compactMap {
            guard let customClass = $0.views?.first?.customClass else {
                return nil
            }
            return ($0.nibName, customClass)
        }
        guard !nibAndClassCombinations.isEmpty else {
            return nil
        }
        return makeNibExtensions(for: nibAndClassCombinations)
    }
    
    private static func makeNibExtensions(for allNibAndClassInfo: [(String, String)]) -> String {
        return nibExtensionsDocumentations + allNibAndClassInfo.map(makeNibExtensions).joined()
    } 
    
    private static func makeNibExtensions(from nibAndClassInfo: (String, String)) -> String {
        return """


extension \(nibAndClassInfo.1): IBNibIdentifiable {
    static var nibIdentifier: NibIdentifier { 
        return .\(nibAndClassInfo.0)
    }
}
"""
    }
    
    
    private static let reuseExtensionDocumentation = """
/// Automatically generated from SwiftyIB
import SwiftyIB
"""
    
    static func  makeReuseExtensions(from nibs: [IBNib]) -> String? {
        
        let classAndReuseCombinations: [(String, String)] = nibs.compactMap {
            guard let customClass = $0.views?.first?.customClass, let reuseID = $0.views?.first?.reuseIdentifier else {
                return nil
            }
            return (customClass, reuseID)
        }
        guard !classAndReuseCombinations.isEmpty else {
            return nil
        }
        return makeReuseExtensions(for: classAndReuseCombinations)
    }
    
    private static func makeReuseExtensions(for allClassAndReuseInfo: [(String, String)]) -> String {
        return reuseExtensionDocumentation + allClassAndReuseInfo.map(makeReuseExtensions).joined()
    } 
    
    private static func makeReuseExtensions(from classAndReuseInfo: (String, String)) -> String {
        return """


extension \(classAndReuseInfo.0): IBReusable {
    static var reuseIBIdentifier: ReuseIdentifier {
        return .\(classAndReuseInfo.1)
    }
}
"""
    }
}
