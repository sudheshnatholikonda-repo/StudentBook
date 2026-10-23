//
//  StudentDetailView.swift
//  StudentBook
//
//  Created by Sudheshna Tholikonda on 19/10/26.
//

import SwiftUI

struct StudentDetailView: View {
    
    let student: Student
    let viewModel: StudentViewModel
    
    var body: some View {
        VStack(spacing: 20) {
                    AsyncImage(url: URL(string: student.imageURL)) { image in
                        image
                            .resizable()
                            .scaledToFill()
                    } placeholder: {
                        Image(systemName: "person.crop.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .foregroundStyle(.gray)
                    }
                    .frame(width: 150, height: 150)
                    .clipShape(Circle())

                    Text(student.name)
                        .font(.title)

                    Text(student.course)
                        .font(.headline)

                    Text(student.description)
                        .font(.body)

                    Spacer()
                }
                .padding()
                .navigationTitle("Student Details")
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            viewModel.toggleFavourite(for: student)
                        } label: {
                            Image(
                                systemName: viewModel.isFavourite(student) ? "heart.fill" : "heart")
                                               .foregroundStyle(.red)
                        }
                        .accessibilityLabel(viewModel.isFavourite(student)
                                                ? "Remove from favourites"
                                                : "Add to favourites")
                    }
                    
                }
    }
}

#Preview {
    StudentDetailView(student: MockStudentData.students[0],
                      viewModel: StudentViewModel(repository: MockStudentRepository()))
}

