//
//  ThreadCell.swift
//  ThreadsAppSwiftUI
//
//  Created by HardiB.Salih on 5/13/24.
//

import SwiftUI

struct ThreadCell: View {
    
    var body: some View {
        VStack {
            HStack (alignment: .top, spacing: 12) {
                CircleProfileImageView(imageName: "image2")
                
                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        Text("Ginga")
                            .font(.footnote)
                            .fontWeight(.semibold)
                        Spacer()
                        Text("10M")
                            .font(.caption)
                            .foregroundStyle(Color(.systemGray3))
                        
                        Button(action: {}, label: {
                            Image(systemName: "ellipsis")
                                .foregroundStyle(Color(.darkGray))
                        })
                    }
                    
                    Text("New in everything and anything")
                        .font(.footnote)
                        .multilineTextAlignment(.leading)
                    
                    HStack(spacing: 16) {
                        Button(action: {}, label: {
                            Image(systemName: "heart")
                                
                        })
                        
                        Button(action: {}, label: {
                            Image(systemName: "bubble.right")
                                
                        })
                        Button(action: {}, label: {
                            Image(systemName: "arrow.rectanglepath")
                                
                        })
                        Button(action: {}, label: {
                            Image(systemName: "paperplane")
                                
                        })
                    }
                    .foregroundStyle(Color(.black))
                    .padding(.vertical, 8)
                }
            }
            Divider()
        }.padding()
    }
}

#Preview {
    ThreadCell()
}
