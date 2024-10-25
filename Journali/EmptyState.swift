//
//  EmptyState.swift
//  Journali
//
//  Created by Nada Abdullah on 20/04/1446 AH.
//

import SwiftUI

struct EmptyState: View {
    var body: some View {
        NavigationStack{
            
            HStack(spacing: 20) {
                Spacer()
                Image(systemName: "line.horizontal.3")
                    .font(.title2)
                    .foregroundColor(.white)
                Image(systemName: "plus")
                    .font(.title2)
                    .foregroundColor(.white)
            }//end of icon HStack
            .padding([.top, .horizontal])
            
            VStack {
                Image("url")
                    .imageScale(.large)
                
                Text("Begin Your Journal")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color(red: 0.8313725490196079, green: 0.7843137254901961, blue: 1.0))
                
                Text("Craft your personal diary, tap the plus icon to begin")
                    .font(.title2)
                    .multilineTextAlignment(.center)
                    .fontWeight(.light)
                    .padding(.horizontal, 40)
                    .padding(.top, 1.0)
            }// end of VSTack of the middle section
            navigationTitle("Journal")
        }//end of navigation stack
        
        
    }//end of body
}
    #Preview {
        EmptyState()
    }
