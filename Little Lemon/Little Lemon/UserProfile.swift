//
//  UserProfile.swift
//  Little Lemon
//
//  Created by Adrien CHABAUD on 2024-01-24.
//

import SwiftUI

struct UserProfile: View {
    let firstName = UserDefaults.standard.string(forKey: "firstNameKey")
    let lastName = UserDefaults.standard.string(forKey: "lastNameKey")
    let email = UserDefaults.standard.string(forKey: "emailKey")
    
    var body: some View {
        VStack {
            Text("Personal Information")
            Image("profile-image-placeholder")
            
            Text("\(firstName ?? "")")
            Text("\(lastName ?? "")")
            Text("\(email ?? "")")
        }
    }
}

#Preview {
    UserProfile()
}
