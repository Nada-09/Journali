//
//  mememe.swift
//  Journali
//
//  Created by Nada Abdullah on 25/04/1446 AH.
//

import SwiftUI

struct mememe: View {
    @StateObject private var viewModel = JournaliAppMVVM()
    @State private var showSheet = false
    @State private var searchTerm = ""
    @State private var newEntryTitle = ""
    @State private var newEntryContent = ""
    @State private var selectedEntry: JournalEntry?  // Entry to edit
    @State private var isEditing = false

    var body: some View {
        NavigationView {
            VStack {

                List {
                                    ForEach(viewModel.entries) { entry in
                                        JournalEntryView(
                                            entry: entry,
                                            onEdit: {
                                                selectedEntry = entry  // Set the entry to be edited
                                                showSheet = true
                                            },
                                            onDelete: {
                                                if let index = viewModel.entries.firstIndex(where: { $0.id == entry.id }) {
                                                    viewModel.entries.remove(at: index)
                                                }
                                            }
                                        )
                                    }
                                .onDelete(perform: viewModel.deleteEntry)
                            }
                .listStyle(PlainListStyle())
                
                
            }
            
            
            .padding()
            .navigationTitle("Journal")
            .searchable(text: $searchTerm, prompt: "Search")
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
                        Button {
                            selectedEntry = nil  // Clear selection for new entry
                            showSheet = true
                        } label: {
                            Image(systemName: "plus")
                                .foregroundColor(.purple)
                        }
                                        
                                    
                        Circle()
                            .fill(Color(red: 0.12156862745098039, green: 0.12156862745098039, blue: 0.13333333333333333))
                            .frame(width: 30, height: 30)
                    Image(systemName: "plus")
                            .font(.title3)
                        .foregroundColor(Color(red: 0.8313725490196079, green: 0.7843137254901961, blue: 1.0))
                        .onTapGesture {showSheet.toggle()}
                    }//END of zstack
                    .padding(.top)
                }//end of icon HStack
                .sheet(isPresented: $showSheet) {
                    NewJournal(entryToEdit: selectedEntry) { title, content in
                        if let entry = selectedEntry {
                            // Update existing entry
                            if let index = viewModel.entries.firstIndex(where: { $0.id == entry.id }) {
                                viewModel.entries[index].title = title
                                viewModel.entries[index].content = content
                            }
                        } else {
                            // Add new entry
                            viewModel.addEntry(title: title, content: content)
                        }
                    }
                }

                        }
                    }
        
       
    
            }//End of for toolbar 01
          }//End of for toolbar 02
        }

struct mememe_Previews: PreviewProvider {
    static var previews: some View {
        mememe()
    }
}
#Preview {
    mememe()
}
