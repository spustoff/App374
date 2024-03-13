//
//  Not.swift
//  App374
//
//  Created by IGOR on 05/03/2024.
//

import SwiftUI
import OneSignalFramework

struct Not: View {
    
    @AppStorage("status") var status: Bool = false

    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                Image("Not")
                    .resizable()
                    .ignoresSafeArea()
                
                VStack {
                    
                    Text("Miss nothing")
                        .foregroundColor(.black)
                        .font(.system(size: 22, weight: .bold))
                        .padding(.vertical, 30)
                        .padding(.bottom, 30)
                    
                    Button(action: {
                        
                        OneSignal.Notifications.requestPermission({ accepted in
                          print("User accepted notifications: \(accepted)")
                            status = true
                        }, fallbackToSettings: true)
                        
                    }, label: {
                        
                        Text("Enable Notifications")
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
                    
                    Button(action: {
                        
                        status = true
                        
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
    Not()
}
