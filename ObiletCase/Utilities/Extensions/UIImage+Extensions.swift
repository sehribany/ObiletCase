//
//  UIImage+Extensions.swift
//  ObiletCase
//
//  Created by Şehriban Yıldırım on 18.10.2024.
//

import UIKit
import Kingfisher

// MARK: - Resize Image for Content Mode
extension UIImage {
    func resize(to size: CGSize, for contentMode: UIView.ContentMode? = nil) -> UIImage {
        switch contentMode {
        case .scaleAspectFit:
            return kf.resize(to: size, for: .aspectFit)
        case .scaleToFill:
            return kf.resize(to: size, for: .aspectFill)
        default:
            return kf.resize(to: size)
        }
    }
}
