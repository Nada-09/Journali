//
//  NewJournal.swift
//  Journali
//
//  Created by Nada Abdullah on 25/04/1446 AH.
//

import SwiftUI

struct NewJournal: View {
    @Environment(\.presentationMode) private var presentationMode
    @StateObject private var viewModel = JournaliAppMVVM()
    @State private var newEntryTitle = ""
    @State private var newEntryContent = ""
    
    let entryToEdit: JournalEntry?  // Entry to edit, if available
    var onSave: (String, String) -> Void  // Callback for save action
    
    var body: some View {
        VStack {
            HStack {
                Button("Cancel") {
                    presentationMode.wrappedValue.dismiss()
                }
                .foregroundColor(Color(red: 0.6431372549019608, green: 0.6, blue: 1.0))
                .fontWeight(.regular)
                
                Spacer()
                
                Button("Save") {
                    onSave(newEntryTitle, newEntryContent)
                    presentationMode.wrappedValue.dismiss()
                }
                .foregroundColor(Color(red: 0.6431372549019608, green: 0.6, blue: 1.0))
                .fontWeight(.bold)
            }
            .padding()
            
            VStack(alignment: .leading, spacing: 8) {
                TextField("Title", text: $newEntryTitle)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Text(getFormattedDate())
                    .foregroundColor(.gray)
                    .fontWeight(.regular)
                
                ZStack(alignment: .topLeading) {
                    if newEntryContent.isEmpty {
                        Text("Type your Journal…")
                            .foregroundColor(.gray)
                            .padding(.top, 8)
                            .padding(.horizontal, 4)
                            .background(Color.clear)
                    }
                    
                    TextEditor(text: $newEntryContent)
                        .foregroundColor(.white)
                        .fontWeight(.regular)
                        .font(.title3)
                        .padding(.top, 8)
                }
                Spacer()
            }
            .padding()
            .onAppear {
                if let entry = entryToEdit {
                    newEntryTitle = entry.title
                    newEntryContent = entry.content
                }
            }
        }
    }
    
    private func getFormattedDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        return formatter.string(from: Date())
    }
}

#Preview {
    NewJournal(entryToEdit: nil) { title, content in
        print("Saved entry with title: \(title) and content: \(content)")
    }
}
