//
//  AddView.swift
//  App374
//
//  Created by IGOR on 05/03/2024.
//

import SwiftUI

struct AddView: View {
    
    var body: some View {
        
        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                NavigationLink(destination: {
                    
                    AddExpense(viewModel: ExpensesViewModel())
                        .navigationBarBackButtonHidden()
                    
                }, label: {
                    
                    Text("New Expense")
                        .foregroundColor(.black)
                        .font(.system(size: 16, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("prim")))
                        .padding()
                })
                
                NavigationLink(destination: {
                    
                    AddBook(viewModel: BooksViewModel())
                        .navigationBarBackButtonHidden()
                    
                }, label: {
                    
                    Text("New Book")
                        .foregroundColor(.black)
                        .font(.system(size: 16, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("prim")))
                        .padding()
                })
                
                NavigationLink(destination: {
                    
                    AddCourse(viewModel: CoursesViewModel())
                        .navigationBarBackButtonHidden()
                    
                }, label: {
                    
                    Text("New Course")
                        .foregroundColor(.black)
                        .font(.system(size: 16, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("prim")))
                        .padding()
                })
                
                Spacer()
            }
        }
    }
}

#Preview {
    AddView()
}
