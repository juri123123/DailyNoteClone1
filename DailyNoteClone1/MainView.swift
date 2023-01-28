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
            if self.showMenu {
                MenuView()
                    .frame(width: geometry.size.width/2)
                    .background(Color.mint)
            }
        }//GeometryReader
    }
    
}

struct MainMenuView : View {
    @Binding var showMenu: Bool
    @State var placeholderText: String = "작성된 글이 없습니다"
    @State var content: String = ""
    
    var dateTime: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy.MM.dd"
        return formatter.string(from: Date())
    }
    
    var body: some View {
        
        ZStack(alignment: .leading) {
            VStack() {
                HStack() {
                    Button(action: {
                        withAnimation{
                            self.showMenu = true
                        }
                    }) {
                        Image(systemName: "ellipsis")
                            .foregroundColor(.gray)
                    }.padding()
                    Spacer()
                    Button(action: {
                        //note view로 이동
                        withAnimation{
                            self.showMenu = true
                        }
                    }) {
                        Image(systemName: "note")
                            .foregroundColor(.gray)
                    }.padding()
                    
                } //HStack
                ZStack(alignment: .trailing) {
                    Divider()
                        .frame(height: 2)
                        .background(Color.gray)
                    
                    //버튼으로 바꿔서 calender view 햄버거 뷰로 만들기 (사이드메뉴와 비슷할듯?!)
                    Text(dateTime)
                        .frame(width:100)
                        .background(.white)
                        .padding(.trailing)
                        
                }
                //터치 시 view 이동하는 방법으로 바꿔야 함.... ㅠ
                ZStack {
                    if self.content.isEmpty {
                        TextEditor(text: $placeholderText)
                            .font(.body)
                            .padding()
                    }
                    TextEditor(text: $content)
                        .font(.body)
                        .opacity(self.content.isEmpty ? 0.25 : 1)
                        .padding()
                }
                Spacer()
                Text("")
            }//VStack
        } //ZStack
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
