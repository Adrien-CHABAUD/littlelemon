//
//  Onboarding.swift
//  Little Lemon
//
//  Created by Adrien CHABAUD on 2024-01-24.
//

let kFirstName = "firstNameKey"
let kLastName = "lastNameKey"
let kEmail = "emailKey"

let kIsLoggedIn = "kIsLoggedIn"

import SwiftUI

struct Onboarding: View {
    @State var firstName = ""
    @State var lastName = ""
    @State var email = ""
    
    @State var isLoggedIn = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    Header()
                    Hero()
                        .padding()
                        .background(Color.primary1)
                        .frame(maxWidth: .infinity)
                    
                    VStack {
                        Text("First Name*")
                            .onboardingTextStyle()
                        TextField("First Name", text: $firstName)
                        
                        Text("Last Name*")
                            .onboardingTextStyle()
                        TextField("Last Name", text: $lastName)
                        
                        Text("Email*")
                            .onboardingTextStyle()
                        TextField("Email", text: $email)
                            .keyboardType(.emailAddress)
                    }
                    .textFieldStyle(.roundedBorder)
                    .padding()
                    
                    Button(action: {
                        if(!firstName.isEmpty || !lastName.isEmpty || !email.isEmpty && ValidateEmail(email: email)) {
                            
                            UserDefaults.standard.set(firstName, forKey: kFirstName)
                            UserDefaults.standard.set(lastName, forKey: kLastName)
                            UserDefaults.standard.set(email, forKey: kEmail)
                            UserDefaults.standard.set(true, forKey: kIsLoggedIn)
                            isLoggedIn = true
                            
                        } else {
                            isLoggedIn = false
                        }
                    }, label: {
                        Text("Register")
                    })
                    .buttonStyle(ButtonStyleYellow())
                    .navigationDestination(isPresented: $isLoggedIn) {
                        Home()
                    }
                }
            }
            .onAppear(){
                if(UserDefaults.standard.bool(forKey: kIsLoggedIn)){
                    isLoggedIn = true
                }
            }
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
