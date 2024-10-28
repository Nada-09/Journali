//
//  JournaliAppMVVM.swift
//  Journali
//
//  Created by Nada Abdullah on 24/04/1446 AH.
//

import Foundation

class JournaliAppMVVM : ObservableObject {
    @Published var entries: [JournalEntry] = [
            JournalEntry(title: "My Birthday", date: "02/09/2024", content: "Lorem ipsum dolor sit amet..."),
            JournalEntry(title: "Today's Journal", date: "02/09/2024", content: "Lorem ipsum dolor sit amet..."),
            JournalEntry(title: "Great Day", date: "02/09/2024", content: "Lorem ipsum dolor sit amet...")
        ]
        
        func addEntry(title: String, content: String) {
            let newEntry = JournalEntry(title: title, date: Date().formatted(date: .abbreviated, time: .omitted), content: content)
            entries.insert(newEntry, at: 0)
        }
        
        func deleteEntry(at indexSet: IndexSet) {
            entries.remove(atOffsets: indexSet)
        }
        
        // Function to edit an entry
        func editEntry(id: UUID, newTitle: String, newContent: String) {
            if let index = entries.firstIndex(where: { $0.id == id }) {
                entries[index].title = newTitle
                entries[index].content = newContent
                entries[index].date = Date().formatted(date: .abbreviated, time: .omitted)  // Update date to current date
            }
        }
    
    
    }

