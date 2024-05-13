//
//  ProfileView.swift
//  ThreadsAppSwiftUI
//
//  Created by HardiB.Salih on 5/12/24.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewModel()
    @State private var selectedFilter: ProfileThreadFilter = .threads
    @Namespace var animation
    
    private var filterBarWidth: CGFloat {
        let count = CGFloat(ProfileThreadFilter.allCases.count)
        return UIScreen.main.bounds.width / count - 20
    }
    
    private var currentUser: User? {
        return viewModel.currentUser
    }
    
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                VStack (spacing: 20){
                    // Profile Image
                    HStack(alignment: .top) {
                        // For Bio and stats
                        VStack(alignment: .leading, spacing: 12) {
                            
                            //Full name and username
                            VStack(alignment: .leading, spacing: 4) {
                                Text(currentUser?.fullname ?? "")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                
                                Text(currentUser?.username ?? "")
                                    .font(.subheadline)
                            }
                            
                            if let bio = currentUser?.bio {
                                Text(bio)
                                    .font(.footnote)
                            }
                            
                            Text("2 Followers")
                                .font(.caption)
                                .foregroundStyle(Color(.gray))
                        }
                        Spacer()
                        CircleProfileImageView(imageName: "image4", imageSize: 60)
                    }
                    
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
                    VStack {
                        HStack {
                            ForEach(ProfileThreadFilter.allCases) { filter in
                                VStack {
                                    Text(filter.title)
                                        .font(.subheadline)
                                        .fontWeight(selectedFilter == filter ? .semibold : .regular)
                                    
                                    if selectedFilter == filter {
                                        Rectangle()
                                            .foregroundStyle(Color(.black))
                                            .frame(width: filterBarWidth, height: 1)
                                            .matchedGeometryEffect(id: "item", in: animation)
                                    } else {
                                        Rectangle()
                                            .foregroundStyle(Color(.clear))
                                            .frame(width: filterBarWidth, height: 1)
                                    }
                                }.onTapGesture {
                                    withAnimation(.spring()) {
                                        selectedFilter = filter
                                    }
                                }
                                
                            }
                        }
                        
                        LazyVStack {
                            ForEach(1 ... 10, id: \.self) { thread in
                                ThreadCell()
                            }
                        }
                    }.padding(.vertical)
                }
            }
            .padding(.horizontal)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Sign out") {
                        AuthService.signOut()
                    }.font(.footnote)
                }
            }
        }
    }
}

#Preview {
    ProfileView()
}
