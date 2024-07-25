//
//  LoginView.swift
//  Personal3DViewer
//
//  Created by David Potashnik on 7/24/24.
//

import SwiftUI

struct LoginView: View {
    
    @State var loginViewVM = LoginViewVM()
    
    @State private var showAlert = false
    
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
                
                //The below modifiers are used to anticipate the user entering an email.
                //Upon submission the cursor will go to the password field.
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
                        if loginViewVM.isValidEmail && !loginViewVM.loginDisabled {
                            authentication.updateValidation()
                        } else {
                            showAlert = true
                        }
                    }
                
                Button {
                    if loginViewVM.isValidEmail && !loginViewVM.loginDisabled {
                        authentication.updateValidation()
                    } else {
                        showAlert = true
                    }
                } label: {
                    Text("Login")
                        .bold()
                }
                .buttonStyle(BlackButton())
                .shadow(radius: 6)
            }
            .alert(isPresented: $showAlert, content: {
                Alert(title: Text("Please enter a valid email and/or password (password can be anything 😏)"))
            })
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
        //The below is used to hide/reveal the password while user it entering it.
        //Another best practice would be to require a minimum letter count along with the inclusion of
        //special characters or capital letters.
        //Other best practices include: User Tokens -  would be generated everytime the user logs in.
        //MFA - Have at leasts 2 forms of authenticaion like and email and SMS.
        //Using HTTPS protocl when doing API calls during authentication.
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
