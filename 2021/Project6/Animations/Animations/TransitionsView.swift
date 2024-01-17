//
//  TransitionsView.swift
//  Animations
//
//  Created by cynber on 2/17/21.
//

import SwiftUI

struct TransitionsView: View {
    @State private var isShowingRed = false
    
    var body: some View {
        VStack {
            Button("Tap Me") {
                withAnimation {
                    self.isShowingRed.toggle()
                }
            }

            if isShowingRed {
                Rectangle()
                    .fill(Color.red)
                    .frame(width: 200, height: 200)
                    .transition(.asymmetric(insertion: .scale, removal: .opacity))
            }
        }
    }
}

struct TransitionsView_Previews: PreviewProvider {
    static var previews: some View {
        TransitionsView()
    }
}
