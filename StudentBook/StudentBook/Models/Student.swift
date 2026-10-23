//
//  Student.swift
//  StudentBook
//
//  Created by Sudheshna Tholikonda on 16/10/26.
//

import Foundation

struct Student: Identifiable, Codable {
       let id: Int
       let name: String
       let course: String
       let imageURL: String
       let description: String
}
