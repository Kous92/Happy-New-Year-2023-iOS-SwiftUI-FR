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
        
        messageData = ["Meilleurs vœux", "Bonne santé", "Plein de bonheur", "Plein de réussite", "Et surtout de la stabilité au niveau professionnel"]
    }
}
