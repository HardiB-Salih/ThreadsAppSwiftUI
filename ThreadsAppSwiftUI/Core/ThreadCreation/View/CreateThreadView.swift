//
//  CreateThreadView.swift
//  ThreadsAppSwiftUI
//
//  Created by HardiB.Salih on 5/12/24.
//

import SwiftUI

struct CreateThreadView: View {
    @StateObject var viewModel = CreatThreadViewModel()
    @Binding var isPresented: Bool
    @State private var caption = ""
    @Environment(\.dismiss) var dismiss
    @State private var isLoading = false
    
    
    private var user: User? {
        return UserService.currentUser
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack(alignment: .top) {
                    CircleProfileImageView(user: user, size: .small)
                    VStack(alignment: .leading, spacing: 4) {
                        Text(user?.fullname ?? "")
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
                        Button("Cancel") {
                            isPresented = false
                            dismiss()
                        }
                        .font(.subheadline)
                        .foregroundStyle(Color(.black))
                    }
                    ToolbarItem(placement: .topBarTrailing) {
                        Button("Post") {
                            isLoading = true
                            Task{
                                try await viewModel.uploadThread(caption: caption)
                                isPresented = false
                                isLoading = false
                                dismiss()
                            }
                            
                        }
                        .opacity(caption.isEmpty ? 0.5 : 1.0)
                        .disabled(caption.isEmpty)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(Color(.black))
                    }
                }.overlay(
                    Group {
                        if isLoading {
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle())
                                .tint(.black)
                        }
                    }
                )
        }
    }
}

#Preview {
    CreateThreadView(isPresented: .constant(false))
}
