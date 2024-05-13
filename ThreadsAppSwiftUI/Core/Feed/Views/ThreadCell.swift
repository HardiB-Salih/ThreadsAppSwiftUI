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
                    
                    HStack(alignment: .center, spacing: 16) {
                        Button(action: {}, label: {
                            Image(systemName: "heart")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 19, height: 19, alignment: .top)
                                
                        })
                        
                        Button(action: {}, label: {
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
