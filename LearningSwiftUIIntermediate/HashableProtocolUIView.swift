//
//  HashableProtocolUIView.swift
//  LearningSwiftUIIntermediate
//
//  Created by Aditya Ghorpade on 31/01/24.
//

import SwiftUI

struct MyCusotmModel: Hashable {
    //let id = UUID().uuidString
    let title: String
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(title)
    }
}

struct HashableProtocolUIView: View {
    
    var data: [MyCusotmModel] = [
        MyCusotmModel(title: "ONE"),
        MyCusotmModel(title: "TWO"),
        MyCusotmModel(title: "THREE"),
        MyCusotmModel(title: "FOUR"),
        MyCusotmModel(title: "FIVE")
    ]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 40) {
//                ForEach(data) { items in
//                    Text(items.title)
//                        .font(.headline)
//                }
                
                ForEach(data, id: \.self) { items in
                    Text(items.hashValue.description)
                        .font(.headline)
                }
            }
        }
    }
}

#Preview {
    HashableProtocolUIView()
}
