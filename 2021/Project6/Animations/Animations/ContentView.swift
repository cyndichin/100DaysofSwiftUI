//
//  ContentView.swift
//  Animations
//
//  Created by cynber on 2/15/21.
//

import SwiftUI

struct ContentView: View {
    @State private var animationAmount = 0.0
    @State private var enabled = false
    var body: some View {
        Stepper("Scale amount", value: $animationAmount.animation(
            Animation.easeInOut(duration: 1)
                .repeatCount(3, autoreverses: true)
        ), in: 1...10)
        
        Spacer()
        
        Button("Tap Me") {
            self.enabled.toggle()
//            withAnimation {
//                self.animationAmount += 360
//            }
            //            self.animationAmount += 1
        }
        .frame(width: 200, height: 200)
        .background(enabled ? Color.blue : Color.red)
        .animation(nil)
        .foregroundColor(.white)
        .clipShape(RoundedRectangle(cornerRadius: enabled ? 60 : 0))
        .animation(.interpolatingSpring(stiffness: 10, damping: 1))
//        .padding(50)
//        .background(Color.red)
//        .foregroundColor(.white)
//        .clipShape(Circle())
//        .overlay(
//            Circle()
//                .stroke(Color.red)
//                .scaleEffect()
//                .opacity(Double(2 - animationAmount))
//                .animation(
//                    Animation.easeOut(duration: 1)
//                        .repeatForever(autoreverses: false)
//                )
//        )
//        .rotation3DEffect(.degrees(animationAmount), axis: (x: 0, y: 1, z: 0))
//        .onAppear {
//            self.animationAmount = 2
//        }
        
        //        .scaleEffect(animationAmount)
        //        .animation(
        //            Animation.easeInOut(duration: 1)
        //                .repeatCount(3, autoreverses: true)
        //        )
        //        .blur(radius: (animationAmount - 1) * 3)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
