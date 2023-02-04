//
//  WriteView.swift
//  DailyNoteClone1
//
//  Created by juri on 2023/01/29.
//

import SwiftUI

struct WriteView: View{
    
    @State var placeholderText: String = "글을 입력해 주세요"
    @State var content: String = ""
    
    var dateTime: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy.MM.dd"
        return formatter.string(from: Date())
    }
    
    var body: some View{
            GeometryReader { geometry in
                
            VStack {
                HStack {
                    Spacer()
                    Text(dateTime)
                        .font(.system(size: 23))
                        .underline()
                    Spacer()
                        //작성 취소
                    Button(action:{
                        
                    }) {
                        Image(systemName: "multiply")
                            .foregroundColor(.gray)
                            .font(.system(size: 25))
                    }//button
                }//hstack
                .padding()
                    
                    //항상 키보드가 위로 올라와 있도록 해아함!
                    //키보드 위에 버튼 (시계, 갤러리, 완료) 만들어야함!
                ZStack{
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
            }//vstack
        } //GeometryReader
//            .navigationBarHidden(true)
    }
}

struct WriteView_Previews: PreviewProvider {
    static var previews: some View {
        WriteView()
    }
}
