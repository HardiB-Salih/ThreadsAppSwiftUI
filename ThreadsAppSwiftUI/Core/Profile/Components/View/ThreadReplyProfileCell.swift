//
//  ThreadReplyProfileCell.swift
//  ThreadsAppSwiftUI
//
//  Created by HardiB.Salih on 5/15/24.
//

import SwiftUI

struct ThreadReplyProfileCell: View {
    let reply: ThreadReply
    @State private var threadViewHeight: CGFloat = 24

    
    func setThreadViewHeight() {
        let imageDimention : CGFloat = ProfileImageSize.small.dimention
        let padding: CGFloat = 16
        let width = UIScreen.main.bounds.width - imageDimention - padding
        let font = UIFont.systemFont(ofSize: 12)
        if let thread = reply.thread {
            let captionSize = thread.caption.heightWithConstrainedWidth(width, font: font)
            threadViewHeight = captionSize + imageDimention
        }
//        print("DEBUG: caption size is \(captionSize)")
    }
    
    var body: some View {
        VStack(alignment: .leading){
            if let thread = reply.thread {
                // Thread View
                HStack(alignment: .top) {
                    VStack {
                        CircleProfileImageView(user: thread.user, size: .small)
                        
                        Rectangle()
                            .frame(width: 2, height: threadViewHeight)
                            .foregroundStyle(Color(.systemGray3))
                    }
                    
                    
                    VStack(alignment: .leading, spacing:  12){
                        // Username and caption
                        VStack(alignment: .leading){
                            Text(thread.user?.username ?? "")
                                .fontWeight(.semibold)
                            Text(thread.caption)
                        }.font(.footnote)
                        
                        
                        ContentActionButtonView(thread: thread)
                    }
                    Spacer()
                }
            }
            
            
            HStack (alignment: .top) {
                CircleProfileImageView(user: reply.replyUser, size: .small)
                // Username and caption
                VStack(alignment: .leading){
                    Text(reply.replyUser?.username ?? "")
                        .fontWeight(.semibold)
                    Text(reply.replyText)
                }.font(.footnote)
            }
            
            Divider()
                .padding(.bottom, 8)
            
            
        }
        .padding(.horizontal)
        
        .onAppear{
            setThreadViewHeight()
        }
    }
}

#Preview {
    ThreadReplyProfileCell(reply: dev.reply)
}
