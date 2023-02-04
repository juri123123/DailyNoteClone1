//
//  NoteBookView.swift
//  DailyNoteClone1
//
//  Created by juri on 2023/01/29.
//

//list count 일기 수 처리 

import SwiftUI

struct NoteBookVieWModel: Identifiable {
    let id = UUID()
    var icon: Image = Image(systemName: "checkmark")
    var name: String
    var count: Int = 0
}

struct NoteRow: View {
    
    var note: NoteBookVieWModel
    
    var body: some View {
        HStack {
            
            Image(systemName: "checkmark")
            Text(note.name)
            Spacer()
            Text(String(note.count))
            
        }
    }
}


struct NoteBookView: View {
    
    let note1 = NoteBookVieWModel(name: "노트북")
    
    var body: some View {
        
        List {
            NoteRow(note: note1)
        }
        
        .navigationTitle("노트북")
        .navigationBarHidden(false)
        
        
    }
    
}

struct NoteBookView_Previews: PreviewProvider {
    static var previews: some View {
        NoteBookView()
    }
}
