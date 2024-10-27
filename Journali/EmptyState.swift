//
//  EmptyState.swift
//  Journali
//
//  Created by Nada Abdullah on 20/04/1446 AH.
//

import SwiftUI

struct EmptyState: View {
    @State private var title: String = ""
    @State private var content: String = ""
    @State private var showSheet = false
    @State private var currentDate = ""
    var body: some View {
        NavigationStack{
              
            VStack {
                Image("url")
                    .imageScale(.large)
                
                Text("Begin Your Journal")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color(red: 0.8313725490196079, green: 0.7843137254901961, blue: 1.0))
                
                Text("Craft your personal diary, tap the plus icon to begin")
                    .font(.title3)
                    .multilineTextAlignment(.center)
                    .fontWeight(.light)
                    .padding(.horizontal, 40)
                    .padding(.top, 0.1)
            }// end of VSTack of the middle section
            
            
            .navigationTitle("Journal")
            .toolbar {ToolbarItem(placement: .topBarTrailing) {
                HStack(spacing: 20) {
                    ZStack{
                        Circle()
                            .fill(Color(red: 0.12156862745098039, green: 0.12156862745098039, blue: 0.13333333333333333))
                            .frame(width: 30, height: 30)
                        Image(systemName: "line.3.horizontal.decrease")
                            .font(.title3)
                            .foregroundColor(Color(red: 0.831, green: 0.7843137254901961, blue: 1.0))
                        
                    }//END of zstack
                    
                    ZStack{
                        Circle()
                            .fill(Color(red: 0.12156862745098039, green: 0.12156862745098039, blue: 0.13333333333333333))
                            .frame(width: 30, height: 30)
                    Image(systemName: "plus")
                            .font(.title3)
                        .foregroundColor(Color(red: 0.8313725490196079, green: 0.7843137254901961, blue: 1.0))
                        .onTapGesture {showSheet.toggle()}
                    }//END of zstack
                }//end of icon HStack
                .padding(.top)
            }//End of for toolbar 01
          }//End of for toolbar 02
            
            
            
            
            .sheet(isPresented: $showSheet, content: {
                VStack{
                    HStack {
                        Button("Cancel") {
                            showSheet.toggle()
                            
                        }// Close Cancel
                        .foregroundColor(Color(red: 0.6431372549019608, green: 0.6, blue: 1.0))
                        .fontWeight(.regular)
                        
                        Spacer()
                        
                        Button("Save") {
                            
                        }// Close Save
                        .foregroundColor(Color(red: 0.6431372549019608, green: 0.6, blue: 1.0))
                        .fontWeight(.bold)
                        
                    }//end of HsTACK of cancel and save

                    
                    VStack(alignment: .leading, spacing: 8) {
                        TextField("Title", text: $title)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        
                        Text(currentDate)
                            .foregroundColor(.gray)
                            .fontWeight(.regular)
                        
                        ZStack(alignment: .topLeading){
                            if content.isEmpty{
                                Text("Type your Journal…")
                                //.font(.title2)
                                //  .fontWeight(.regular)
                                    .foregroundColor(.gray)
                                    .padding(.top, 8)
                                    .padding(.horizontal, 4)
                                    .background(Color.clear)
                            }//end of if
                            
                            TextEditor( text: $content)
                                .frame(maxHeight: .infinity)
                                .foregroundColor(.white)
                                .fontWeight(.regular)
                                .font(.title3)
                                .padding(.top, 8)
                        }//end od zstack of if statement
                        Spacer()
                    }//End of Vstack of entry
                }//end of Vstack of the sheet
                  
                    .padding()
                    .interactiveDismissDisabled()
  
            })//End of Sheet content
            
        }//end of navigation stack
    }//end of body
        
}//end of struct


                   
                   
                   
    #Preview {
        EmptyState()
    }
