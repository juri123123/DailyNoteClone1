//
//  SearchView.swift
//  DailyNoteClone1
//
//  Created by juri on 2023/02/04.
//
// 내용 검색 로직 해야함

import SwiftUI

struct SearchView: View {
    
    @State var searchText = ""
    
    var body: some View {
        GeometryReader { geometry in
            
            VStack {
                HStack {
                    BackButton()
                        .padding()
                    TextField("내용 검색", text: $searchText)
                        .foregroundColor(.primary)
                    
                    if !searchText.isEmpty {
                        Button(action: {
                            self.searchText = ""
                        }) {
                            Image(systemName: "x.circle")
                                .padding()
                        }
                    } else {
                        EmptyView()
                    }
                }//Hstack
                
                //검색 결과 리스트업
                
            }//VStack
        }
        .navigationBarHidden(true)
        
        
       
    }
}

struct SearchView_Preview: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
