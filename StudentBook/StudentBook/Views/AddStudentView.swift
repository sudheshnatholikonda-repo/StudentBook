//
//  AddStudentView.swift
//  StudentBook
//
//  Created by Sudheshna Tholikonda on 21/10/26.
//

import SwiftUI

struct AddStudentView: View {
    @Environment(\.dismiss) private var dismiss
    
    let viewModel: StudentViewModel
    
    @State private var saveError: String?
    @State private var isSaving = false

    @State private var name = ""
    @State private var course = ""
    @State private var description = ""
    
    var body: some View {

        NavigationStack {
            Form {
                Section {
                    AddStudentCell(
                        title: "Student Name",
                        placeholder: "Name",
                        text: $name
                    )
                    
                    AddStudentCell(
                        title: "Course Name",
                        placeholder: "Course",
                        text: $course
                    )
                    
                    AddStudentCell(
                        title: "Description",
                        placeholder: "Description",
                        text: $description
                    )
                }
            }
            .navigationTitle("Add Student")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                                Button("Cancel") {
                                    dismiss()
                                }
                }

                ToolbarItem(placement: .topBarTrailing) {
                    Button("Save") {
                        Task {
                            isSaving = true
                            defer { isSaving = false }

                            do {
                                try await viewModel.addStudent(
                                    name: name,
                                    course: course,
                                    description: description
                                )

                                dismiss()
                            } catch {
                                saveError = error.localizedDescription
                            }
                        }
                    }
                    .disabled(
                        isSaving ||
                        name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ||
                        course.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
                    )
                }
            }
            .alert(
                "Unable to Save Student",
                isPresented: Binding(
                    get: { saveError != nil },
                    set: { if !$0 { saveError = nil } }
                )
            ) {
                Button("OK", role: .cancel) {
                    saveError = nil
                }
            } message: {
                Text(saveError ?? "")
            }
        }
        
    }
}

#Preview {
    AddStudentView(viewModel: StudentViewModel(repository: MockStudentRepository()))
}

