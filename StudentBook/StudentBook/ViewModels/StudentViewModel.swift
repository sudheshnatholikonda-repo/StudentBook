//
//  StudentViewModel.swift
//  StudentBook
//
//  Created by Sudheshna Tholikonda on 19/10/26.
//

import Foundation
import Observation

@MainActor
@Observable
final class StudentViewModel {
   
    var students: [Student] = []
    var isLoading = false
    var errorMessage: String?

    private let repository: any StudentRepository

    init(repository: any StudentRepository) {
        self.repository = repository
      
    }
    
    
    private(set) var favouriteIDs: Set<Int> = []
    
    func isFavourite(_ student: Student) -> Bool {
            favouriteIDs.contains(student.id)
        }

    func toggleFavourite(for student: Student) {
        if favouriteIDs.contains(student.id) {
            favouriteIDs.remove(student.id)
        } else {
            favouriteIDs.insert(student.id)
        }
    }
    
    
    func loadStudents() async {
        isLoading = true
        errorMessage = nil

        defer {
            isLoading = false
        }

        do {
            students = try await repository.fetchStudents()
        } catch is CancellationError {
            // The task was cancelled.
        } catch {
            errorMessage = error.localizedDescription
        }
    }
    
    func addStudent(
        name: String,
        course: String,
        description: String
    ) async throws {
        let nextID = (students.map(\.id).max() ?? 0) + 1

        let newStudent = Student(
            id: nextID,
            name: name,
            course: course,
            imageURL: "",
            description: description
        )

        var updatedStudents = students
           updatedStudents.append(newStudent)

           try await repository.saveStudents(updatedStudents)

           students = updatedStudents
    }
}
