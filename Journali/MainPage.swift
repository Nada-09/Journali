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
              
            VStack {
                
                
                
            }// end of VSTack of the middle section
            
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
