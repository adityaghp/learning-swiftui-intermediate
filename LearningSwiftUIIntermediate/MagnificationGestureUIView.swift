//
//  MagnificationGestureUIView.swift
//  LearningSwiftUIIntermediate
//
//  Created by Aditya Ghorpade on 11/12/23.
//

import SwiftUI

struct MagnificationGestureUIView: View {
    
    @State private var currentAmount: CGFloat = 0
    @State private var lastAmount: CGFloat = 0
 
    var body: some View {
        VStack(spacing: 10) {
            HStack {
                Circle()
                    .frame(width: 35, height: 35)
                Text("Aditya Ghorpade")
                Spacer()
                Image(systemName: "ellipsis")
            }
            .padding(.horizontal)
            
            Rectangle()
                .frame(height: 400)
                .scaleEffect(1 + currentAmount + lastAmount)
                .gesture(
                    MagnificationGesture()
                        .onChanged { value in
                            currentAmount = value - 1
                        }
                        .onEnded { _ in
                            withAnimation(.default) {
                                currentAmount = 0
                            }
                        }
                )
            
            HStack {
                Image(systemName: "heart")
                Image(systemName: "message")
                Image(systemName: "paperplane")
                Spacer()
            }
            .font(.title)
            .padding(.horizontal, 10)
            
            Text("This is the caption for my photo!")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
        }
        
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//            .font(.title)
//            .padding(40)
//            .background(Color.red.clipShape(RoundedRectangle(cornerRadius: 10)))
//            .scaleEffect(1 + currentAmount + lastAmount)
//            .gesture(
//                MagnificationGesture()
//                    .onChanged({ value in
//                        currentAmount = value - 1
//                    })
//                    .onEnded({ value in
//                        lastAmount += currentAmount
//                        currentAmount = 0
//                    })
//            )
    }
}

#Preview {
    MagnificationGestureUIView()
}
