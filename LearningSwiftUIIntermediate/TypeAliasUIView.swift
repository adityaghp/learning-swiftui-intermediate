//
//  TypeAliasUIView.swift
//  LearningSwiftUIIntermediate
//
//  Created by Aditya Ghorpade on 12/02/24.
//

import SwiftUI

struct MovieModel {
    let title: String
    let director: String
    let rating: Int
}

typealias TVShowsModel = MovieModel

struct TypeAliasUIView: View {
    
    //@State var item: MovieModel = MovieModel(title: "Bahubali 1", director: "S.S Rajamouli", rating: 9)
    @State var item: TVShowsModel = TVShowsModel(title: "Breaking bad", director: "Venice Gilligan", rating: 10)
    
    var body: some View {
        Text(item.title)
        Text(item.director)
        Text("\(item.rating)")
    }
}

#Preview {
    TypeAliasUIView()
}
