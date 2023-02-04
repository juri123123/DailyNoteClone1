//
//  WriteView.swift
//  DailyNoteClone1
//
//  Created by juri on 2023/01/29.
//

// 체크 버튼 클릭 시 글 저장
// x 버튼 클릭 시 저장하지 않고 전 화면 (메인) 으로 돌아가기

import SwiftUI
import PhotosUI

//갤러리에 접근
struct PhotoPicker: UIViewControllerRepresentable {
  let configuration: PHPickerConfiguration
  @Binding var isPresented: Bool
  func makeUIViewController(context: Context) -> PHPickerViewController {
    let controller = PHPickerViewController(configuration: configuration)
    controller.delegate = context.coordinator
    return controller
  }

  func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {}
  func makeCoordinator() -> Coordinator {
    Coordinator(self)
  }

  // Use a Coordinator to act as your PHPickerViewControllerDelegate
  class Coordinator: PHPickerViewControllerDelegate {
    private let parent: PhotoPicker

    init(_ parent: PhotoPicker) {
      self.parent = parent
    }

    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
      print(results)
      parent.isPresented = false // Set isPresented to false because picking has finished.
    }
  }
}

struct WriteView: View{
    
    @State var placeholderText: String = "글을 입력해 주세요"
    @State var content: String = ""
    @State var showingSheet = false
    @State var showImagePicker: Bool = false
//    @State var item: Photos
    
    var dateTime: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy.MM.dd"
        return formatter.string(from: Date())
    }
    
    var time: String {
        let formatter2 = DateFormatter()
        formatter2.dateFormat = "HH:mm"
        return formatter2.string(from: Date())
    }

    var body: some View{
        
        GeometryReader { geometry in
            NavigationView {
                VStack {
                    HStack {
                        Spacer()
                        Text(dateTime)
                            .font(.system(size: 23))
                            .underline()
                        Spacer()
                        //작성 취소
                        Button(action: {
                            self.showingSheet = true
                        }) {
                            Image(systemName: "multiply")
                                .foregroundColor(.gray)
                                .font(.system(size: 25))
                        }
                        .confirmationDialog("변경 사항을 취소 하시겠습니까?", isPresented: $showingSheet) {
                            Button("저장하지 않기", role: .destructive) {}
                        } message: {
                            Text("변경 사항을 취소 하시겠습니까?")
                        }
                    }//hstack
                    .padding()
           
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
                .navigationBarHidden(true)
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        Button(action: {
                            self.content.append(time)
                        }) {
                            Image(systemName: "clock")
                                .foregroundColor(.black)
                        }
                        Button(action: {
                            //갤러리 열기
                            self.showImagePicker = true
                        }) {
                            Image(systemName: "camera")
                                .foregroundColor(.black)
                        }
                        Spacer()
                        Button(action: {
                            //저장과 키보드 내리기
                            
                        }) {
                            Image(systemName: "checkmark")
                                .foregroundColor(.black)
                        }
                        
                    }
                    
                }
                .sheet(isPresented: $showImagePicker, content: {
                      let configuration = PHPickerConfiguration(photoLibrary: PHPhotoLibrary.shared())
                      PhotoPicker(configuration: configuration, isPresented: $showImagePicker)
                    })
            }//NavigationView
        } //GeometryReader
                    .navigationBarHidden(true)
    }
}


struct WriteView_Previews: PreviewProvider {
    static var previews: some View {
        WriteView()
    }
}
