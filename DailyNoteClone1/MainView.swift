//
//  MainView.swift
//  DailyNoteClone1
//
//  Created by juri on 2023/01/28.
//

import SwiftUI

struct MainView: View {
    
    
    @State var showMenu = false
    
    var body: some View{
        GeometryReader { geometry in
            
            MainMenuView(showMenu: self.$showMenu)
                .frame(width: geometry.size.width, height: geometry.size.height)
                .onTapGesture {
                    if self.showMenu {
                        self.showMenu = false
                    }
                }
            if self.showMenu {
                MenuView()
                    .frame(width: geometry.size.width * 3/5)
                    .offset(x: self.showMenu ? 0 : -300, y: 0)
                    .background(Color.mint)
                    .opacity(0.7)
            }
        }//GeometryReader
    }
    
    
    
}

struct MainMenuView : View {
    
    @EnvironmentObject var store: DiaryStore
    
    @Binding var showMenu: Bool
    @State var diaryText: String = "작성된 글이 없습니다"
    @State var today = Date()
    
    @State var showCalendar = false
    
    
    var dateTime: String {
        let formatter = DateFormatter()
        
        formatter.dateFormat = "yyyy.MM.dd"
        return formatter.string(from: Date())
    }
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    VStack(alignment:.leading) {
                        
                        //우측 상단 오늘 날짜 표시
                        ZStack(alignment: .trailing) {
                            Divider()
                                .frame(height: 2)
                                .background(Color.gray)
                            
                            Button(action: {
                                if self.showCalendar {
                                    self.showCalendar = false
                                } else {
                                    self.showCalendar = true
                                }
                            }) {
                                Text(dateTime)
                                    .frame(width:100)
                                    .background(.white)
                                    .padding(.trailing)
                                    .foregroundColor(.black)
                            }
                            
                        }
                        
                        if self.showCalendar {
                            DatePicker(diaryText, selection: $today, displayedComponents: [.date])
                                .datePickerStyle(GraphicalDatePickerStyle())
                                .frame(height: geometry.size.height/2)
                                .offset(y: 10)
                        }
                        
                        //datepicker에서 날짜 선택 시 버튼 등 바꾸기 구현해야함
                        NavigationLink(destination: WriteView()) {
                            VStack() {
                                ForEach(store.list, id: \.self) { diary in
                                    if diary.insertDate == dateTime {
                                        Text(diary.content)
                                            .foregroundColor(.black)
                                            .padding()
                                    }
                                    
                                }
                      
                            }
                            .contentShape(Rectangle())
                        }
                    }//VStack
                } //ZStack
                
            }//geometryreader
            
            //navigationbar 숨기기
            .navigationTitle("")
            .navigationBarHidden(showMenu)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button  {
                        withAnimation {
                            if !showMenu {
                                showMenu = true
                            }
                        }
                    } label: {
                        Image(systemName: "ellipsis")
                            .foregroundColor(.gray)
                            .font(.system(size: 25))
                        
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink {
                        NoteBookView()
                    } label: {
                        Image(systemName: "note")
                            .foregroundColor(.gray)
                            .font(.system(size: 25))
                        
                    }
                }
            }
            
        }//NavigationView
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(DiaryStore())
    }
}
