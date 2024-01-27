//
//  ScrollViewReaderUIView.swift
//  LearningSwiftUIIntermediate
//
//  Created by Aditya Ghorpade on 26/01/24.
//


//Scroll view readers are very useful in navigation of bigger scroll view
/*For example in the chat apps like watsapp these are very important as the chat needs to be  at the bottom always*/


import SwiftUI

struct ScrollViewReaderUIView: View {
    
    @State private var scrollToIndex: Int = 0
    @State private var textFieldText: String = ""
    
    var body: some View {
        VStack {
            TextField("Enter number here", text: $textFieldText)
                .padding(.horizontal)
                .frame(height: 50)
                .border(Color.gray)
                .padding(.horizontal)
                .keyboardType(.numberPad)
            
            Button("SCROLL NOW") {
                if let index = Int(textFieldText) {
                    scrollToIndex = index
                }
            }
            
            ScrollView {
                ScrollViewReader { proxy in
                    ForEach(0..<50) { index in
                        Text("This is item #\(index)")
                            .font(.headline)
                            .frame(height: 200)
                            .frame(maxWidth: .infinity)
                            .background(Color.white.clipShape(RoundedRectangle(cornerRadius: 10)))
                            .shadow(radius: 10)
                            .padding()
                            .id(index)
                    }
                    .onChange(of: scrollToIndex) { _, value in
                        withAnimation(.spring()) {
                            proxy.scrollTo(value, anchor: .top)
                        }
                    }
                }
            }
        }
        
    }
}

#Preview {
    ScrollViewReaderUIView()
}
