//
//  File.swift
//  Customizing the Appearance of Notifications in Swift
//
//  Created by sothea007 on 4/9/24.
//

import SwiftUI

struct CodePreview: View {
    let code: String
    let language: String = "Json Example :" // Label to indicate the language
    
    var body: some View {
        VStack(alignment: .leading) {
            // Header containing language label and Copy Code button
            HStack {
                Text(language)
                    .font(.system(size: 12))
                    .foregroundColor(.white.opacity(0.8))
                
                Spacer()
                
                Button(action: {
                    copyToClipboard()
                }) {
                    HStack(spacing: 4) {
                        Image(systemName: "doc.on.doc") // Copy icon
                        Text("Copy code")
                            .font(.system(size: 12))
                    }
                    .foregroundColor(.white)
                    .padding(8)
                }
                .background(Color.gray.opacity(0.2))
                .cornerRadius(5)
            }
            .padding(.horizontal)
            .padding(.vertical, 4)
            .background(Color.black)
            
            // Code content with monospaced font and dark background
            ScrollView(.vertical) {
                Text(code)
                    .font(.system(.body, design: .monospaced))
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.black)
                    .cornerRadius(8)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding([.horizontal, .bottom])
            .background(Color.black)
            .cornerRadius(8)
        }
        .background(Color.black)
        .cornerRadius(8)
        .shadow(radius: 2)
    }
    
    // Function to copy code to clipboard
    func copyToClipboard() {
        UIPasteboard.general.string = code
    }
}

