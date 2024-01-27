//
//  GeometryReaderUIView.swift
//  LearningSwiftUIIntermediate
//
//  Created by Aditya Ghorpade on 27/01/24.
//

import SwiftUI

struct GeometryReaderUIView: View {
    
    //This function returns the percentage 
    func getPercentage(geo: GeometryProxy) -> Double {
        let maxDistance = UIScreen.main.bounds.width / 2
        let currentX = geo.frame(in: .global).midX
        return (1 - (currentX / maxDistance))
    }
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(0..<20) { index in
                    GeometryReader { geometry in
                        RoundedRectangle(cornerRadius: 20)
                            .rotation3DEffect(
                                Angle(degrees: getPercentage(geo: geometry) * 40),
                                axis: (x: 0.0, y: 1.0, z: 0.0)
                            )
                    }
                    .frame(width: 300, height: 250)
                    .padding()
                }
            }
        }
        /*The geometry reader comes in handy for the purpose of orentation because it keeps the track of coordinates and layouts. Although it is very useful but it takes up more performance and it is only advised to use geometry reader only when necessary.
         Uncomment the below code to see what geometery reader does
         */
        
//        GeometryReader { geometry in
//            HStack(spacing: 0) {
//                Rectangle()
//                    .fill(Color.red)
//                    .frame(width: geometry.size.width * 0.66666)
//                
//                Rectangle()
//                    .fill(Color.blue)
//            }
//            .ignoresSafeArea()
//        }
    }
}

#Preview {
    GeometryReaderUIView()
}
