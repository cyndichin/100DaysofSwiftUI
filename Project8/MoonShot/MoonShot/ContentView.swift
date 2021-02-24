//
//  ContentView.swift
//  MoonShot
//
//  Created by cynber on 2/23/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            GeometryReader { geo in
                 Image("Example")
                     .resizable()
                     .aspectRatio(contentMode: .fit)
                     .frame(width: geo.size.width, height: 300)
             }
            
            //.fit means the entire image will fit inside the container even if that means leaving some parts of the view empty, and .fill means the view will have no empty parts even if that means some of our image lies outside the container.
            
//                .clipped()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
