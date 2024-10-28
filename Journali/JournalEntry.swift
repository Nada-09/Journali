//
//  JournalEntry.swift
//  Journali
//
//  Created by Nada Abdullah on 25/04/1446 AH.
//

import Foundation

struct JournalEntry: Identifiable {
    let id = UUID()  // Unique identifier for each entry
    var title: String  // Title of the journal entry
    var date: String  // Date as a formatted string
    var content: String  // Content of the journal entry
    //add bookmark icon
}
