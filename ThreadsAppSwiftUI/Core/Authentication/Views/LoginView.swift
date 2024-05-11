//
//  LoginView.swift
//  ThreadsAppSwiftUI
//
//  Created by HardiB.Salih on 5/11/24.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    
    
    
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
                    TextField("Enter your email", text: $email)
                        .threadsTextFuildModifier()
                        .textInputAutocapitalization(.none)
                    SecureField("Enter your password", text: $password)
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
                    
                }, label: {
                    Text("Login")
                        .threadsButtonModifier()
                })
                
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
