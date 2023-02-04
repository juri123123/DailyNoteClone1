//
//  MenuView.swift
//  DailyNoteClone1
//
//  Created by juri on 2023/01/28.
//

import SwiftUI

struct MenuView: View {
    
    @State private var showSearchView: Bool = false
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                NavigationLink (destination: SearchView()){
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .imageScale(.large)
                        Text("검색")
                            .foregroundColor(.black)
                            .font(.headline)
                    }
                }
                
                .padding(.top, 50)
                HStack {
                    Image(systemName: "list.bullet")
                        .foregroundColor(.gray)
                        .imageScale(.large)
                    Text("모아보기")
                        .foregroundColor(.black)
                        .font(.headline)
                }
                .padding(.top, 10)
                HStack {
                    Image(systemName: "photo")
                        .foregroundColor(.gray)
                        .imageScale(.large)
                    Text("사진")
                        .foregroundColor(.black)
                        .font(.headline)
                }
                .padding(.top, 10)
                Spacer()
                
            }
            
        }//VStack
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
