//
//  Reviews.swift
//  App374
//
//  Created by IGOR on 05/03/2024.
//

import SwiftUI
import StoreKit

struct Reviews: View {
    
    let telegram: URL
    let isTelegram: Bool
    
    var body: some View {
 
        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                Image("Reviews")
                    .resizable()
                    .ignoresSafeArea()
                
                VStack {
                    
                    Text("Rate our app in the AppStore")
                        .foregroundColor(.black)
                        .font(.system(size: 22, weight: .bold))
                        .padding(.vertical, 30)
                        .padding(.bottom, 30)
                    
                    NavigationLink(destination: {
                        
                        if isTelegram == true {
                            
                            Join(telegram: telegram)
                                .navigationBarBackButtonHidden()
                            
                        } else if isTelegram == false {
                            
                            Not()
                                .navigationBarBackButtonHidden()
                        }
                        
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
        .onAppear {
            
            SKStoreReviewController.requestReview()
        }
    }
}

#Preview {
    Reviews(telegram: URL(string: "")!, isTelegram: false)
}
