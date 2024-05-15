//
//  ThreadDetailView.swift
//  ThreadsAppSwiftUI
//
//  Created by HardiB.Salih on 5/15/24.
//

import SwiftUI

struct ThreadDetailView: View {
    @StateObject var viewModel : ThreadDetailViewModel
    let thread: Thread
    
    init(thread: Thread) {
        self.thread = thread
        self._viewModel = StateObject(wrappedValue: ThreadDetailViewModel(thread: thread))
    }
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    CircleProfileImageView(user: thread.user, size: .small)
                    
                    Text(thread.user?.username ?? "")
                        .font(.footnote)
                        .fontWeight(.semibold)
                    
                    Spacer()
                    
                    Text(thread.timestamp.timestampString())
                        .font(.caption)
                        .foregroundStyle(Color(.systemGray3))
                    
                    Button(action: {}, label: {
                        Image(systemName: "ellipsis")
                            .foregroundStyle(Color(.darkGray))
                    })
                }
                
                VStack(alignment: .leading, spacing: 12) {
                    Text(thread.caption)
                        .font(.subheadline)
                    
                    ContentActionButtonView(thread: thread)
                }.frame(maxWidth: .infinity , alignment: .leading)
            }
            
            Divider()
                .padding(.vertical)
            
            LazyVStack {
                ForEach(viewModel.replies) { reply in
                    ThreadReplyCell(reply: reply)
                }
            }
            
            
            
        }
        .padding()
        .scrollIndicators(.hidden)
        .navigationTitle("Thread")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ThreadDetailView(thread: dev.thread)
}
