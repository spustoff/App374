//
//  AddExpense.swift
//  App374
//
//  Created by IGOR on 05/03/2024.
//

import SwiftUI

struct AddExpense: View {
    
    @StateObject var viewModel: ExpensesViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                VStack {
                    
                    Spacer()
                    
                    ZStack {
                        
                        Text("Add expense")
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
                            
                            Text("Title")
                                .foregroundColor(.black)
                                .font(.system(size: 14, weight: .regular))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Add course title")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.exTitle.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.exTitle)
                                    .foregroundColor(.black)
                                    .font(.system(size: 14, weight: .regular))
                                
                            })
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 0).fill(.gray.opacity(0.15)))
                        
                        HStack {
                            
                            Text("Date")
                                .foregroundColor(.black)
                                .font(.system(size: 14, weight: .regular))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Date of purchase")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.exDate.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.exDate)
                                    .foregroundColor(.black)
                                    .font(.system(size: 14, weight: .regular))
                                
                            })
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 0).fill(.gray.opacity(0.15)))
                        
                        HStack {
                            
                            Text("Cost")
                                .foregroundColor(.black)
                                .font(.system(size: 14, weight: .regular))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("$")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.exCost.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.exCost)
                                    .foregroundColor(.black)
                                    .font(.system(size: 14, weight: .regular))
                                
                            })
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 0).fill(.gray.opacity(0.15)))
                        
                        HStack {
                            
                            Text("Details")
                                .foregroundColor(.black)
                                .font(.system(size: 14, weight: .regular))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Write down all detail info")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.exDetails.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.exDetails)
                                    .foregroundColor(.black)
                                    .font(.system(size: 14, weight: .regular))
                                
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
                                    .opacity(viewModel.exNotes.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.exNotes)
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
                    
                    viewModel.addExpense()
                    viewModel.fetchExpenses()
                    
                    router.wrappedValue.dismiss()
                    
                }, label: {
                    
                    Text("Add")
                        .foregroundColor(.black)
                        .font(.system(size: 14, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(Rectangle().fill(Color("prim")))
                })
                .disabled(viewModel.exTitle.isEmpty || viewModel.exDate.isEmpty || viewModel.exCost.isEmpty || viewModel.exDetails.isEmpty || viewModel.exNotes.isEmpty ? true : false)
                .opacity(viewModel.exTitle.isEmpty || viewModel.exDate.isEmpty || viewModel.exCost.isEmpty || viewModel.exDetails.isEmpty || viewModel.exNotes.isEmpty ? 0.5 : 1)
                .padding()
            }
        }
    }
}

#Preview {
    AddExpense(viewModel: ExpensesViewModel())
}
