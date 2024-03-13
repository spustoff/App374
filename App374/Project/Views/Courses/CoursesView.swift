//
//  CoursesView.swift
//  App374
//
//  Created by IGOR on 05/03/2024.
//

import SwiftUI

struct CoursesView: View {
  
    @StateObject var viewModel = CoursesViewModel()
    
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
                
                HStack {
                    
                    ForEach(viewModel.status, id: \.self) { index in
                    
                        Button(action: {
                            
                            viewModel.currentStatus = index
                            
                        }, label: {
                            
                            Text(index)
                                .foregroundColor(viewModel.currentStatus == index ? .white : .gray)
                                .font(.system(size: 13, weight: .regular))
                                .frame(maxWidth: .infinity)
                                .frame(height: 50)
                                .background(Rectangle().fill(viewModel.currentStatus == index ? Color("prim3") : .gray.opacity(0)))
                        })
                    }
                }
                .frame(maxWidth: .infinity)
                .frame(height: 50)
                .background(Rectangle().fill(.gray.opacity(0.1)))
                .padding(.horizontal)
                
                if viewModel.courses.isEmpty {
                    
                    VStack {
                        
                        Text("No courses")
                            .foregroundColor(.black)
                            .font(.system(size: 24, weight: .regular))
                        
                        Text("Add an course with the plus button")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                    }
                    .frame(maxHeight: .infinity)
                    
                } else {
                    
                    if viewModel.currentStatus == "Study now" {
                        
                        ScrollView(.vertical, showsIndicators: false) {
                        
                        LazyVStack {
                            
                            ForEach(viewModel.courses, id: \.self) { index in
                                
                                VStack(spacing: 12) {
                                    
                                    HStack {
                                        
                                        Text(index.cType ?? "")
                                            .foregroundColor(.blue)
                                            .font(.system(size: 13, weight: .regular))
                                        
                                        Spacer()
                                        
                                        Text(index.cDetails ?? "")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 13, weight: .regular))
                                    }
                                    
                                    Text(index.cTitle ?? "")
                                        .foregroundColor(.black)
                                        .font(.system(size: 20, weight: .regular))
                                    
                                    Text("\(index.cStart ?? ""), \(index.cDuration ?? "")")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 13, weight: .regular))
                                }
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(Rectangle().fill(Color("prim2")))
                            }
                        }
                    }
                        
                    } else {
                        
                        ScrollView(.vertical, showsIndicators: false) {
                            
                            ForEach(viewModel.courses, id: \.self) { index in
                            
                            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], content: {
                                
                                VStack(spacing: 10) {
                                    
                                    Text(index.cTitle ?? "")
                                        .foregroundColor(.black)
                                        .font(.system(size: 20, weight: .regular))
                                    
                                    HStack {
                                        
                                        Text(index.cType ?? "")
                                            .foregroundColor(.blue)
                                            .font(.system(size: 13, weight: .regular))
                                        
                                        Spacer()
                                        
                                        Text(index.cDuration ?? "")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 13, weight: .regular))
                                    }
                                }
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Rectangle().fill(.gray.opacity(0.15)))
                            })
                        }
                    }
                    }
                }
            }
        }
        .onAppear {
            
            viewModel.fetchCourses()
        }
    }
}

#Preview {
    CoursesView()
}
