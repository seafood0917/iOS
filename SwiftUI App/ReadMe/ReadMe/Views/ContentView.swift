//
//  ContentView.swift
//  ReadMe
//
//  Created by Daesik on 11/26/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List(Library().sortedBooks, id: \.author) { book in
                BookRow(book: book)
            }
            .navigationBarTitle("My Library")
        }
    }
}

struct BookRow: View {
    let book: Book
    var body: some View {
        NavigationLink(
            destination: DetailView(book: book)
        ) {
            HStack {
                Book.Image(title: book.title, size: 80)
                
                TitleAndAuthorStack(book: book, titleFont: .title2, authorFont: .title3)
                    .lineLimit(1)
            }

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
