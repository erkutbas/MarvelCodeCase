//
//  SplashViewController.swift
//  MarvelCodeCase
//
//  Created by Erkut Bas on 14.09.2021.
//

import UIKit

class SplashViewController: BaseViewController<SplashScreenViewModel>, AwakingStoryBoardDelegate {
    
    static var storyboard: ApplicationStoryBoards {
        return .splashScreen
    }

    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var bottomInfoContainerBottom: NSLayoutConstraint!
    
    override func prepareViewControllerConfigurations() {
        super.prepareViewControllerConfigurations()
        viewModel.startSplashProcess()
        splashViewAnimationTrigger()
        
    }
    
    private func splashViewAnimationTrigger() {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
            self?.fireSplashViewAnimation()
        }
        
    }
    
    private func fireSplashViewAnimation() {
        bottomInfoContainerBottom.constant = -100
        
        UIView.animate(withDuration: 0.6,
                       delay: 0,
                       usingSpringWithDamping: CGFloat(0.4),  // yay sonme orani, arttikca yanip sonme artar
            initialSpringVelocity: CGFloat(10.0),    // yay hizi, arttikca hizlanir
            options: .curveEaseIn,
            animations: {

                self.view.layoutIfNeeded()

        })
    }

}
