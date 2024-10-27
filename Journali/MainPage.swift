//
//  MainPage.swift
//  Journali
//
//  Created by Nada Abdullah on 24/04/1446 AH.
//

import SwiftUI

struct MainPage: View {
    @State private var showSheet = false
    @State private var searchTerm = ""
    
    var body: some View {
        NavigationStack{
    

            ZStack {
         
                
                RoundedRectangle(cornerRadius: 14)
                    .frame(width: 350, height: 227, alignment: .topLeading)
                    .foregroundColor(Color(red: 0.09019607843137255, green: 0.09019607843137255, blue: 0.09803921568627451))
                
                
                    
                
                Image(systemName: "bookmark")
                    .foregroundColor(Color(red: 0.831, green: 0.7843137254901961, blue: 1.0))
                    .frame(width: 25, height: 29)
                    
                
            }// end of VSTack of the middle section
           
            
            
            
         //   .swipeActions{
          //      Button(role: .destructive){
                    //DELETE
       //         }//end of button
          //      label: {
         //           Label("Delete", systemImage: "Trash.fill")
        //        }//end of label
       //     }//end of swipe
            
            
            
            
            
            
            .searchable(text: $searchTerm, prompt: "Search")
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
            
            
            
            
        }//end of navigation stack
    }
}

#Preview {
    MainPage()
}
