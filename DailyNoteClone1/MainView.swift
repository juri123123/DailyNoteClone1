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
            //사이드메뉴 활성화 됐을 때 MainView 터치 시 비활성화하기 구현해야함
            MainMenuView(showMenu: self.$showMenu)
                .frame(width: geometry.size.width, height: geometry.size.height)
                .onTapGesture {
                    if self.showMenu {
                        self.showMenu = false
                    }
                }
            if self.showMenu {
                MenuView()
                    .frame(width: geometry.size.width/2)
                    .background(Color.mint)
                    .opacity(0.5)
            }
            
            
        }//GeometryReader
    }
    

    
}

struct MainMenuView : View {
    
    @Binding var showMenu: Bool
    @State var diaryText: String = "작성된 글이 없습니다"
    @State var today = Date()
    
    @State var isNavigationBarHidden = false
    
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
                    VStack() {
                        HStack {
                            //메뉴
                            Button(action: {
                                withAnimation{
                                    self.showMenu = true
                                }
                            }) {
                                Image(systemName: "ellipsis")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 25))
                            }.padding()
                            
                            Spacer()
                            
                            //노트북 뷰로 이동
                            NavigationLink(destination: NoteBookView(isNavigationBarHidden: self.$isNavigationBarHidden)) {
                                Image(systemName: "note")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 25))
                                    .padding()
                            }
                                           
        
                        } //HStack
                        
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
                                .frame(height: geometry.size.height/6)
                                .offset(y: 100)
                        }
                        
                        //datepicker에서 날짜 선택 시 버튼 등 바꾸기 구현해야함
                        //text가 왼쪽상단에 정렬되도록 어떻게 하는지...
                        //view animation 어플과 같게 어떻게?
                        //text tap이 아니라 zstack (=view) tap 시 view 이동하는 방법???
                        
                        
                        NavigationLink(destination: WriteView()) {
                            Text(diaryText)
                                .foregroundColor(.black)
                        }
                        
                        .frame(height: geometry.size.height)
                        
                    }//VStack
                } //ZStack

            }//geometryreader
            
            //navigationbar 숨기기
            .navigationTitle("")
            .navigationBarHidden(self.isNavigationBarHidden)
            .onAppear{
                self.isNavigationBarHidden = true
            }
            
        }//NavigationView
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
