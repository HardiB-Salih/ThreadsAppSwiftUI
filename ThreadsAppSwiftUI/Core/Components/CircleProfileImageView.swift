//
//  CircleProfileImage.swift
//  ThreadsAppSwiftUI
//
//  Created by HardiB.Salih on 5/13/24.
//

import SwiftUI

struct CircleProfileImageView: View {
    var imageName: String
    var imageSize: CGFloat = 40
    
    var body: some View {
        Image(imageName)
            .resizable()
            .scaledToFill()
            .frame(width: imageSize, height: imageSize)
            .clipShape(Circle())
            .overlay {
                Circle().stroke(Color(.systemGray4), lineWidth: 1.0)
            }
            
    }
}

#Preview {
    CircleProfileImageView(imageName: "image2")
}
