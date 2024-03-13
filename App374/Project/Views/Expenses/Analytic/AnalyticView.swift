//
//  AnalyticView.swift
//  App374
//
//  Created by IGOR on 07/03/2024.
//

import SwiftUI

struct AnalyticView: View {
    
    @StateObject var viewModel = ExpensesViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                Text("Expenses analytic")
                    .foregroundColor(.black)
                    .font(.system(size: 18, weight: .regular))
                    .padding(.bottom, 25)
                
                Menu(content: {
                    
                    ForEach(viewModel.currencies, id: \.self) { index in
                        
                        Button(action: {
                            
                            viewModel.currCur = index
                            
                        }, label: {
                            
                            Text(index)
                        })
                    }
                    
                }, label: {
                    
                    HStack {
                        
                        Text(viewModel.currCur)
                            .foregroundColor(.black)
                            .font(.system(size: 18, weight: .regular))
                     
                        Image(systemName: "chevron.down")
                            .foregroundColor(.black)
                            .font(.system(size: 18, weight: .regular))
                    }
                })
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(alignment: .leading, spacing: 10) {
                        
                        Text("+\(String(format: "%.f", Double(.random(in: 1...5)))).\(String(format: "%.f", Double(.random(in: 1...5))))\(String(format: "%.f", Double(.random(in: 1...5))))")
                            .foregroundColor(.green)
                            .font(.system(size: 14, weight: .regular))
                        
                        Text("$\(String(format: "%.f", Double(.random(in: 1...5)))).\(String(format: "%.f", Double(.random(in: 1...5))))\(String(format: "%.f", Double(.random(in: 1...5))))\(String(format: "%.f", Double(.random(in: 1...5))))\(String(format: "%.f", Double(.random(in: 1...5))))\(String(format: "%.f", Double(.random(in: 1...5))))")
                            .foregroundColor(.black)
                            .font(.system(size: 18, weight: .regular))
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                    
                    Image("graph")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding()
                }
            }
        }
    }
}

#Preview {
    AnalyticView()
}
