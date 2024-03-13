//
//  AddReadBook.swift
//  App374
//
//  Created by IGOR on 07/03/2024.
//

import SwiftUI

struct AddReadBook: View {
    
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
                        
                        Text("New read book")
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
                                
                            })
                            
                            Spacer()
                            
                            Button(action: {
                                
                                withAnimation(.spring()) {
                                    
                                    viewModel.isDelete = true
                                }
                                
                            }, label: {
                                
                                Image(systemName: "trash")
                                    .foregroundColor(.black)
                                    .font(.system(size: 18, weight: .medium))
                                
                            })
                        }
                        .padding(.horizontal)
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
                            
                            Text(viewModel.selectedRBook?.rBook ?? "")
                                .foregroundColor(.black)
                                .font(.system(size: 14, weight: .regular))
                            
                            Spacer()
                            
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 0).fill(.gray.opacity(0.15)))
                        
                        HStack {
                            
                            Text("Author")
                                .foregroundColor(.black)
                                .font(.system(size: 14, weight: .regular))
                            
                            
                            Text(viewModel.selectedRBook?.rAuthor ?? "")
                                .foregroundColor(.black)
                                .font(.system(size: 14, weight: .regular))
                            
                            Spacer()
                            
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 0).fill(.gray.opacity(0.15)))
                        
                        HStack {
                            
                            Text("Plot")
                                .foregroundColor(.black)
                                .font(.system(size: 14, weight: .regular))
                            
                            
                            Text(viewModel.selectedRBook?.rPlot ?? "")
                                .foregroundColor(.black)
                                .font(.system(size: 14, weight: .regular))
                            
                            Spacer()
                            
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 0).fill(.gray.opacity(0.15)))
                        
                        HStack {
                            
                            Text("Type")
                                .foregroundColor(.black)
                                .font(.system(size: 14, weight: .regular))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Paper or e-book")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.bType.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.bType)
                                    .foregroundColor(.black)
                                    .font(.system(size: 14, weight: .regular))
                                    .keyboardType(.decimalPad)
                                
                            })
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 0).fill(.gray.opacity(0.15)))
                        
                        HStack {
                            
                            Text("Time spent")
                                .foregroundColor(.black)
                                .font(.system(size: 14, weight: .regular))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("in hours")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.bTime.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.bTime)
                                    .foregroundColor(.black)
                                    .font(.system(size: 14, weight: .regular))
                                    .keyboardType(.decimalPad)
                                
                            })
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 0).fill(.gray.opacity(0.15)))
                        
                        HStack {
                            
                            Text("Notes")
                                .foregroundColor(.black)
                                .font(.system(size: 14, weight: .regular))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Write down your notes")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.bNotes.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.bNotes)
                                    .foregroundColor(.black)
                                    .font(.system(size: 14, weight: .regular))
                                    .keyboardType(.decimalPad)
                                
                            })
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 0).fill(.gray.opacity(0.15)))
                    }
                }
                .padding(.horizontal)
                
                Button(action: {
                    
                    viewModel.bBook = viewModel.selectedRBook?.rBook ?? ""
                    viewModel.bAuthor = viewModel.selectedRBook?.rAuthor ?? ""
                    viewModel.bPlot = viewModel.selectedRBook?.rPlot ?? ""
                    
                    viewModel.addBook()
                    
                    viewModel.bType = ""
                    viewModel.bTime = ""
                    viewModel.bNotes = ""
                    
                    viewModel.fetchBooks()
                    
                    router.wrappedValue.dismiss()
                    
                }, label: {
                    
                    Text("Add")
                        .foregroundColor(.black)
                        .font(.system(size: 14, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(Rectangle().fill(Color("prim")))
                })
                .disabled(viewModel.bType.isEmpty || viewModel.bTime.isEmpty || viewModel.bNotes.isEmpty ? true : false)
                .opacity(viewModel.bTime.isEmpty || viewModel.bType.isEmpty || viewModel.bNotes.isEmpty ? 0.5 : 1)
                .padding()
            }
        }
        .overlay(
            
            ZStack {
                
                Color.black.opacity(viewModel.isDelete ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDelete = false
                        }
                    }
                
                VStack {
                    
                    HStack {
                        
                        Spacer()
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isDelete = false
                            }
                            
                        }, label: {
                            
                            Image(systemName: "xmark")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .regular))
                        })
                    }
                    
                    Text("Delete card")
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .semibold))
                        .padding()
                    
                    Text("Are you sure you want to delete?")
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .regular))
                        .multilineTextAlignment(.center)
                    
                    Button(action: {
                        
                        CoreDataStack.shared.deleteBook(withBBook: viewModel.selectedRBook?.rBook ?? "", completion: {
                            
                            viewModel.fetchRBooks()
                        })
                        
                        router.wrappedValue.dismiss()
                        
                    }, label: {
                        
                        Text("Delete")
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .semibold))
                            .frame(maxWidth: .infinity)
                            .frame(height: 40)
                        
                    })
                    .padding(.top, 25)
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDelete = false
                        }
                        
                    }, label: {
                        
                        Text("Cancel")
                            .foregroundColor(.red)
                            .font(.system(size: 18, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 40)
                        
                    })
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(RoundedRectangle(cornerRadius: 20).fill(Color.black.opacity(0.8)))
                .padding()
                .offset(y: viewModel.isDelete ? 0 : UIScreen.main.bounds.height)
            }
        )
    }
}

#Preview {
    AddReadBook(viewModel: BooksViewModel())
}
