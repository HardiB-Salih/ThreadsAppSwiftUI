//
//  ThreadCell.swift
//  ThreadsAppSwiftUI
//
//  Created by HardiB.Salih on 5/13/24.
//

import SwiftUI

struct ThreadCell: View {
    let thread: Thread
    
    var body: some View {
        VStack {
            HStack (alignment: .top, spacing: 12) {
                CircleProfileImageView(user: thread.user, size: .small)
                
                VStack(alignment: .leading, spacing: 4) {
                    HStack {
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
                    
                    Text(thread.caption)
                        .font(.footnote)
                        .multilineTextAlignment(.leading)
                    
                    ContentActionButtonView(thread: thread)
                        .foregroundStyle(Color(.black))
                        .padding(.vertical, 8)
                }
            }
            Divider()
        }.padding()
    }
}

#Preview {
    ThreadCell(thread: dev.thread)
}
