//
//  R1.swift
//  App374
//
//  Created by IGOR on 05/03/2024.
//

import SwiftUI

struct R1: View {
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                Image("R1")
                    .resizable()
                    .ignoresSafeArea()
                
                VStack {
                    
                    Text("Manage your subscriptions")
                        .foregroundColor(.black)
                        .font(.system(size: 22, weight: .bold))
                        .padding(.vertical, 30)
                        .padding(.bottom, 30)
                    
                    NavigationLink(destination: {
                        
                        R2()
                            .navigationBarBackButtonHidden()
                        
                    }, label: {
                        
                        Text("Next")
                            .foregroundColor(.black)
                            .font(.system(size: 14, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(Rectangle().fill(Color("prim")))
                        
                    })
                    .padding()
                }
                .frame(maxWidth: .infinity)
                .background(Color.white)
            }
        }
    }
}

#Preview {
    R1()
}
