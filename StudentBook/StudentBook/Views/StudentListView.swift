//
//  StudentListView.swift
//  StudentBook
//
//  Created by Sudheshna Tholikonda on 19/10/26.
//

import SwiftUI

struct StudentListView: View {
    
    let students = MockStudentData.students
    let viewModel: StudentViewModel
    
    @State private var showAddStudent = false
    
    var body: some View {
        NavigationStack {
            Group {
                if viewModel.isLoading {
                    ProgressView("Loading students...")
                    
                } else if let error = viewModel.errorMessage {
                    ContentUnavailableView {
                        Label("Loading Failed",
                              systemImage: "exclamationmark.triangle")
                    } description: {
                        Text(error)
                    } actions: {
                        Button("Retry") {
                            Task {
                                await viewModel.loadStudents()
                            }
                        }
                    }
                    
                } else if viewModel.students.isEmpty {
                    ContentUnavailableView(
                        "No Students",
                        systemImage: "person.slash"
                    )
                    
                } else {
                    List(viewModel.students) { student in
                        NavigationLink {
                            StudentDetailView(
                                student: student,
                                viewModel: viewModel
                            )
                        } label: {
                            HStack(spacing: 12) {
                                AsyncImage(url: URL(string: student.imageURL)) { phase in
                                    switch phase {
                                    case .empty:
                                        Image(systemName: "person.crop.circle.fill")
                                            .resizable()
                                            .scaledToFit()
                                            .foregroundStyle(.gray)
                                        
                                    case .success(let image):
                                        image
                                            .resizable()
                                            .scaledToFill()
                                        
                                    case .failure:
                                        Image(systemName: "person.crop.circle.fill")
                                            .resizable()
                                            .scaledToFit()
                                            .foregroundStyle(.gray)
                                        
                                    @unknown default:
                                        EmptyView()
                                    }
                                }
                                .frame(width: 50, height: 50)
                                .clipShape(Circle())
                                
                                VStack(alignment: .leading) {
                                    Text(student.name)
                                        .font(Font.headline)
                                    Text(student.course)
                                        .font(Font.subheadline)
                                        .foregroundStyle(.secondary)
                                    Text(student.description)
                                        .font(Font.footnote)
                                        .foregroundStyle(.secondary)
                                }
                            }
                        }
                        .task {
                            print(student.id)
                        }
                    } //List
                    
                }
                  
            }
            .navigationTitle(Text("ST University"))
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                      showAddStudent = true
                    } label: {
                        Image(systemName: "plus")
                            .foregroundStyle(.blue)
                    }
                }
            } //toolbar
            .sheet(isPresented: $showAddStudent) {
                AddStudentView(viewModel: viewModel)
            }
            .task {
                    await viewModel.loadStudents()
            }
        }
        
        
       
        
    }
}

#Preview {
    StudentListView(viewModel: StudentViewModel(repository: MockStudentRepository()))
}
