//
//  NoteBookView.swift
//  DailyNoteClone1
//
//  Created by juri on 2023/01/29.
//

import SwiftUI

struct NoteBookView: View {
    
    @Binding var isNavigationBarHidden: Bool
    
    init(isNavigationBarHidden: Binding<Bool> = .constant(false)) {
        _isNavigationBarHidden = isNavigationBarHidden
    }
    
    var body: some View {
        List {
            Text("first")
        }
        
        .navigationTitle("노트북")
//        .navigationBarHidden(self.isNavigationBarHidden)
        .navigationBarHidden(false)
        .onAppear{
            self.isNavigationBarHidden = false
        }
        
    }//navigationview
    
}

struct NoteBookView_Previews: PreviewProvider {
    static var previews: some View {
        NoteBookView()
    }
}
