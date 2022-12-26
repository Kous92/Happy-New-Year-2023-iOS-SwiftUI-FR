//
//  GoldenButton.swift
//  HappyNewYear2023
//
//  Created by Koussaïla Ben Mamar on 24/12/2022.
//

import SwiftUI

struct GoldenButton: View {
    var body: some View {
        Text("Compte à rebours")
            .frame(width: UIScreen.main.bounds.width * 0.6, height: 50, alignment: .center)
            .foregroundColor(.black)
            .background(Image("GoldFoil"))
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.black, lineWidth: 1)
            )
    }
}

struct GoldenButton_Previews: PreviewProvider {
    static var previews: some View {
        GoldenButton()
            .previewDisplayName("GoldenButton")
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
    }
}
