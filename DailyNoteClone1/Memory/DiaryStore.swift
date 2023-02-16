//
//  DiaryStore.swift
//  DailyNoteClone1
//
//  Created by juri on 2023/02/05.
//

import SwiftUI

//목록 저장

class DiaryStore: ObservableObject {
    @Published var list: [Diary]
//    @Published var diarys: Diary
    
    var dateTime: String {
        let formatter = DateFormatter()
        
        formatter.dateFormat = "yyyy.MM.dd"
        return formatter.string(from: Date())
    }
    
    init() {
        list = [
            Diary(content: "오늘의 일기", insertDate: {
                let formatter = DateFormatter()
                
                formatter.dateFormat = "yyyy.MM.dd"
                return formatter.string(from: Date())
            }())
//            Diary(content: "내일의 일기", insertDate: Date.now.addingTimeInterval(3600 * +24))
        ]
    }
    
    func insert(diary: String) {
        list.insert(Diary(content: diary), at: 0)
    }
    
    func update(diary: Diary?, content: String) {
        guard let diary = diary else {
            return
        }

        diary.content = content
    }
    
    func delete(diary: Diary){
        list.removeAll {
            $0.id == diary.id
        }
    }
    
    func delete(set: IndexSet) {
        for index in set {
            list.remove(at: index)
        }
    }
    
}
