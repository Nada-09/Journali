//
//  JournaliAppMVVM.swift
//  Journali
//
//  Created by Nada Abdullah on 24/04/1446 AH.
//

import Foundation

class JournaliAppMVVM : ObservableObject {
    @Published var entries: [JournalEntry] = []
        
        func addEntry(title: String, content: String) {
            let newEntry = JournalEntry(title: title, date: Date().formatted(date: .abbreviated, time: .omitted), content: content)
            entries.insert(newEntry, at: 0)
        }
    
        func updateEntry(_ entry: JournalEntry, withTitle title: String, content: String) {
            if let index = entries.firstIndex(where: { $0.id == entry.id }) {
                entries[index].title = title
                entries[index].content = content
            }
        }

        func deleteEntry(_ entry: JournalEntry) {
            entries.removeAll { $0.id == entry.id }
        }

        private func getCurrentDate() -> String {
            let formatter = DateFormatter()
            formatter.dateFormat = "dd/MM/yyyy"
            return formatter.string(from: Date())
        }
    
    
    }

