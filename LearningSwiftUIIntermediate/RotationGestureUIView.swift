//
//  RotationGestureUIView.swift
//  LearningSwiftUIIntermediate
//
//  Created by Aditya Ghorpade on 11/12/23.
//

import SwiftUI

struct RotationGestureUIView: View {
    
    @State private var angle: Angle = Angle(degrees: 0)
    
    var body: some View {
        Text("Hello, World!")
            .font(.largeTitle)
            .fontWeight(.semibold)
            .padding(50)
            .background(Color.yellow.clipShape(RoundedRectangle(cornerRadius: 10)))
            .rotationEffect(angle)
            .gesture(
                RotationGesture()
                    .onChanged({ value in
                        angle = value
                    })
                    .onEnded({ _ in
                        withAnimation(.default) {
                            angle = Angle(degrees: 0)
                        }
                    })
            )
    }
}

#Preview {
    RotationGestureUIView()
}
