//
//  ContentView.swift
//  ReadMe
//
//  Created by Daesik on 11/26/20.
//

import SwiftUI

struct ContentView: View {
    @State var addingNewBook = false
    @EnvironmentObject var library: Library
    
    var body: some View {
        
        NavigationView {
            List {
                Button {
                    addingNewBook = true
                }
                    label: {
                    Spacer()
                        
                    VStack(spacing: 6) {
                        Image(systemName: "book.circle")
                            .font(.system(size: 60))
                        Text("Add a new book")
                            .font(.title2)
                    }
                    Spacer()
                }
                .buttonStyle(BorderlessButtonStyle())
                .padding(.vertical, 8)
                .sheet(isPresented: $addingNewBook, content:
                    NewBookView.init
                )

                ForEach(library.sortedBooks) { book in
                    BookRow(book: book)
                }
            }
            .navigationBarTitle("My Library")
        }
    }
}

struct BookRow: View { //
    @ObservedObject var book: Book
    @EnvironmentObject var library: Library

    var body: some View {
        NavigationLink(
            destination: DetailView(book: book)
        ) {
            HStack {
                Book.Image(
                    uiImage: library.uiImages[book],
                    title: book.title,
                    size: 80,
                    cornerRadius: 12
                )
                
                VStack(alignment: .leading) {
                    TitleAndAuthorStack(
                        book: book,
                        titleFont: .title2,
                        authorFont: .title3
                    )
                    
                    if !book.microReview.isEmpty {
                        Spacer()
                        Text(book.microReview)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                }
                .lineLimit(1)
                
                Spacer()
                BookmarkButton(book: book)
                    .buttonStyle(BorderlessButtonStyle())
                // manual override for the button style.
            }
            .padding(.vertical, 8)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Library())
            .previewedInAllColorSchemes
    }
}
