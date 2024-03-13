//
//  Join.swift
//  App374
//
//  Created by IGOR on 05/03/2024.
//

import SwiftUI

struct Join: View {
    
    let telegram: URL
    
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                Image("Join")
                    .resizable()
                    .ignoresSafeArea()
                
                VStack {
                    
                    Text("Join our Telegram")
                        .foregroundColor(.black)
                        .font(.system(size: 22, weight: .bold))
                        .padding(.vertical, 30)
                        .padding(.bottom, 30)
                    
                    Button(action: {
                        
                        UIApplication.shared.open(telegram)
                        
                    }, label: {
                        
                        Text("Join")
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
            
            VStack {
                
                HStack {
                    
                    Spacer()
                    
                    NavigationLink(destination: {
                        
                        Not()
                            .navigationBarBackButtonHidden()
                        
                    }, label: {
                        
                        Image(systemName: "xmark")
                            .foregroundColor(.black)
                            .font(.system(size: 15, weight: .regular))
                            .padding(5)
                            .background(Circle().fill(.white.opacity(0.4)))
                    })
                    .padding()
                }
                
                Spacer()
            }
        }
    }
}

#Preview {
    Join(telegram: URL(string: "")!)
}
