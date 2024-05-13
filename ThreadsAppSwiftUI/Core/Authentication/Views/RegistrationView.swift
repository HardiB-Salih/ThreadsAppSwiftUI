//
//  RegistrationView.swift
//  ThreadsAppSwiftUI
//
//  Created by HardiB.Salih on 5/11/24.
//

import SwiftUI

struct RegistrationView: View {
    @StateObject var viewModel = RegistrationViewModel()
    @Environment(\.dismiss) var dismiss
    @State private var isSigningUp = false // Track whether sign-up is in progress
    
    
    var body: some View {
        VStack {
            Spacer()
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .padding()
            
            VStack {
                TextField("Enter your email", text: $viewModel.email)
                    .threadsTextFuildModifier()
                    .textCase(.lowercase)
                    .textInputAutocapitalization(.none)
                SecureField("Enter your password", text: $viewModel.password)
                    .threadsTextFuildModifier()
                TextField("Enter your full name", text: $viewModel.fullname)
                    .threadsTextFuildModifier()
                TextField("Enter your username", text: $viewModel.username)
                    .threadsTextFuildModifier()
                    .textCase(.lowercase)
                    .textInputAutocapitalization(.none)
                
                    
            }
            
            
            
            Button(action: {
                Task {
                    isSigningUp = true
                    try await viewModel.createUser()
                    isSigningUp = false
                }
            }, label: {
                if isSigningUp {
                    // Show a spinner or activity indicator while signing up
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                        .tint(.white)
                } else {
                    // Show "Sign Up" text when not signing up
                    Text("Sign Up")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                }
            })
            
            .disabled(viewModel.areFieldsEmpty())
            .frame(width: UIScreen.main.bounds.width - 40, height: 44)
            .background(viewModel.areFieldsEmpty() ? Color(.darkGray) : .black)
            .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
            .padding(.vertical)
            .animation(.default, value: isSigningUp)
            
            
            Spacer()
            Divider()
            Button(action: {
                dismiss()
            }, label: {
                HStack(spacing: 3) {
                    Text("Alrady have an account?")
                    Text("Sign in")
                        .fontWeight(.semibold)
                    
                }
                .font(.footnote)
                .foregroundStyle(.black)
            }).padding(.vertical)
        }.toolbar(.hidden)
    }
}

#Preview {
    RegistrationView()
}
