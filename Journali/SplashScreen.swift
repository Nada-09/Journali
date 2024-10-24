//
//  ContentView.swift
//  Journali
//
//  Created by Nada Abdullah on 20/04/1446 AH.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
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
    }
}

#Preview {
    ContentView()
}
