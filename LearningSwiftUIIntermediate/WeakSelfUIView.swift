//
//  WeakSelfUIView.swift
//  LearningSwiftUIIntermediate
//
//  Created by Aditya Ghorpade on 11/02/24.
//

import SwiftUI

struct WeakSelfUIView: View {
    
    @AppStorage("count") var count: Int?
    
    init() {
        count = 0
    }

    
    var body: some View {
        NavigationStack {
            NavigationLink("NAVIGATE") {
                SecondScreen()
            }
            .navigationTitle("Screen 1")
        }
        .overlay(alignment: .topTrailing) {
            Text("\(count ?? 0)")
                .font(.largeTitle)
                .padding()
                .background(Color.green)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding()
        }
    }
}

struct SecondScreen: View {
    
    @StateObject var vm = WeakSelfSecondScreenViewModel()
    
    var body: some View {
        VStack {
            Text("Second View")
                .font(.largeTitle)
                .foregroundStyle(Color.red)
            
            if let data = vm.data {
                Text(data)
                    .multilineTextAlignment(.center)
            }
        }
    }
}

class WeakSelfSecondScreenViewModel: ObservableObject {
    
    @Published var data: String? = nil
    
    init() {
        print("INITILIZED NOW")
        let currentCount = UserDefaults.standard.integer(forKey: "count")
        UserDefaults.standard.set(currentCount + 1, forKey: "count")
        fetchData()
    }
    
    deinit {
        print("DEINITILIZED NOW")
        let currentCount = UserDefaults.standard.integer(forKey: "count")
        UserDefaults.standard.set(currentCount - 1, forKey: "count")
    }
    
    func fetchData() {
        data = "NEW DATA!!!"
        
        /*
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.data = "THIS IS A DEMONSTRATION WITHOUT USING WEAK SELF (Strong reference)"
        }
        */
        
        /*
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) { [weak self] in
            self?.data = "THIS IS A DEMONSTRATION USING WEAK SELF (Weak Reference)"
        }
        */
    }
}

#Preview {
    WeakSelfUIView()
}
