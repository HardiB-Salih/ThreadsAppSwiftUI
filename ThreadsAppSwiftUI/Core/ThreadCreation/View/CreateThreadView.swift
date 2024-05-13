//
//  CreateThreadView.swift
//  ThreadsAppSwiftUI
//
//  Created by HardiB.Salih on 5/12/24.
//

import SwiftUI

struct CreateThreadView: View {
    @State private var caption = ""
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationStack {
            VStack {
                HStack(alignment: .top) {
                    CircleProfileImageView(imageName: "image2")
                    VStack(alignment: .leading, spacing: 4) {
                        Text("HardiB. Salih")
                            .fontWeight(.semibold)
                        
                        TextField("Start a thread ...", text: $caption, axis: .vertical)
                    }.font(.footnote)
                    
                    Spacer()
                    if !caption.isEmpty {
                        Button(action: {
                            caption = ""
                        }, label: {
                            Image(systemName: "xmark")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 12, height: 12)
                                .foregroundStyle(Color(.systemGray2))
                        })
                    }
                }
                Spacer()
            }.padding()
            .navigationTitle("New Thread")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Button("Cancel") { dismiss() }
                            .font(.subheadline)
                            .foregroundStyle(Color(.black))
                    }
                    ToolbarItem(placement: .topBarTrailing) {
                        Button("Post") { }
                            .opacity(caption.isEmpty ? 0.5 : 1.0)
                            .disabled(caption.isEmpty)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundStyle(Color(.black))
                    }
                }
        }
    }
}

#Preview {
    CreateThreadView()
}
