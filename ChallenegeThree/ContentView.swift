//
//  ContentView.swift
//  ChallenegeThree
//
//  Created by Ivan Pryhara on 07/03/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var isHidden: Bool = true
    
    private let imageName: String = "play.fill"
    
    private var image: some View {
        Image(systemName: imageName)
    }
    
    var body: some View {
        Button {
            withAnimation(.spring(duration: 0.4,
                                  bounce: 0.4,
                                  blendDuration: 1)) {
                isHidden = false
            } completion: {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                    isHidden = true
                }
            }
        } label: {
            HStack(spacing: -5) {
                if !isHidden {
                    image
                        .transition(.slide.combined(with: .scale))
                }
                
                image
                if isHidden {
                    image
                        .transition(.slide.combined(with: .scale))
                }
            }
            .font(.largeTitle)
        }
    }
}

#Preview {
    ContentView()
}
