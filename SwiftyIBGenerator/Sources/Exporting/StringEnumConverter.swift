//
//  StringEnumConverter.swift
//  SwiftyIB
//
//  Created by Paul Fechner on 12/29/17.
//  Copyright © 2017 peejweej.inc. All rights reserved.
//

public struct StringEnumConverter {
    
    public static func makeEnum(with name: String, and documentation: String, from strings: [String], addEnumHeader: Bool = false) -> String? {
        guard !name.isEmpty else {
            return nil
        }
        let preparedCases = Set(strings).sorted()
        
        let result = "\(makeEnumStart(from: name, and: documentation, addEnumHeader: addEnumHeader))\(preparedCases.map(makeCase).reduce("", +))\(enumEnd)"
        return result
    }
    
    static func makeEnum(with name: String, and documentation: String, using identifierFinder: (() -> ([String])) ) -> String? {
        
        guard !name.isEmpty else {
            return nil
        }
       
        let results = identifierFinder()
        let resultEnum = makeEnum(with: name, and: documentation, from: results)
        return resultEnum
    }
    
    private static func makeCase(from name: String) -> String {
        return "\n\tcase \(name)"
    }

    private static func makeEnumStart(from name: String, and documentation: String, addEnumHeader: Bool = false) -> String{
        return "\(addEnumHeader ? makeEnumHeader(for: name) : "")\n\n\(documentation)\nenum \(name): String {"
    }
    
    private static let enumEnd = "\n\tcase none\n}"
    
    private static func makeEnumHeader(for name: String) -> String {
        return  """
                // \(name).swift
                //
                // Automatically Generated by SwiftyIB from the available IB files
                //
                // **DO NOT EDIT**
                // 
                // Any changes will be overwritten when next generated 
                """
    }
}