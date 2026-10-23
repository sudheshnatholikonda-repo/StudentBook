//
//  MockStudentData.swift
//  StudentBook
//
//  Created by Sudheshna Tholikonda on 18/10/26.
//

import Foundation

enum MockStudentData {
    static let students: [Student] = [
        Student(
            id: 1,
            name: "John",
            course: "iOS Development",
            imageURL: "https://i.pravatar.cc/150?img=12",
            description: "John is learning Swift and SwiftUI."
        ),
        Student(
            id: 2,
            name: "Emma",
            course: "UI/UX Design",
            imageURL: "https://i.pravatar.cc/150?img=47",
            description: "Emma loves designing mobile applications."
        ),
        Student(
            id: 3,
            name: "Alex",
            course: "Computer Science",
            imageURL: "https://i.pravatar.cc/150?img=13",
            description: "Alex enjoys software development."
        )
    ]
}
