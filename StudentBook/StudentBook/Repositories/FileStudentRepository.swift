//
//  FileStudentRepository.swift
//  StudentBook
//
//  Created by Sudheshna Tholikonda on 23/10/26.
//

import Foundation

struct FileStudentRepository: StudentRepository {

    private let fileStore = StudentFileStore()

    func fetchStudents() async throws -> [Student] {
        try fileStore.load()
    }

    func saveStudents(_ students: [Student]) async throws {
        try fileStore.save(students)
    }
}
