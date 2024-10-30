//
//  JournalEntryView.swift
//  Journali
//
//  Created by Nada Abdullah on 25/04/1446 AH.
//

import SwiftUI

struct JournalEntryView: View {
    let entry: JournalEntry  // Entry data passed into the view
    @State private var isBookmarked = false  // Track bookmark state
    var onEdit: () -> Void  // Callback for edit action
    var onDelete: () -> Void  // Callback for delete action

    var body: some View {
        ZStack {
            // Background Rectangle
            RoundedRectangle(cornerRadius: 14)
                .fill(Color(red: 0.09, green: 0.09, blue: 0.098))  // Background color
                .frame(width: 350, height: 227)  // Adjust height as needed
            
            // Entry Content
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Text(entry.title)
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(Color(red: 0.831, green: 0.784, blue: 1.0))  // Title color
                    
                    Spacer()
                    
                    Button(action: {
                        isBookmarked.toggle()
                    }) {
                        Image(systemName: isBookmarked ? "bookmark.fill" : "bookmark")
                            .foregroundColor(Color(red: 0.8313725490196079, green: 0.7843137254901961, blue: 1.0)) // Toggle color
                            
                    }
                    .buttonStyle(PlainButtonStyle())  // Remove button animation
                }

                Text(entry.date)
                    .font(.subheadline)
                    .foregroundColor(.gray)

                Text(entry.content)
                    .font(.headline)
                    .fontWeight(.regular)
                    .foregroundColor(.white)
                    .lineLimit(3)  // Limit to 3 lines
            }
            .padding()
        }
        .clipShape(RoundedRectangle(cornerRadius: 14)) // Apply rounded shape to entire view
        .swipeActions(edge: .leading) {  // Right-swipe for edit
            Button {
                onEdit()  // Call edit action
            } label: {
                Label("Edit", systemImage: "pencil")
            }
            
        }
        .swipeActions(edge: .trailing) {  // Left-swipe for delete
            Button (role: .destructive) {
                onDelete()  // Call delete action
            } label: {
                Label("Delete", systemImage: "trash.fill")
            }
        }
        .padding(.horizontal)  // Add padding around the entry
    }
}

struct JournalEntryView_Previews: PreviewProvider {
    static var previews: some View {
        JournalEntryView(
            entry: JournalEntry(
                title: "Sample Title",
                date: "02/09/2024",
                content: "This is a sample content for the journal entry. It will be truncated after three lines."
            ),
            onEdit: { print("Edit tapped") },
            onDelete: { print("Delete tapped") }
        )
        .previewLayout(.sizeThatFits)
        .padding()
    }
}


