//
//  AddBook.swift
//  App374
//
//  Created by IGOR on 06/03/2024.
//

import SwiftUI

struct AddBook: View {
 
    @StateObject var viewModel: BooksViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                VStack {
                    
                    Spacer()
                    
                    ZStack {
                        
                        Text("Add Book")
                            .foregroundColor(.black)
                            .font(.system(size: 18, weight: .regular))
                            .padding()
                     
                        HStack {
                            
                            Button(action: {
                                
                                router.wrappedValue.dismiss()
                                
                            }, label: {
                                
                                Image(systemName: "chevron.left")
                                    .foregroundColor(.black)
                                    .font(.system(size: 18, weight: .medium))
                                    .padding(.horizontal)
                            })
                            
                            Spacer()
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .frame(height: 100)
                .background(Color("prim"))
                .ignoresSafeArea()
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(alignment: .leading, spacing: 15) {
                        
                        HStack {
                            
                            Text("Book")
                                .foregroundColor(.black)
                                .font(.system(size: 14, weight: .regular))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Add title")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.rBook.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.rBook)
                                    .foregroundColor(.black)
                                    .font(.system(size: 14, weight: .regular))
                                
                            })
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 0).fill(.gray.opacity(0.15)))
                     
                        HStack {
                            
                            Text("Author")
                                .foregroundColor(.black)
                                .font(.system(size: 14, weight: .regular))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Add author")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.rAuthor.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.rAuthor)
                                    .foregroundColor(.black)
                                    .font(.system(size: 14, weight: .regular))
                                
                            })
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 0).fill(.gray.opacity(0.15)))

                        HStack {
                            
                            Text("Plot")
                                .foregroundColor(.black)
                                .font(.system(size: 14, weight: .regular))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Write down a book plot")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.rPlot.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.rPlot)
                                    .foregroundColor(.black)
                                    .font(.system(size: 14, weight: .regular))
                                
                            })
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 0).fill(.gray.opacity(0.15)))
                    }
                }
                .padding(.horizontal)
                
                Button(action: {
                    
                    viewModel.addRBook()
                    
                    viewModel.rBook = ""
                    viewModel.rAuthor = ""
                    viewModel.rPlot = ""
                    
                    viewModel.fetchRBooks()
                    
                    router.wrappedValue.dismiss()
                    
                }, label: {
                    
                    Text("Add")
                        .foregroundColor(.black)
                        .font(.system(size: 14, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(Rectangle().fill(Color("prim")))
                })
                .disabled(viewModel.rBook.isEmpty || viewModel.rAuthor.isEmpty || viewModel.rPlot.isEmpty ? true : false)
                .opacity(viewModel.rBook.isEmpty || viewModel.rAuthor.isEmpty || viewModel.rPlot.isEmpty ? 0.5 : 1)
                .padding()
            }
        }
    }
}

#Preview {
    AddBook(viewModel: BooksViewModel())
}
