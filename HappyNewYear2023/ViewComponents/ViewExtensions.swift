//
//  ViewExtensions.swift
//  HappyNewYear2023
//
//  Created by Koussaïla Ben Mamar on 26/12/2022.
//

import SwiftUI

extension View {
    func hide(isHidden: Bool) -> some View {
        isHidden ? AnyView(self.hidden()) : AnyView(self)
    }
}
