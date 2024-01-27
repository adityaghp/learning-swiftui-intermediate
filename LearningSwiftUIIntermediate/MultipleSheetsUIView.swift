//
//  MultipleSheetsUIView.swift
//  LearningSwiftUIIntermediate
//
//  Created by Aditya Ghorpade on 27/01/24.
//
/*
 If we want to use multiple sheets in one screen there are different methods to do so.
 */
// Multiple sheets
// 1 - Using binding
// 2 - Using multiple .sheet
// 3 - Using $item

import SwiftUI

struct RandomModel: Identifiable {
    let id = UUID().uuidString
    let title: String
}

struct MultipleSheetsUIView: View {
    
    @State private var selectedModel: RandomModel = RandomModel(title: "STARTING TITLE")
    @State private var showSheet: Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
            Button("BUTTON 1") {
                selectedModel = RandomModel(title: "ONE")
                showSheet.toggle()
            }
            
            Button("BUTTON 2") {
                selectedModel = RandomModel(title: "TWO")
                showSheet.toggle()
            }
        }
        .sheet(isPresented: $showSheet, content: {
            SheetView(selectedModel: selectedModel)
        })
    }
}

struct SheetView: View {
    
    let selectedModel: RandomModel
    
    var body: some View {
        Text(selectedModel.title)
            .font(.largeTitle)
    }
}

#Preview {
    MultipleSheetsUIView()
}
