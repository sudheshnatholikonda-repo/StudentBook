//
//  AddStudentCell.swift
//  StudentBook
//
//  Created by Sudheshna Tholikonda on 21/10/26.
//

import SwiftUI


struct AddStudentCell: View {
    let title: String
    let placeholder: String
    @Binding var text: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
                    Text(title)

                    TextField(placeholder, text: $text)
                        .textFieldStyle(.plain)
                }
    }
}
