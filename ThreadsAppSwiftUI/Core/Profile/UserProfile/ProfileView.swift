//
//  ProfileView.swift
//  ThreadsAppSwiftUI
//
//  Created by HardiB.Salih on 5/12/24.
//

import SwiftUI

struct ProfileView: View {
    let user: User
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack (spacing: 20){
                // Profile Image
                ProfileHeaderView(user: user)
                
                Button(action: {
                    
                }, label: {
                    Text("Follow")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(Color(.white))
                        .frame(width: UIScreen.main.bounds.width - 40, height: 32)
                        .background(.black)
                        .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                })
                
                // user content list view
                UserContentListView(user: user)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar(.hidden, for: .tabBar)
        .padding(.horizontal)
        
    }
}

#Preview {
    ProfileView(user: dev.user)
}
