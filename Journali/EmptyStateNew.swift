//
//  EmptyStateNew.swift
//  Journali
//
//  Created by Nada Abdullah on 25/04/1446 AH.
//

import SwiftUI

struct EmptyStateNew: View {
    @State private var showingNewJournal = false
    @StateObject private var viewModel: JournaliAppMVVM
    
    // Explicit initializer to allow `viewModel` injection
        init(viewModel: JournaliAppMVVM) {
            _viewModel = StateObject(wrappedValue: viewModel)
        }
    
    var body: some View {
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
        }
    }
}


#Preview {
    EmptyStateNew(viewModel: JournaliAppMVVM())
}
