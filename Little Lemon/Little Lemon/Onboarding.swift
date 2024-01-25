//
//  Onboarding.swift
//  Little Lemon
//
//  Created by Adrien CHABAUD on 2024-01-24.
//

let kFirstName = "firstNameKey"
let kLastName = "lastNameKey"
let kEmail = "EmailKey"

import SwiftUI

struct Onboarding: View {
    @State var firstName = ""
    @State var lastName = ""
    @State var email = ""
    
    var body: some View {
        VStack {
            TextField("First Name", text: $firstName)
            TextField("Last Name", text: $lastName)
            TextField("Email", text: $email)
            
            Button(action: {
                if(firstName.isEmpty || lastName.isEmpty || email.isEmpty) {
                    // TO-DO: One of the TextField is empty
                    
                } else {
                    
                    if(ValidateEmail(email: email)) {
                        UserDefaults.standard.set(firstName, forKey: kFirstName)
                        UserDefaults.standard.set(lastName, forKey: kLastName)
                        UserDefaults.standard.set(email, forKey: kEmail)
                    } else {
                        // TO-DO: Email is not correct
                    }
                }
            }, label: {
                Text("Register")
            })
        }
    }
    
    func ValidateEmail(email: String) -> Bool {
        
        let regexValue = try! NSRegularExpression(pattern: "^[A-Za-z](.*)([@])(.+)(\\.)(.+)")
        
        return regexValue.firstMatch(in: email, options: [], range: NSRange(location: 0, length: email.count)) != nil
    }
}

#Preview {
    Onboarding()
}
