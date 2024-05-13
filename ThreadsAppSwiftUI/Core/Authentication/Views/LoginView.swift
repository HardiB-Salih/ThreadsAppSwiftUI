//
//  LoginView.swift
//  ThreadsAppSwiftUI
//
//  Created by HardiB.Salih on 5/11/24.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewModel()
    @State private var isSigningIn = false

    var body: some View {
        NavigationStack {
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
                        .textInputAutocapitalization(.none)
                    SecureField("Enter your password", text: $viewModel.password)
                        .threadsTextFuildModifier()
                }
                
                NavigationLink {
                    Text("Forgot Password")
                } label: {
                    Text("Forgot Password?")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .padding(.vertical)
                        .padding(.trailing, 28)
                        .foregroundStyle(.black)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
                
                Button(action: {
                    Task {
                        isSigningIn = true
                        try await viewModel.login()
                        isSigningIn = false
                    }
                }, label: {
                    if isSigningIn {
                        // Show a spinner or activity indicator while signing up
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle())
                            .tint(.white)
                    } else {
                        // Show "Sign Up" text when not signing up
                        Text("Log in")
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
                .animation(.default, value: isSigningIn)
                
//                Button(action: {
//                    Task { try await viewModel.login()}
//                }, label: {
//                    Text("Login")
//                        .threadsButtonModifier()
//                })
                
                Spacer()
                Divider()
                NavigationLink {
                    RegistrationView()
                } label: {
                    HStack(spacing: 3) {
                        Text("Don't have an account?")
                        Text("Sign Up")
                            .fontWeight(.semibold)
                        
                    }
                    .font(.footnote)
                    .foregroundStyle(.black)
                }.padding(.vertical, 16)
                    .navigationBarBackButtonHidden(true)
            }
        }
    }
}

#Preview {
    LoginView()
}
