//
//  ContentView.swift
//  StudentBook
//
//  Created by Sudheshna Tholikonda on 16/10/26.
//

import SwiftUI

struct ContentView: View {
    
    @State private var viewModel = StudentViewModel(
        repository: FileStudentRepository()
    )
    var body: some View {
        TabView {
            StudentListView(viewModel: viewModel)
                .tabItem {
                    Label("Students", systemImage: "person.2.fill")
                }
            
            FavouriteStudentsView(viewModel: viewModel)
                .tabItem {
                    Label("Favourites", systemImage: "heart")
                }
        }
      
    }
}

#Preview {
    ContentView()
}
