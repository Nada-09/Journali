//
//  JournalEntryView.swift
//  Journali
//
//  Created by Nada Abdullah on 25/04/1446 AH.
//

import SwiftUI

struct JournalEntryView: View {
    let entry: JournalEntry  // Entry data passed into the view

    var body: some View {
        ZStack {
            // Background Rectangle
            RoundedRectangle(cornerRadius: 14)
                .fill(Color(red: 0.09, green: 0.09, blue: 0.098))  // Background color
                .frame(height: 150)  // Adjust height as needed
            
            // Entry Content
            VStack(alignment: .leading, spacing: 5) {
                Text(entry.title)
                    .font(.headline)
                    .foregroundColor(Color(red: 0.831, green: 0.784, blue: 1.0))  // Title color

                Text(entry.date)
                    .font(.subheadline)
                    .foregroundColor(.gray)

                Text(entry.content)
                    .font(.body)
                    .foregroundColor(.white)
                    .lineLimit(3)  // Limit to 3 lines
            }
            .padding()
        }
        .swipeActions(edge: .trailing) {  // Add swipe actions
            Button(role: .destructive) {
                // Add action for delete here
            } label: {
                Label("Delete", systemImage: "trash.fill")
            }
        }
        .padding(.horizontal)  // Add padding around the entry
    }
}

struct JournalEntryView_Previews: PreviewProvider {
    static var previews: some View {
        JournalEntryView(entry: JournalEntry(
            title: "Sample Title",
            date: "02/09/2024",
            content: "This is a sample content for the journal entry. It will be truncated after three lines."
        ))
        .previewLayout(.sizeThatFits)
        .padding()
    }
}


