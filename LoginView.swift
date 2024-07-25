//
//  LoginView.swift
//  Personal3DViewer
//
//  Created by David Potashnik on 7/24/24.
//

import SwiftUI

struct LoginView: View {
    
    @State var loginViewVM = LoginViewVM()
    
    @EnvironmentObject var authentication: Authentication
    
    @FocusState private var focus: FocusableField?
    
    var body: some View {
        GroupBox {
            VStack(spacing: 16) {
                Image(systemName: "bonjour")
                     .resizable()
                     .scaledToFit()
                     .frame(width: 100, height: 100)
                
                Text("Famous Robots")
                    .font(.largeTitle)
                    .accentColor(.primary)
                
                TextField("Email", text: $loginViewVM.email)
                    .textContentType(.emailAddress)
                    .autocapitalization(.none)
                    .keyboardType(.emailAddress)
                    .submitLabel(.next)
                    .focused($focus, equals: .email)
                    .onSubmit {
                        focus = .password
                    }
                
                PasswordField(title: "Password", password: $loginViewVM.password)
                    .focused($focus, equals: .password)
                    .submitLabel(.go)
                    .onSubmit {
                        if loginViewVM.isValidEmail {
                            authentication.updateValidation()
                        }
                    }
                
                Button {
                    if loginViewVM.isValidEmail {
                        authentication.updateValidation()
                    }
                } label: {
                    Text("Login")
                        .bold()
                }
                .disabled(loginViewVM.loginDisabled)
                .buttonStyle(BlackButton())
                .shadow(radius: 6)
            }
            .padding()
        }
        .textFieldStyle(.roundedBorder)
        .padding()
    }
}


struct PasswordField: View {
    
    let title: String
    
    @Binding var password: String
    
    @State private var passwordHidden = true
    
    var body: some View {
        ZStack {
            if passwordHidden {
                SecureField(title, text: $password)
            } else {
                TextField(title, text: $password)
                    .disableAutocorrection(true)
            }
            HStack {
                Spacer()
                
                Button {
                    passwordHidden.toggle()
                } label: {
                    Image(systemName: passwordHidden ? "eye.slash" : "eye")
                        .accentColor(.primary)
                }
                .padding(.trailing, 10)
            }
        }
    }
}

enum FocusableField: Hashable {
    case email, password
}
