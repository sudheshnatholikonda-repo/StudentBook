//
//  FavouriteStudentsView.swift
//  StudentBook
//
//  Created by Sudheshna Tholikonda on 19/10/26.
//

import SwiftUI

struct FavouriteStudentsView: View {

    let viewModel: StudentViewModel

    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.students.filter {
                    viewModel.isFavourite($0)
                }) { student in

                    NavigationLink {
                        StudentDetailView(
                            student: student,
                            viewModel: viewModel
                        )
                    } label: {
                        HStack {
                            Text(student.name)
                            Spacer()
                            Image(systemName: "heart.fill")
                                .foregroundStyle(.red)
                        }
                    }
                }
            }
            .navigationTitle("Favourites")
        }
    }
}

#Preview {
    FavouriteStudentsView(viewModel: StudentViewModel(repository: MockStudentRepository()))
}
