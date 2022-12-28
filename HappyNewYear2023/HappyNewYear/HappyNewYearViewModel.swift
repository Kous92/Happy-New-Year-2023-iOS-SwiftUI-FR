//
//  HappyNewYearViewModel.swift
//  HappyNewYear2023
//
//  Created by Koussaïla Ben Mamar on 25/12/2022.
//

import Foundation

class HappyNewYearViewModel: ObservableObject {
    @Published var imageData = [String]()
    @Published var messageData = [String]()
    
    func initData() {
        imageData = ["HappyNewYearFireworks", "HappyNewYearParis", "HappyNewYearDubai1", "HappyNewYearDubai2", "HappyNewYearGold"]
        
        // Ces chaînes sont des clés pour le support multi-langues de l'application
        messageData = ["bestWishes", "goodHealth", "lotOfHappiness", "lotOfSuccess", "professionalStability"]
    }
}
