//
//  SettingsView.swift
//  App374
//
//  Created by IGOR on 05/03/2024.
//

import SwiftUI
import StoreKit

struct SettingsView: View {
    
    @State var isReset: Bool = false
    
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                VStack {
                    
                    Spacer()
                    
                    Text("Settings")
                        .foregroundColor(.black)
                        .font(.system(size: 18, weight: .regular))
                        .padding()
                }
                .frame(maxWidth: .infinity)
                .frame(height: 100)
                .background(Color("prim"))
                .ignoresSafeArea()
                
                Button(action: {
                    
                    guard let url = URL(string: DataManager().usagePolicy) else { return }
                    
                    UIApplication.shared.open(url)
                    
                }, label: {
                    
                    HStack {
                        
                        Image(systemName: "list.bullet.rectangle.portrait")
                            .foregroundColor(Color("prim3"))
                            .font(.system(size: 20, weight: .regular))
                        
                        Text("Usage profile")
                            .foregroundColor(.black)
                            .font(.system(size: 16, weight: .regular))
                        
                        Spacer()
                    }
                })
                .padding()
                .frame(maxWidth: .infinity)
                .frame(height: 70)
                .background(Rectangle().fill(.gray.opacity(0.15)))
                .padding(.horizontal)
                
                Button(action: {
                    
                    SKStoreReviewController.requestReview()
                    
                }, label: {
                    
                    HStack {
                        
                        Image(systemName: "star.fill")
                            .foregroundColor(Color("prim3"))
                            .font(.system(size: 20, weight: .regular))
                        
                        Text("Rate app")
                            .foregroundColor(.black)
                            .font(.system(size: 16, weight: .regular))
                        
                        Spacer()
                    }
                })
                .padding()
                .frame(maxWidth: .infinity)
                .frame(height: 70)
                .background(Rectangle().fill(.gray.opacity(0.15)))
                .padding(.horizontal)
                
                Spacer()
                
                Button(action: {
                    
                    withAnimation(.spring()) {
                        
                        isReset = true
                    }
                        
                }, label: {
                    
                    HStack {
                        
                        Image(systemName: "arrow.triangle.2.circlepath")
                            .foregroundColor(Color.red)
                            .font(.system(size: 20, weight: .regular))
                        
                        Text("Reset progress")
                            .foregroundColor(Color.red)
                            .font(.system(size: 16, weight: .regular))
                        
                        Spacer()
                    }
                })
                .padding()
                .frame(maxWidth: .infinity)
                .frame(height: 70)
                .background(Rectangle().fill(.gray.opacity(0.15)))
                .padding(.horizontal)
            }
        }
        .overlay(
            
            ZStack {
                
                Color.black.opacity(isReset ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            isReset = false
                        }
                    }
                
                VStack {
                    
                    HStack {
                        
                        Spacer()
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                isReset = false
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
                        
                        CoreDataStack.shared.deleteAllData()
                        
                        withAnimation(.spring()) {
                            
                            isReset = false
                        }
                        
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
                            
                            isReset = false
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
                .offset(y: isReset ? 0 : UIScreen.main.bounds.height)
            }
        )
    }
}

#Preview {
    SettingsView()
}
