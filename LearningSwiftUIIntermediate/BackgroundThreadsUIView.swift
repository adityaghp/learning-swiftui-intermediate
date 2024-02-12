//
//  BackgroundThreadsUIView.swift
//  LearningSwiftUIIntermediate
//
//  Created by Aditya Ghorpade on 10/02/24.
//

import SwiftUI

class BackgroundThreadViewModel: ObservableObject {
    
    @Published var dataArray: [String] = []
    
    func fetchData() {
        DispatchQueue.global().async {
            let newData = self.downloadData()
            
            print("CHECK 1: \(Thread.isMainThread)")
            print("CHECK 1: \(Thread.current)")
            
            //UI should always be updated on main thread
            DispatchQueue.main.async {
                self.dataArray = newData
                
                print("CHECK 2: \(Thread.isMainThread)")
                print("CHECK 2: \(Thread.current)")
            }
        }
    }
    
    func downloadData() -> [String] {
        var data: [String] = []
        
        for x in 1...100 {
            data.append("\(x)")
            print(data)
        }
        return data
    }
}

struct BackgroundThreadsUIView: View {
    
    @StateObject var vm = BackgroundThreadViewModel()
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text("LOAD DATA")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .onTapGesture {
                        vm.fetchData()
                    }
                
                ForEach(vm.dataArray, id: \.self) { item in
                    Text(item)
                        .font(.headline)
                        .foregroundStyle(Color.red)
                }
            }
        }
    }
}

#Preview {
    BackgroundThreadsUIView()
}
