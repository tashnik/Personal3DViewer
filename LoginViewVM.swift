//
//  LoginViewVM.swift
//  Personal3DViewer
//
//  Created by David Potashnik on 7/24/24.
//

import Foundation
import Observation
import SwiftUI

@Observable
class LoginViewVM {
    
    var email: String = ""
    var password: String = ""
    
    //making sure the user enter the email in a valid format - a@b.com
    var isValidEmail: Bool {
        let emailRegex =  "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        
        if emailTest.evaluate(with: email) {
            return true
        } else {
            return false
        }
    }
    
    var loginDisabled: Bool {
        email.isEmpty || password.isEmpty
    }
}


class Authentication: ObservableObject {
    
    @Published var isValidated = false
    
    func updateValidation() {
        withAnimation() {
            isValidated.toggle()
        }
    }
}
