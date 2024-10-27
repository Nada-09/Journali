//
//  mememe.swift
//  Journali
//
//  Created by Nada Abdullah on 25/04/1446 AH.
//

import SwiftUI

struct mememe: View {
    @StateObject private var viewModel = JournaliAppMVVM()
    @State private var newEntryTitle = ""
    @State private var newEntryContent = ""

    var body: some View {
        NavigationView {
            VStack {
                // Text fields for adding a new journal entry
                TextField("Title", text: $newEntryTitle)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(8)
                
                TextField("Content", text: $newEntryContent)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(8)
                
                Button("Add Entry") {
                    viewModel.addEntry(title: newEntryTitle, content: newEntryContent)
                    newEntryTitle = ""
                    newEntryContent = ""
                }
                .padding()
                
                List {
                    ForEach(viewModel.entries) { entry in
                        JournalEntryView(entry: entry)
                    }
                    .onDelete(perform: viewModel.deleteEntry)
                }
                .listStyle(PlainListStyle())
            }
            .padding()
            .navigationTitle("Journal")
        }
    }
}


#Preview {
    mememe()
}
