//
//  ReadedBooksView.swift
//  App374
//
//  Created by IGOR on 07/03/2024.
//

import SwiftUI

struct ReadedBooksView: View {
    
    @StateObject var viewModel = BooksViewModel()
    @Environment(\.presentationMode) var router
    
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                Text("Read books")
                    .foregroundColor(.black)
                    .font(.system(size: 18, weight: .regular))
                
                if viewModel.books.isEmpty {
                    
                    VStack {
                        
                        Text("No Books")
                            .foregroundColor(.black)
                            .font(.system(size: 20, weight: .regular))
                        
                    }
                    .frame(maxHeight: .infinity)
                    
                } else {
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    LazyVStack {
                        
                        ForEach(viewModel.books, id: \.self) { index in
                            
                            VStack(spacing: 10) {
                                
                                Text("Reboot\(index.bBook ?? "")")
                                    .foregroundColor(.black)
                                    .font(.system(size: 18, weight: .regular))
                                
                                Text(index.bAuthor ?? "")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                            }
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(Rectangle().fill(Color("prim2")))
                        }
                    }
                }
            }
            }
            .padding()
        }
        .onAppear {
            
            viewModel.fetchBooks()
        }
    }
}

#Preview {
    ReadedBooksView()
}
