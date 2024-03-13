//
//  AddCourse.swift
//  App374
//
//  Created by IGOR on 06/03/2024.
//

import SwiftUI

struct AddCourse: View {
    
    @StateObject var viewModel: CoursesViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                VStack {
                    
                    Spacer()
                    
                    ZStack {
                        
                        Text("Add courses")
                            .foregroundColor(.black)
                            .font(.system(size: 18, weight: .regular))
                            .padding()
                     
                        HStack {
                            
                            Button(action: {
                                
                                router.wrappedValue.dismiss()
                                
                            }, label: {
                                
                                Image(systemName: "chevron.left")
                                    .foregroundColor(.black)
                                    .font(.system(size: 18, weight: .medium))
                                    .padding(.horizontal)
                            })
                            
                            Spacer()
                        }
                    }
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
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(alignment: .leading, spacing: 15) {
                        
                        HStack {
                            
                            Text("Title")
                                .foregroundColor(.black)
                                .font(.system(size: 14, weight: .regular))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Add course title")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.cTitle.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.cTitle)
                                    .foregroundColor(.black)
                                    .font(.system(size: 14, weight: .regular))
                                
                            })
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 0).fill(.gray.opacity(0.15)))
                     
                        HStack {
                            
                            Text("Duration")
                                .foregroundColor(.black)
                                .font(.system(size: 14, weight: .regular))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Duration of course")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.cDuration.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.cDuration)
                                    .foregroundColor(.black)
                                    .font(.system(size: 14, weight: .regular))
                                
                            })
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 0).fill(.gray.opacity(0.15)))

                        HStack {
                            
                            Text("Type")
                                .foregroundColor(.black)
                                .font(.system(size: 14, weight: .regular))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Online or offline")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.cType.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.cType)
                                    .foregroundColor(.black)
                                    .font(.system(size: 14, weight: .regular))
                            })
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 0).fill(.gray.opacity(0.15)))
                        
                        HStack {
                            
                            Text("Details")
                                .foregroundColor(.black)
                                .font(.system(size: 14, weight: .regular))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Write down all detail info")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.cDetails.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.cDetails)
                                    .foregroundColor(.black)
                                    .font(.system(size: 14, weight: .regular))
                            })
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 0).fill(.gray.opacity(0.15)))
                        
                        HStack {
                            
                            Text("Start")
                                .foregroundColor(.black)
                                .font(.system(size: 14, weight: .regular))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Date of start")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.cStart.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.cStart)
                                    .foregroundColor(.black)
                                    .font(.system(size: 14, weight: .regular))
                            })
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 0).fill(.gray.opacity(0.15)))
                        
                        HStack {
                            
                            Text("Notes")
                                .foregroundColor(.black)
                                .font(.system(size: 14, weight: .regular))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Write down your notes")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.cNotes.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.cNotes)
                                    .foregroundColor(.black)
                                    .font(.system(size: 14, weight: .regular))
                            })
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 0).fill(.gray.opacity(0.15)))
                    }
                }
                .padding(.horizontal)
                
                Button(action: {
                    
                    viewModel.cCurStatus = viewModel.currentStatus
                    
                    viewModel.addCourse()
                    
                    viewModel.cTitle = ""
                    viewModel.cDuration = ""
                    viewModel.cType = ""
                    viewModel.cDetails = ""
                    viewModel.cStart = ""
                    viewModel.cNotes = ""
                    
                    viewModel.fetchCourses()
                    
                    router.wrappedValue.dismiss()
                    
                }, label: {
                    
                    Text("Add")
                        .foregroundColor(.black)
                        .font(.system(size: 14, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(Rectangle().fill(Color("prim")))
                })
                .disabled(viewModel.cTitle.isEmpty || viewModel.cDuration.isEmpty || viewModel.cType.isEmpty || viewModel.cDetails.isEmpty || viewModel.cStart.isEmpty || viewModel.cNotes.isEmpty ? true : false)
                .opacity(viewModel.cTitle.isEmpty || viewModel.cDuration.isEmpty || viewModel.cType.isEmpty || viewModel.cDetails.isEmpty || viewModel.cStart.isEmpty || viewModel.cNotes.isEmpty ? 0.5 : 1)
                .padding()
            }
        }
    }
}

#Preview {
    AddCourse(viewModel: CoursesViewModel())
}
