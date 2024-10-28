//
//  EmptyStateNew.swift
//  Journali
//
//  Created by Nada Abdullah on 25/04/1446 AH.
//

import SwiftUI

struct EmptyStateNew: View {
    @State private var showingNewJournal = false
    @StateObject private var viewModel = JournaliAppMVVM()
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
                    
                Button(action: {
                    showingNewJournal = true  // Show the NewJournal view when the plus icon is tapped
                }) { ZStack{
                    
                    Circle()
                        .fill(Color(red: 0.12156862745098039, green: 0.12156862745098039, blue: 0.13333333333333333))
                        .frame(width: 30, height: 30)
                Image(systemName: "plus")
                        .font(.title3)
                    .foregroundColor(Color(red: 0.8313725490196079, green: 0.7843137254901961, blue: 1.0))
                  
                }//END of zstack
              
                }
            
                
                    
                }//end of icon HStack
                .padding(.top)
            }//End of for toolbar 01
          }//End of for toolbar 02
            
            .sheet(isPresented: $showingNewJournal) {
                NewJournal(entryToEdit: nil) { title, content in
                    viewModel.addEntry(title: title, content: content)
                }
                .interactiveDismissDisabled()
            }

            
        }//end of navigation stack
    }
}

struct EmptyStateNew_Previews: PreviewProvider {
    static var previews: some View {
        EmptyStateNew()
    }
}

#Preview {
    EmptyStateNew()
}
