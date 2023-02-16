//
//  Diary.swift
//  DailyNoteClone1
//
//  Created by juri on 2023/02/05.
//

import SwiftUI

var dateTime: String {
    let formatter = DateFormatter()
    
    formatter.dateFormat = "yyyy.MM.dd"
    return formatter.string(from: Date())
}

class Diary: Identifiable, ObservableObject{
    let id: UUID
    @Published var content: String
    let insertDate: String
    
    init(content: String, insertDate: String = dateTime) {
        id = UUID()
        self.content = content
        self.insertDate = insertDate
    }
}

extension Diary: Hashable {
    
    static func == (lhs: Diary, rhs: Diary) -> Bool {
            return lhs.content == rhs.content && lhs.insertDate == rhs.insertDate
        }
    
    func hash(into hasher: inout Hasher) {
            hasher.combine(content)
            hasher.combine(insertDate)
        }
}
