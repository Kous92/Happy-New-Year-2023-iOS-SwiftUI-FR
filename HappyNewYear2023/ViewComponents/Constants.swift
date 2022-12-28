//
//  Constants.swift
//  HappyNewYear2023
//
//  Created by Koussaïla Ben Mamar on 28/12/2022.
//

import Foundation
import UIKit

// Soit sur iPhone, soit sur iPad
fileprivate func isPhone() -> Bool {
    return UIDevice.current.userInterfaceIdiom == .phone
}

struct Constants {
    struct Countdown {
        static let countdownFontSize: CGFloat = isPhone() ? 165 : 250
        static let goldenButtonHeight: CGFloat = isPhone() ? 50 : 90
        static let goldenButtonFontSize: CGFloat = isPhone() ? 18 : 35
        static let goldenButtonBottomMargin: CGFloat = isPhone() ? 10 : 35
    }
    
    struct HappyNewYearAnimation {
        static let happyNewYearFontSize: CGFloat = isPhone() ? 50 : 100
        static let yearFontSize: CGFloat = isPhone() ? 90 : 160
        static let messageFontSize: CGFloat = isPhone() ? 30 : 50
        static let messageYposition: CGFloat = isPhone() ? 80 : 120
    }
}
