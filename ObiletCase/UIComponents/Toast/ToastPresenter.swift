//
//  ToastPresenter.swift
//  ObiletCase
//
//  Created by Şehriban Yıldırım on 13.10.2024.
//

import SwiftEntryKit

public class ToastPresenter {
    
    public static func showWarningToast(text: String) {
        var attributes               = EKAttributes.topToast
        attributes.entryBackground   = .color(color: EKColor(light: .blue, dark: .brown))
        attributes.entranceAnimation = .translation
        attributes.exitAnimation     = .translation

        let customView = ToastWarningView(text: text)
        SwiftEntryKit.display(entry: customView, using: attributes)
    }
}
