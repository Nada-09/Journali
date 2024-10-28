//
//  ContentView.swift
//  Journali
//
//  Created by Nada Abdullah on 20/04/1446 AH.
//

import SwiftUI

struct ContentView: View {
    @State private var isActive = false
    var body: some View {
        if isActive {
                    EmptyStateNew()  // Show EmptyStateNew after splash screen
        } else {
            VStack {
                Image("url")
                    .imageScale(.large)
                
                Text("Journali")
                    .font(.largeTitle)
                    .fontWeight(.black)
                
                Text("Your thoughts, your story")
                    .fontWeight(.light)
                
            }
            .padding()
            .onAppear {
                // Delay for 2 seconds, then show EmptyStateNew
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    withAnimation {
                        isActive = true
                    }
                }
            }
        }
        }

}

#Preview {
    ContentView()
}
