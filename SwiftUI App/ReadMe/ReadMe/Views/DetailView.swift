//
//  DetailView.swift
//  ReadMe
//
//  Created by Daesik on 11/26/20.
//
import class PhotosUI.PHPickerViewController
import SwiftUI

struct DetailView: View {
    @ObservedObject var book: Book
    @Binding var image: UIImage?
    @State var showingImagePicker = false
    @State var showingAlert = false
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 16) {
                BookmarkButton(book: book)
                TitleAndAuthorStack(
                    book: book,
                    titleFont: .title,
                    authorFont: .title2
                )
            }
            
            Divider()
                .padding(.vertical)
            
            TextField("Review…", text: $book.microReview)
            
            Divider()
                .padding(.vertical)
            
            VStack {
                Book.Image(
                    uiImage: image,
                    title: book.title,
                    cornerRadius: 16
                )
                .scaledToFit()
                
                let updateButton =
                    Button("Update Images…") {
                        showingImagePicker = true
                    }
                    .padding()
                
                if image != nil {
                    HStack {
                        Spacer()
                        
                        Button("Delete Image") {
                            showingAlert = true
                        }
                        .padding()
                        
                        Spacer()
                        
                        updateButton
                        
                        Spacer()
                        
                    }
                } else {
                    updateButton
                }
            }
            Spacer()
        }
        .padding()
        .sheet(isPresented: $showingImagePicker) {
            PHPickerViewController.View(image: $image)
        }
        .alert(isPresented: $showingAlert, content: {
            .init(
                title: .init("Delete image for \(book.title)?"),
                primaryButton: Alert.Button.destructive(.init("Delete")) { image = nil},
                secondaryButton: .cancel())
        })
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(
            book: .init(),
            image: .constant(nil)
        )
            .previewedInAllColorSchemes
    }
}
