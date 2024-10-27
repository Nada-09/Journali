//
//  JournalEntry.swift
//  Journali
//
//  Created by Nada Abdullah on 25/04/1446 AH.
//

import Foundation

struct JournalEntry: Identifiable {
    let id = UUID()  // Unique identifier for each entry
    let title: String  // Title of the journal entry
    let date: String  // Date as a formatted string
    let content: String  // Content of the journal entry
}
