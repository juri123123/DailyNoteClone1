//
//  SearchView.swift
//  DailyNoteClone1
//
//  Created by juri on 2023/02/04.
//

import SwiftUI

struct SearchView: View {
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Text("내용 검색")
            }
            .background(Color.white)
            .frame(width: geometry.size.width, height: geometry.size.height)
        }
        
       
    }
}

struct SearchView_Preview: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
