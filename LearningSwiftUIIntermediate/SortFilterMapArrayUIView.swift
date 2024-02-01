//
//  SortFilterMapArrayUIView.swift
//  LearningSwiftUIIntermediate
//
//  Created by Aditya Ghorpade on 31/01/24.
//

import SwiftUI

struct UserModel: Identifiable {
    let id = UUID().uuidString
    let name: String
    let points: Int
    let isVerified: Bool
}

class ArrayModificationViewModel: ObservableObject {
    
    @Published var dataArray: [UserModel] = []
    @Published var filteredArray: [UserModel] = []
    @Published var mappedArray: [String] = []
    @Published var combinedFilteredArray: [String] = []
    
    init() {
        getUsers()
        updateFilteredArray()
    }
    
    func updateFilteredArray() {
        //There are three main methods by which we can filter an array
        //MARK: 1) .sort
        /*
        filteredArray = dataArray.sorted { user1, user2 in
            return user1.points > user2.points
        }
        
        //A closure can be modified to a short single line as shown below
        //filteredArray = dataArray.sorted { $0.points > $1.points }
        */
        
        //MARK: 2) .filter
        /*
        filteredArray = dataArray.filter({ user in
            return user.isVerified
            //return user.points > 50
        })
        
        //The above code can also be reduced as shown below
        //filteredArray = dataArray.filter { $0.isVerified }
        */
        
        //MARK: 3) .map
        /*
        mappedArray = dataArray.map({ user in
            return user.name 
        })
        
        //The compactmap also consider the optional value
        //mappedArray = dataArray.compactMap({ user in
            //return user.name
        //})
        
        //The above closure can be simplified as shown below
        //mappedArray = dataArray.map({ $0.name })
        */
        
        //MARK: 4) .sort, .filter and .map combined
        /*
        combinedFilteredArray = dataArray
            .sorted(by: { $0.points > $1.points })
            .filter({ $0.isVerified })
            .map({ $0.name })
        */
    }
    
    func getUsers() {
        let user1 = UserModel(name: "Aditya", points: 100, isVerified: true)
        let user2 = UserModel(name: "Akshay", points: 50, isVerified: false)
        let user3 = UserModel(name: "Girish", points: 65, isVerified: true)
        let user4 = UserModel(name: "Prithvi", points: 32, isVerified: false)
        let user5 = UserModel(name: "Chinmay", points: 95, isVerified: true)
        let user6 = UserModel(name: "Harshal", points: 55, isVerified: false)
        let user7 = UserModel(name: "Sakshi", points: 80, isVerified: true)
        let user8 = UserModel(name: "Rohan", points: 22, isVerified: false)
        let user9 = UserModel(name: "Shruti", points: 5, isVerified: true)
        let user10 = UserModel(name: "Shubham", points: 19, isVerified: false)
        let user11 = UserModel(name: "Adesh", points: 42, isVerified: true)
        let user12 = UserModel(name: "Sanjana", points: 69, isVerified: false)
        let user13 = UserModel(name: "Om", points: 0, isVerified: true)
        dataArray.append(contentsOf: [user1, user2, user3, user4, user5, user6, user7, user8, user9, user10, user11, user12, user13])
    }
    
}

struct SortFilterMapArrayUIView: View {
    
    @StateObject var vm = ArrayModificationViewModel()
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                //MARK: for .sort and .filter
                //This is for .sort and .filter modifier
                ForEach(vm.dataArray) { users in
                    VStack(alignment: .leading) {
                        Text(users.name)
                            .font(.headline)
                        HStack {
                            Text("Points: \(users.points)")
                            Spacer()
                            if users.isVerified {
                                Image(systemName: "person.badge.shield.checkmark.fill")
                            }
                        }
                    }
                    .foregroundStyle(Color.white)
                    .padding()
                    .background(Color.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding(.horizontal)
                }

                //MARK: for .map modifier
                /*
                //This for loop is for .map modifier.
                ForEach(vm.mappedArray, id: \.self) { name in
                    Text(name)
                        .font(.title)
                }
                */
                
                //MARK: for all combined
                /*
                //This for loop is for combined modifier.
                ForEach(vm.combinedFilteredArray, id: \.self) { name in
                    Text(name)
                        .font(.title)
                }
                */
            }
        }
    }
}

#Preview {
    SortFilterMapArrayUIView()
}
