//
//  EscapingUIView.swift
//  LearningSwiftUIIntermediate
//
//  Created by Aditya Ghorpade on 13/02/24.
//

import SwiftUI

class EscapingViewModel: ObservableObject {
    
    @Published var text: String = "Hello"
    
    func getData() {
        downloadData4 { [weak self] returnedData in
            self?.text = returnedData.data
        }
    }
    
    func downloadData() -> String {
        return "New Data!"
    }
    
    func downloadData2(completionHandler: (_ data: String) -> Void) {
        completionHandler("New Data!")
    }
    
    func downloadData3(completionHandler: @escaping (_ data: String) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            completionHandler("New Data!")
        }
    }
    
    func downloadData4(completionHandler: @escaping (DownloadResult) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            let result = DownloadResult(data: "New Data!")
            completionHandler(result)
        }
    }
    
    func downloadData5(completionHandler: @escaping DownloadCompletion) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            let result = DownloadResult(data: "New Data!")
            completionHandler(result)
        }
    }
    
    
}

struct DownloadResult {
    let data: String
}

typealias DownloadCompletion = (DownloadResult) -> Void

struct EscapingUIView: View {
    
    @StateObject var vm = EscapingViewModel()
    
    var body: some View {
        Text(vm.text)
            .font(.largeTitle)
            .fontWeight(.semibold)
            .foregroundStyle(Color.blue)
            .onTapGesture {
                vm.getData()
            }
    }
}

#Preview {
    EscapingUIView()
}
