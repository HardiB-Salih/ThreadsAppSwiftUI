//
//  ContentActionButtonView.swift
//  ThreadsAppSwiftUI
//
//  Created by HardiB.Salih on 5/14/24.
//

import SwiftUI

struct ContentActionButtonView: View {
    @ObservedObject var viewModel: ContentActionButtonViewModel
    @State var showReplySheet = false
    
    init(thread: Thread) {
        self.viewModel = ContentActionButtonViewModel(thread: thread)
    }
    
    private var thread: Thread {
        return viewModel.thread
    }
    
    private var didLike: Bool {
        return viewModel.thread.didLike ?? false
    }
    
    func handleLikeTapped() {
        Task {
            if didLike {
                try await viewModel.unLikeThread()
            } else {
                try await viewModel.likeThread()
            }
        }
        
    }
    
    var body: some View {
        VStack (alignment: .leading, spacing: 0){
            HStack(alignment: .center, spacing: 16) {
                Button(action: {
                    handleLikeTapped()
                }, label: {
                    Image(systemName: didLike ? "heart.fill" : "heart")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 19, height: 19, alignment: .top)
                        .foregroundStyle(didLike ? Color(.systemRed) : Color(.black))
                        
                })
                
                Button(action: {
                    showReplySheet.toggle()
                }, label: {
                    Image(systemName: "bubble.right")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 18, height: 18, alignment: .top)
                        
                })
                Button(action: {}, label: {
                    Image(systemName: "arrow.rectanglepath")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 18, height: 18, alignment: .top)
                        
                })
                Button(action: {}, label: {
                    Image(systemName: "paperplane")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 18, height: 18, alignment: .top)
                        
                })
            }
            
            HStack(spacing: 4) {
                if thread.replyCount > 0 {
                    let replyText = thread.replyCount == 1 ? "reply" : "replies"
                    Text("\(thread.replyCount) \(replyText)")
                }
                
                if  thread.replyCount > 0 && thread.likes > 0  {
                    Text("-")
                }
                if thread.likes > 0 {
                    let likeText = thread.likes == 1 ? "like" : "likes"
                    Text("\(thread.likes) \(likeText)")
                    
                }
            }.font(.caption)
                .foregroundStyle(Color(.systemGray))
                .padding(.vertical, 4)
            
            
        }.sheet(isPresented: $showReplySheet) {
            ThreadReplyView(thread: thread)
        }
    }
}

#Preview {
    ContentActionButtonView(thread: dev.thread)
}
