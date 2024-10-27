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
            let newEntry = JournalEntry(title: title, date: Date().formatted(), content: content)
            entries.insert(newEntry, at: 0) // Add new entry at the top
        }
        
        func deleteEntry(at indexSet: IndexSet) {
            entries.remove(atOffsets: indexSet)
        }
    }

