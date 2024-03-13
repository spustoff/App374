//
//  ExpensesView.swift
//  App374
//
//  Created by IGOR on 05/03/2024.
//

import SwiftUI

struct ExpensesView: View {
    
    @StateObject var viewModel = ExpensesViewModel()
    
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                VStack {
                    
                    Spacer()
                    
                    Text("Expenses")
                        .foregroundColor(.black)
                        .font(.system(size: 18, weight: .regular))
                        .padding()
                }
                .frame(maxWidth: .infinity)
                .frame(height: 100)
                .background(Color("prim"))
                .ignoresSafeArea()
                
                if viewModel.expenses.isEmpty {
                    
                    VStack {
                        
                        Text("No expenses")
                            .foregroundColor(.black)
                            .font(.system(size: 24, weight: .regular))
                        
                        Text("Add an expense with the plus button ")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                    }
                    .frame(maxHeight: .infinity)
                    
                } else {
                    
                    ScrollView(.vertical, showsIndicators: false ) {
                        
                        ForEach(viewModel.expenses, id: \.self) { index in
                            
                            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], content: {
                                
                                VStack(spacing: 10) {
                                    
                                    Text(index.exDate ?? "")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 12, weight: .regular))
                                    
                                    Text(index.exTitle ?? "")
                                        .foregroundColor(.black)
                                        .font(.system(size: 18, weight: .regular))
                                    
                                    Text(index.exDetails ?? "")
                                        .foregroundColor(.blue)
                                        .font(.system(size: 13, weight: .regular))
                                    
                                    Text("$\(index.exCost ?? "")")
                                        .foregroundColor(.black)
                                        .font(.system(size: 26, weight: .regular))
                                }
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(Rectangle().fill(Color("prim2")))
                            })
                            .padding()
                        }
                    }
                }
            }
        }
        .onAppear{
            
            viewModel.fetchExpenses()
        }
    }
}

#Preview {
    ExpensesView()
}
