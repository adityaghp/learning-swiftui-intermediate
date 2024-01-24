//
//  DragGestureUIView2.swift
//  LearningSwiftUIIntermediate
//
//  Created by Aditya Ghorpade on 23/01/24.
//

import SwiftUI

struct DragGestureUIView2: View {
    
    @State private var startingOffsetY: CGFloat = UIScreen.main.bounds.height * 0.83
    @State private var currentDragOffsetY: CGFloat = 0
    @State private var endingOffsetY: CGFloat = 0
    
    var body: some View {
        ZStack {
            Color.green.ignoresSafeArea()
            
            MySignUpView()
                .offset(y: startingOffsetY)
                .offset(y: currentDragOffsetY)
                .offset(y: endingOffsetY)
                .gesture(
                    DragGesture()
                        .onChanged({ value in
                            withAnimation(.default) {
                                currentDragOffsetY = value.translation.height
                            }
                        })
                        .onEnded({ _ in
                            withAnimation(.default) {
                                if currentDragOffsetY < -180 {
                                    endingOffsetY = -startingOffsetY
                                } else if endingOffsetY != 0 && currentDragOffsetY > 180 {
                                    endingOffsetY = 0
                                }
                                currentDragOffsetY = 0
                            }
                        })
                )
        }
        .ignoresSafeArea(edges: .bottom)
    }
}

#Preview {
    DragGestureUIView2()
}

struct MySignUpView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "chevron.up")
                .padding(.top)
            
            Text("Sign up")
                .font(.headline)
                .fontWeight(.semibold)
            
            Image(systemName: "flame.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
            
            Text("This is the Description for our app. This screen just shows the real world example of the Drag gesture and how the drag gesture is so common int the apps that we use daily, Hope you will love it!")
                .multilineTextAlignment(.center)
            
            Text("CREATE AN ACCOUNT")
                .foregroundStyle(Color.white)
                .font(.headline)
                .padding()
                .padding(.horizontal)
                .background(Color.black.clipShape(RoundedRectangle(cornerRadius: 10)))
            
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 30))
    }
}
