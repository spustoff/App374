//
//  BooksView.swift
//  App374
//
//  Created by IGOR on 05/03/2024.
//

import SwiftUI

struct BooksView: View {
    
    @StateObject var viewModel = BooksViewModel()
    
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                VStack {
                    
                    Spacer()
                    
                    ZStack {
                        
                        Text("Books")
                            .foregroundColor(.black)
                            .font(.system(size: 18, weight: .regular))
                            .padding()
                     
                        HStack {
                            
                            Spacer()
                            
                            Button(action: {
                                
                                withAnimation(.spring()) {
                                    
                                    viewModel.isAddBook = true
                                }
                                
                            }, label: {
                                
                                Image(systemName: "clock")
                                    .foregroundColor(.black)
                                    .font(.system(size: 16, weight: .regular))
                            })
                            .padding(.horizontal)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .frame(height: 100)
                .background(Color("prim"))
                .ignoresSafeArea()
                
                if viewModel.rbooks.isEmpty {
                    
                    VStack {
                        
                        Text("No books")
                            .foregroundColor(.black)
                            .font(.system(size: 24, weight: .regular))
                        
                        Text("Add an expense with the plus button ")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                    }
                    .frame(maxHeight: .infinity)
                    
                } else {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        LazyVStack {
                            
                            ForEach(viewModel.rbooks, id: \.self) { index in
                                
                                VStack(alignment: .leading, spacing: 10) {
                                    
                                    Text(index.rBook ?? "")
                                        .foregroundColor(.black)
                                        .font(.system(size: 18, weight: .medium))
                                    
                                    Text(index.rAuthor ?? "")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 14, weight: .regular))
                                    
                                    Text(index.rPlot ?? "")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 14, weight: .regular))
                                    
                                    Spacer()
                                    
                                    Button(action: {
                                        
                                        withAnimation(.spring()) {
                                            
                                            viewModel.isAddRBook = true
                                        }
                                        
                                    }, label: {
                                        
                                        Text("Mark as read")
                                            .foregroundColor(.black)
                                            .font(.system(size: 14, weight: .regular))
                                            .frame(maxWidth: .infinity)
                                            .frame(height: 50)
                                            .background(Rectangle().fill(.white))
                                    })
                                }
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .frame(height: 350)
                                .background(Rectangle().fill(Color("prim2")))
                            }
                        }
                        .padding()
                    }
                }
            }
        }
        .onAppear {
            
            viewModel.fetchRBooks()
        }
    }
}

#Preview {
    BooksView()
}
