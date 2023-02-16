//
//  NoteBookView.swift
//  DailyNoteClone1
//
//  Created by juri on 2023/01/29.
//

//list count 일기 수 처리

import SwiftUI
import TextFieldAlert

struct NoteBookVieWModel: Identifiable {
    let id = UUID()
    var icon: Image = Image(systemName: "checkmark")
    var name: String
    var count: Int = 0
}

struct NoteRow: View {
    
    @State private var showingAlert = false
    @State private var noteName = "기본 노트북"
    var note: NoteBookVieWModel
    
    var body: some View {
        HStack {
            
            Image(systemName: "checkmark")
            Text(note.name)
            Spacer()
            Text(String(note.count))
            
        }
        .swipeActions {
            
            Button(action: {
                //삭제
            }) {
                Image(systemName: "trash")
            }
            .tint(.red)
            Button(action: {
                // alert
                showingAlert = true
                
            }) {
                Image(systemName: "pencil")
            }
            .tint(.gray)
            
        }
        .textFieldAlert(
            title: "노트북",
            textFields: [
                .init(text: $noteName)
            ],
            actions: [
                .init(title: "OK")
            ],
            isPresented: $showingAlert
        )
        
        
//        .alert(isPresented: $showingAlert) {
//            Alert(
//                title: Text("노트북"),
//                primaryButton: .default(Text("취소"),
//                                       action: {}),
//                secondaryButton: .default(Text("확인"),
//                                          action: {})
//
//
//                  )
//        }
        
    }
}


struct NoteBookView: View {
    
    let note1 = NoteBookVieWModel(name: "기본 노트북")
    
    var body: some View {
        
        List {
            NoteRow(note: note1)
        }
        
        .navigationTitle("노트북")
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: BackButton())
        

    }
    
}

struct NoteBookView_Previews: PreviewProvider {
    static var previews: some View {
        NoteBookView()
    }
}
