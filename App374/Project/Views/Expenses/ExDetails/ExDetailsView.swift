//
//  ExDetailsView.swift
//  App374
//
//  Created by IGOR on 07/03/2024.
//

import SwiftUI

struct ExDetailsView: View {

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
                        
                        Text(viewModel.selectedExpense?.exTitle ?? "")
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
                    
                    VStack(spacing: 10) {
                        
                        VStack(spacing: 14) {
                            
                            Text(viewModel.selectedExpense?.exDetails ?? "")
                                .foregroundColor(.black)
                                .font(.system(size: 26, weight: .regular))
                            
                            HStack {
                                
                                Text(viewModel.selectedExpense?.exDate ?? "")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 16, weight: .regular))
                                
                                Spacer()
                                
                                Text("$\(viewModel.selectedExpense?.exCost ?? "")")
                                    .foregroundColor(Color("prim3"))
                                    .font(.system(size: 22, weight: .regular))
                            }
                        }
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(Rectangle().fill(.gray.opacity(0.1)))
                        .padding(.horizontal)
                        
                        Text("Notes")
                            .foregroundColor(.black)
                            .font(.system(size: 18, weight: .regular))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal)
                        
                        Text(viewModel.selectedExpense?.exDetails ?? "")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
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
                        
                        CoreDataStack.shared.deleteExpenses(withExTitle: viewModel.selectedExpense?.exTitle ?? "", completion: {
                            
                            viewModel.fetchExpenses()
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
    ExDetailsView(viewModel: ExpensesViewModel())
}
