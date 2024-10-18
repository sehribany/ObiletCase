//
//  MainNavigationController.swift
//  ObiletCase
//
//  Created by Şehriban Yıldırım on 18.10.2024.
//

import UIKit

class MainNavigationController: UINavigationController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .darkContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureContents()
    }
    
    private func configureContents() {
        let backImage = UIImage(named: "icBack")?
            .resize(to: .init(width: 11, height: 18))
            .withRenderingMode(.alwaysTemplate)
            .withAlignmentRectInsets(.init(top: 0, left: 0, bottom: -2, right: 0))
        
        let titleTextAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 18, weight: .bold),
            .foregroundColor: UIColor.appBlack
        ]
        
        let largeTitleTextAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 26, weight: .regular),
            .foregroundColor: UIColor.appBlack
        ]
        
        //navigationBar.barTintColor        = UIColor.yellow
        //navigationBar.shadowImage         = UIImage()
        //navigationBar.tintColor           = .appBlack
        navigationBar.titleTextAttributes = titleTextAttributes
        navigationBar.backIndicatorImage               = backImage
        navigationBar.backIndicatorTransitionMaskImage = backImage
        
        if #available(iOS 13.0, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = UIColor.appWhite
            
            appearance.titleTextAttributes = titleTextAttributes
            appearance.largeTitleTextAttributes = largeTitleTextAttributes
            appearance.setBackIndicatorImage(backImage, transitionMaskImage: backImage)
            
            navigationBar.standardAppearance   = appearance
            navigationBar.scrollEdgeAppearance = appearance
            navigationBar.compactAppearance    = appearance
        }
        navigationBar.backItem?.backBarButtonItem?.setTitlePositionAdjustment(.init(horizontal: 0, vertical: -13), for: .default)
    }
}

