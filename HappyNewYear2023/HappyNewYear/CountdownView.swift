//
//  CountdownView.swift
//  HappyNewYear2023
//
//  Created by Koussaïla Ben Mamar on 24/12/2022.
//

import SwiftUI

struct CountdownView: View {
    @State var countdownSeconds = 10
    @State var countdownEnabled = false
    @State var showSecondScreen = false
    @State private var hideButton = false
    
    // Cela permet de mettre à jour le compte à rebours toutes les secondes
    @State private var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack {
            Image("HappyNewYearGold")
                .resizable()
                .ignoresSafeArea(.all)
                .zIndex(0)
            
            GeometryReader { geometry in
                VStack {
                    Text("\(countdownSeconds)")
                        .font(.system(size: 165))
                        .fontWeight(.medium)
                        .foregroundStyle(.image(Image("GoldFoil")))
                        .glowBorder(color: .black, lineWidth: 2)
                        .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
                        .hide(isHidden: !countdownEnabled)
                        .onReceive(timer) { _ in
                            updateCountdown()
                        }
                        .fullScreenCover(isPresented: $showSecondScreen) {
                            withAnimation {
                                HappyNewYearView()
                            }
                        }.zIndex(2)
                    
                    Button {
                        self.countdownSeconds = 10
                        self.hideButton.toggle()
                        
                        withAnimation {
                            self.countdownEnabled.toggle()
                        }
                        
                        timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
                    } label: {
                        GoldenButton()
                    }
                    .hide(isHidden: hideButton)
                    .frame(alignment: .bottom)
                    .padding(.bottom, 10)
                }
            }.zIndex(1)
        }
    }
    
    private func updateCountdown() {
        if self.countdownSeconds > 0 && countdownEnabled {
            self.countdownSeconds -= 1
            
            // Temps écoulé, on transite à l'écran suivant
            if self.countdownSeconds == 0 {
                showSecondScreen.toggle()
            }
        } else {
            // On arrête le compte à rebours
            timer.upstream.connect().cancel()
        }
    }
}

struct CountdownView_Previews: PreviewProvider {
    static var previews: some View {
        CountdownView()
    }
}
