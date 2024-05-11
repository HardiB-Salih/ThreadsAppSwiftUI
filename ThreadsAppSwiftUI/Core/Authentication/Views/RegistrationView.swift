//
//  RegistrationView.swift
//  ThreadsAppSwiftUI
//
//  Created by HardiB.Salih on 5/11/24.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var fullName = ""
    @State private var userName = ""
    @State private var password = ""
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
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
                TextField("Enter your full name", text: $fullName)
                    .threadsTextFuildModifier()
                TextField("Enter your username", text: $userName)
                    .threadsTextFuildModifier()
                SecureField("Enter your password", text: $password)
                    .threadsTextFuildModifier()
            }
            
            
            Button(action: {
                
            }, label: {
                Text("Sign Up")
                    .threadsButtonModifier()
            }).padding(.vertical)
            
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
