//
//  IBKeys.swift
//  SwiftyIB
//
//  Created by Paul Fechner on 12/27/17.
//  Copyright © 2017 peejweej.inc. All rights reserved.
//

extension IBStoryboard {
    enum AttributeKeys: String {
        case initialViewController
    }
    enum ElementKeys: String {
        case document
        case scenes
        case scene
    }
}

extension IBScene {
    enum AttributeKeys: String {
        case sceneID
    }
    
    enum ElementKeys: String {
        case objects
        case viewController
        case tableViewController
        case collectionViewController
        case navigationController
        case splitViewController
        
        static let sceneTypes = [.viewController, .tableViewController, collectionViewController, .collectionViewController, .navigationController, .splitViewController]
    }
}

extension IBViewController {
    enum AttributeKeys: String {
        case id
        case restorationIdentifier
        case storyboardIdentifier
        case customClass
    }
    
    enum ElementKeys: String {
        case connections
        case segue
    }
}

extension IBSegue {
    enum AttributeKeys: String {
        case destination
        case kind
        case identifier
    }
}
