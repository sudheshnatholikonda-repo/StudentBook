//
//  StudentRepository.swift
//  StudentBook
//
//  Created by Sudheshna Tholikonda on 20/10/26.
//

import Foundation

protocol StudentRepository {
    func fetchStudents() async throws -> [Student]
    func saveStudents(_ students: [Student]) async throws
}
