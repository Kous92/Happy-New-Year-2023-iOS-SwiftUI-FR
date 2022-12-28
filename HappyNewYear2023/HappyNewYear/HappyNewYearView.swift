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
            if showImage && !image.isEmpty {
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
                        Text("happyNewYear")
                            .font(.system(size: Constants.HappyNewYearAnimation.happyNewYearFontSize))
                            .fontWeight(.medium)
                            .foregroundStyle(.image(Image("GoldFoil")))
                            .glowBorder(color: .black, lineWidth: 2)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 20)
                            
                        Text("2023")
                            .font(.system(size: Constants.HappyNewYearAnimation.yearFontSize))
                            .fontWeight(.medium)
                            .foregroundStyle(.image(Image("GoldFoil")))
                            .glowBorder(color: .black, lineWidth: 2)
                    }
                    .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
                }
                
                if showSecondText {
                    VStack {
                        Text(NSLocalizedString(newYearMessage, comment: ""))
                            .font(.system(size: Constants.HappyNewYearAnimation.messageFontSize))
                            .foregroundStyle(.image(Image("GoldFoil")))
                            .fontWeight(.semibold)
                            .glowBorder(color: .black, lineWidth: 2)
                            .transition(.opacity)
                            .opacity(showSecondText ? 1 : 0)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 20)
                    }
                    .position(x: geometry.size.width / 2, y: geometry.size.height - Constants.HappyNewYearAnimation.messageYposition)
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
        }.background(.black)
    }
    
    private func switchImageAnimation() {
        guard i < viewModel.imageData.count - 1 else {
            timer.upstream.connect().cancel()
            return
        }
        
        withAnimation(Animation.easeInOut(duration: 1)) {
            image = ""
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
        Group {
            HappyNewYearView()
                .preferredColorScheme(.dark)
                .previewDisplayName("HappyNewYear (iPhone)")
                .previewDevice("iPhone 14 Pro")
            
            HappyNewYearView()
                .preferredColorScheme(.dark)
                .previewDisplayName("HappyNewYear (iPad)")
                .previewDevice("iPad Pro (11-inch)(4th generation)")
        }
    }
}
