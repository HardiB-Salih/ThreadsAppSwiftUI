//
//  EditProfileView.swift
//  ThreadsAppSwiftUI
//
//  Created by HardiB.Salih on 5/13/24.
//

import SwiftUI
import PhotosUI

struct EditProfileView: View {
    @State private var bio = ""
    @State private var link = ""
    @State private var isPrivateProfile = false
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: CurrentUserProfileViewModel


    var body: some View {
        NavigationStack {
            ZStack {
                Color(.systemGroupedBackground)
                    .edgesIgnoringSafeArea([.bottom, .horizontal])
                
                VStack {
                    //Name and profile Image
                    HStack {
                        VStack (alignment: .leading){
                            Text("Name")
                                .fontWeight(.semibold)
                            Text("HardiB. Salih")
                                
                        }
                        Spacer()
                        PhotosPicker(selection: $viewModel.selectedItem) {
                            if let image = viewModel.profileImage {
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 40, height: 40)
                                    .clipShape(Circle())
                            } else {
                                CircleProfileImageView(imageName: "image1")
                            }
                        }
                        
                    }
                    Divider()

                    //Bio Field
                    VStack (alignment: .leading){
                        Text("Bio")
                            .fontWeight(.semibold)
                        TextField("Enter your Bio ...", text: $bio, axis: .vertical)
                            
                    }
                    Divider()
                    
                    //Link Field
                    VStack (alignment: .leading){
                        Text("Link")
                            .fontWeight(.semibold)
                        TextField("Add Link...", text: $link, axis: .vertical)
                            
                    }
                    Divider()
                    
                    Toggle("Private Profile", isOn: $isPrivateProfile)
                }
                .font(.footnote)
                .padding()
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                .overlay {
                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                        .stroke(Color(.systemGray4), lineWidth: 1)
                }
                .padding()
                
                
            }
            .navigationTitle("Edit Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") { dismiss() }
                        .font(.subheadline)
                        .foregroundStyle(Color(.black))
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Done") { }
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(Color(.black))
                }
            }
        }
    }
}

#Preview {
    EditProfileView()
}
