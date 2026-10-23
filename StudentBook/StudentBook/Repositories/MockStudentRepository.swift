//
//  MockStudentRepository.swift
//  StudentBook
//
//  Created by Sudheshna Tholikonda on 20/10/26.
//

import Foundation

struct MockStudentRepository: StudentRepository {
    

    func fetchStudents() async throws -> [Student] {
        MockStudentData.students
    }
    
    func saveStudents(_ students: [Student]) async throws {
        // Mock implementation: does not persist data
    }
}
