//
//  ImageAnimationView.swift
//  HappyNewYear2023
//
//  Created by Koussaïla Ben Mamar on 16/12/2022.
//

import SwiftUI

struct HappyNewYearView: View {
    @ObservedObject var viewModel = HappyNewYearViewModel()
    @State private var i = 0
    @State private var image = ""
    @State private var newYearMessage = ""
    @State private var showMainText = false
    @State private var showSecondText = false
    @State private var showImage = false
    @State private var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var seconds = 0
    
    var body: some View {
        ZStack {
            if showImage {
                Image(image)
                    .resizable()
                    .ignoresSafeArea(.all)
                    .transition(.opacity)
                    .opacity(showImage ? 1 : 0)
                    .zIndex(1)
            }
            
            GeometryReader { geometry in
                if showMainText {
                    VStack(spacing: 10) {
                        Text("BONNE ANNÉE")
                            .font(.system(size: 50))
                            .fontWeight(.medium)
                            .foregroundStyle(.image(Image("GoldFoil")))
                            .glowBorder(color: .black, lineWidth: 2)
                            .multilineTextAlignment(.center)
                            
                        Text("2023")
                            .font(.system(size: 90))
                            .fontWeight(.medium)
                            .foregroundStyle(.image(Image("GoldFoil")))
                            .glowBorder(color: .black, lineWidth: 2)
                    }
                    .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
                }
                
                if showSecondText {
                    VStack {
                        Text(newYearMessage)
                            .font(.system(size: 30))
                            .foregroundStyle(.image(Image("GoldFoil")))
                            .fontWeight(.semibold)
                            .glowBorder(color: .black, lineWidth: 2)
                            .transition(.opacity)
                            .opacity(showSecondText ? 1 : 0)
                            .multilineTextAlignment(.center)
                            .position(x: geometry.size.width / 2, y: geometry.size.height - 80)
                    }
                }
            }.zIndex(2)
        }
        .onAppear {
            viewModel.initData()
            image = viewModel.imageData[0]
            newYearMessage = viewModel.messageData[0]
            
            withAnimation(Animation.easeInOut(duration: 2)) {
                showImage.toggle()
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                withAnimation(Animation.easeInOut(duration: 2)) {
                    showMainText.toggle()
                }
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation(Animation.easeInOut(duration: 2)) {
                    showSecondText.toggle()
                }
            }
        }
        .onReceive(timer) { _ in
            self.seconds += 1
            if seconds % 8 == 0 {
                switchImageAnimation()
            }
        }
    }
    
    private func switchImageAnimation() {
        guard i < viewModel.imageData.count - 1 else {
            timer.upstream.connect().cancel()
            return
        }
        
        withAnimation(Animation.easeInOut(duration: 1)) {
            showImage.toggle()
            showSecondText.toggle()
        }
        
        i += 1
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            withAnimation(Animation.easeInOut(duration: 2)) {
                image = viewModel.imageData[i]
                showImage.toggle()
                newYearMessage = ""
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            withAnimation(Animation.easeInOut(duration: 2)) {
                showSecondText.toggle()
                newYearMessage = viewModel.messageData[i]
            }
        }
    }
}

struct ImageAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        HappyNewYearView()
            .preferredColorScheme(.dark)
    }
}
