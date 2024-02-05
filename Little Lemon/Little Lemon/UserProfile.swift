//
//  UserProfile.swift
//  Little Lemon
//
//  Created by Adrien CHABAUD on 2024-01-24.
//

import SwiftUI

struct UserProfile: View {
    @State var firstName = UserDefaults.standard.string(forKey: "firstNameKey") ?? " "
    @State var lastName = UserDefaults.standard.string(forKey: "lastNameKey") ?? " "
    @State var email = UserDefaults.standard.string(forKey: "emailKey")  ?? " "
    
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        ScrollView(.vertical) {
            VStack {
                HStack {
                    Image("profile-image-placeholder")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxHeight: 75)
                        .clipShape(Circle())
                        .padding(.trailing)
                    
                    Button(action: {}, label: {Text("Change")})
                        .buttonStyle(ButtonPrimary())
                    Button(action: {}, label: {Text("Delete")})
                        .buttonStyle(ButtonReversed())
                    
                }
                
                VStack {
                    Text("First Name")
                        .onboardingTextStyle()
                    TextField("First Name", text: $firstName)
                }
                
                VStack {
                    Text("Last Name")
                        .onboardingTextStyle()
                    TextField("Last Name", text: $lastName)
                }
                
                VStack {
                    Text("Email")
                        .onboardingTextStyle()
                    TextField("Email", text: $email)
                }
            }
            .textFieldStyle(.roundedBorder)
            .padding()
            
            Button{
                UserDefaults.standard.set(false, forKey: "kIsLoggedIn")
                self.presentation.wrappedValue.dismiss()
            } label: {
                Text("Logout")
            }
            .buttonStyle(ButtonStyleYellow())
            
            Button{
                UserDefaults.standard.set(firstName, forKey: "firstNameKey")
                UserDefaults.standard.set(lastName, forKey: "lastNameKey")
                UserDefaults.standard.set(email, forKey: "emailKey")
            } label: {
                Text("Save Changes")
            }
        }
    }
}

#Preview {
    UserProfile()
}
