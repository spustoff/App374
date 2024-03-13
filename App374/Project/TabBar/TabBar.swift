//
//  TabBar.swift
//  App374
//
//  Created by IGOR on 05/03/2024.
//

import SwiftUI

struct TabBar: View {
    
    @Binding var selectedTab: Tab
    
    var body: some View {
        
        HStack {
            
            ForEach(Tab.allCases, id: \.self) { index in
                
                Button(action: {
                    
                    selectedTab = index
                    
                }, label: {
                    
                    if index == .Add {
                        
                        Image("Add")
                        
                    } else {
                        
                        VStack(alignment: .center, spacing: 8, content: {
                            
                            Image(index.rawValue)
                                .renderingMode(.template)
                                .foregroundColor(selectedTab == index ? Color("prim") : Color.gray)
                                .frame(height: 22)
                            
                            Text(index.rawValue)
                                .foregroundColor(selectedTab == index ? Color("prim") : Color.gray)
                                .font(.system(size: 12, weight: .regular))
                            
                        })
                        .frame(maxWidth: .infinity)
                    }
                })
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal)
        .padding(.top, 14)
        .padding(.bottom, 28)
        .background(Color("bg2"))
    }
}

enum Tab: String, CaseIterable {
    
    case Expenses = "Expenses"
    
    case Books = "Books"
    
    case Add = "Add"
    
    case Courses = "Courses"
        
    case Settings = "Settings"
    
}

#Preview {
    ContentView()
}
