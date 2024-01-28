//
//  MultipleSheetsUIView.swift
//  LearningSwiftUIIntermediate
//
//  Created by Aditya Ghorpade on 27/01/24.
//

/*
 If we want to use multiple sheets in one screen, there are different methods to do so.
 The most reliable way is to use .sheet with $item to display multiple sheets using one screen.
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
    
    @State private var selectedModel: RandomModel? = nil
    //@State private var showSheet: Bool = false

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                ForEach(0..<50) { index in
                    Button("BUTTON \(index)") {
                        selectedModel = RandomModel(title: "\(index)")
                        //showSheet.toggle()
                    }
                }
            }
            .sheet(item: $selectedModel) { model in
                SheetView(selectedModel: model)
            }
        }
        
        //.sheet(isPresented: $showSheet, content: {
            //SheetView(selectedModel: selectedModel)
        //})
    }
}

struct SheetView: View {
    
    let selectedModel: RandomModel
    
    //This variable is used for displaying sheet using binding the variable, uncomment this variable and use $selectedModel//
    //@Binding var selectedModel: RandomModel
    
    var body: some View {
        Text(selectedModel.title)
            .font(.largeTitle)
    }
}

#Preview {
    MultipleSheetsUIView()
}
