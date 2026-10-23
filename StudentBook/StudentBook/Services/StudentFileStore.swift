//
//  StudentFileStore.swift
//  StudentBook
//
//  Created by Sudheshna Tholikonda on 23/10/26.
//

import Foundation

struct StudentFileStore {

    private var fileURL: URL {
        FileManager.default.urls(
            for: .documentDirectory,
            in: .userDomainMask
        )[0]
        .appendingPathComponent("students.json")
    }

    func save(_ students: [Student]) throws {
        let data = try JSONEncoder().encode(students)
        try data.write(to: fileURL, options: .atomic)
    }
//Atomic: The data is written to an auxiliary file before replacing the destination, reducing the risk of a partially written file.
  
    func load() throws -> [Student] {
        guard FileManager.default.fileExists(
            atPath: fileURL.path
        ) else {
            return []
        }

        let data = try Data(contentsOf: fileURL)
        return try JSONDecoder().decode(
            [Student].self,
            from: data
        )
    }
    // "We use JSONEncoder to serialize Swift Codable models into JSON-formatted Data so they can be stored in a file and later reconstructed using JSONDecoder."
}
