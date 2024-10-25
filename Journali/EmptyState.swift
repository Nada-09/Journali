//
//  EmptyState.swift
//  Journali
//
//  Created by Nada Abdullah on 20/04/1446 AH.
//

import SwiftUI

struct EmptyState: View {
    @State private var isSheetPresented = false
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
                        .onTapGesture {isSheetPresented.toggle()}
                    }//END of zstack
                }//end of icon HStack
                .padding(.top)
            }//End of for toolbar 01
          }//End of for toolbar 02
            .sheet(isPresented: $isSheetPresented){
                NewJournalEntrySheet()
            }//end of sheet
        }//end of navigation stack
    }//end of body
        
}//end of struct

struct NewJournalEntrySheet: View {
    var body: some View {
        VStack {
            Text("Create New Journal Entry")
                .font(.title)
                .padding()
            
            // Add your form fields or content for creating a new journal entry
            Button("Close") {
                // Close the sheet (Handled automatically by parent view)
            }
            .font(.headline)
            .padding()
        }
    }
}

    #Preview {
        EmptyState()
    }
