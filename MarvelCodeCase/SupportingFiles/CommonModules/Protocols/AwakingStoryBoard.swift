//
//  AwakingStoryBoard.swift
//  MarvelCodeCase
//
//  Created by Erkut Bas on 14.09.2021.
//

import UIKit

protocol AwakingStoryBoardDelegate {
    static var storyboard: ApplicationStoryBoards { get }
    static func instantiate() -> Self?
}

extension AwakingStoryBoardDelegate where Self: UIViewController {
    static func instantiate() -> Self? {
        let identifier = String(describing: self)
        let uiStoryboard = UIStoryboard(name: storyboard.value, bundle: nil)
        guard let viewController = uiStoryboard.instantiateViewController(withIdentifier: identifier) as? Self else { return nil }

        return viewController
    }
    
}
