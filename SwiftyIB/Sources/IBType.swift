///IBTypes.swift
/// Automatically generated by SwiftyIB. **DO NOT EDIT**

#if canImport(UIKit)
import UIKit

public protocol AnyIBScene: StoryboardIdentifiable & SceneIdentifiable {}

public protocol IBScene: AnyIBScene {
    associatedtype ViewControllerType: UIViewController
    init(_viewController: ViewControllerType)
}

public protocol SceneContainer: SceneIdentifiable {
    associatedtype SceneType: IBScene
    var Scene: SceneType { get }
}
extension SceneContainer {
    public static var sceneIdentifier: SceneIdentifier { SceneType.sceneIdentifier }
    public static var storyboardIdentifier: StoryboardIdentifier { SceneType.storyboardIdentifier }
}

extension SceneContainer where Self: UIViewController {
    public var viewController: UIViewController { self }
}

public protocol StoryboardIdentifiable {
    static var storyboardIdentifier: StoryboardIdentifier { get }
    var viewController: UIViewController { get }
}

extension StoryboardIdentifiable {
    public var storyboardIdentifier: StoryboardIdentifier { Self.storyboardIdentifier }
}

public protocol SceneIdentifiable: StoryboardIdentifiable {
    static var sceneIdentifier: SceneIdentifier { get }
}

extension SceneIdentifiable {
    public var sceneIdentifier: SceneIdentifier { Self.sceneIdentifier }
}

public protocol SegueIdentifiable {
    var segueIdentifier: SegueIdentifier { get }
    var viewController: UIViewController { get }
}

public struct IBSegue: SegueIdentifiable {
    public let segueIdentifier: SegueIdentifier
    public let viewController: UIViewController

    public init(segueIdentifier: SegueIdentifier, viewController: UIViewController) {
        self.segueIdentifier = segueIdentifier
        self.viewController = viewController
    }
}

#endif
