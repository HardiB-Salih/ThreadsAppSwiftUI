//
//  ThreadReplyView.swift
//  ThreadsAppSwiftUI
//
//  Created by HardiB.Salih on 5/14/24.
//

import SwiftUI

struct ThreadReplyView: View {
    @StateObject var viewModel = ThreadRepliesViewModel()
    let thread: Thread
    @State private var replyText = ""
    @State private var threadViewHeight: CGFloat = 24
    @Environment(\.dismiss) var dismiss
    @State private var isLoading = false
    
    private var currentUser: User? {
        return UserService.currentUser
    }
    
    func setThreadViewHeight() {
        let imageDimention : CGFloat = ProfileImageSize.small.dimention
        let padding: CGFloat = 16
        let width = UIScreen.main.bounds.width - imageDimention - padding
        let font = UIFont.systemFont(ofSize: 12)

        let captionSize = thread.caption.heightWithConstrainedWidth(width, font: font)
        threadViewHeight = captionSize + imageDimention
        
//        print("DEBUG: caption size is \(captionSize)")
    }
    
    
    
    var body: some View {
        NavigationStack{
            VStack {
                Divider()
                VStack(alignment:.leading, spacing: 12) {
                    //MARK: -Thread information
                    HStack( alignment:.top ) {
                        VStack {
                            CircleProfileImageView(user: thread.user, size: .small)
                            Rectangle()
                                .frame(width: 2, height: threadViewHeight)
                                .foregroundStyle(Color(.systemGray4))
                        }
                        VStack(alignment:.leading, spacing: 4) {
                            Text(thread.user?.username ?? "")
                                .fontWeight(.semibold)
                            
                            Text(thread.caption)
                                .multilineTextAlignment(.leading)
                        }
                        .font(.footnote)
                        Spacer()
                    }
                    
                    //MARK: Thread Reply By Current User
                    HStack(alignment: .top) {
                        CircleProfileImageView(user: currentUser, size: .small)
                        VStack(alignment: .leading, spacing: 4) {
                            Text(currentUser?.fullname ?? "boo")
                                .fontWeight(.semibold)
                            
                            TextField("add your reply ...", text: $replyText, axis: .vertical)
                                .multilineTextAlignment(.leading)
                        }
                        .font(.footnote)
                        
                        Spacer()
                        if !replyText.isEmpty {
                            Button(action: {
                                replyText = ""
                            }, label: {
                                Image(systemName: "xmark")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 12, height: 12)
                                    .foregroundStyle(Color(.systemGray2))
                            })
                        }
                    }
                }.padding()
                
                
                
               
                Spacer()
            }
            .onAppear{
                setThreadViewHeight()
            }
            .navigationTitle("Reply")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                    .font(.subheadline)
                    .foregroundStyle(Color(.black))
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Post") {
                        isLoading = true
                        Task {
                            try await viewModel.uploadThreadReply(replyText, thread: thread)
                            isLoading = false
                            dismiss()
                        }
                    }
                    .opacity(replyText.isEmpty ? 0.5 : 1.0)
                    .disabled(replyText.isEmpty)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(Color(.black))
                }
            }
            .overlay(
                Group {
                    if isLoading {
                        Spinner(loadingText: "Posting...")
                        
                    }
                }
            )
        }
    }
}

#Preview {
    ThreadReplyView(thread: dev.thread)
}
