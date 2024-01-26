//
//  Hero.swift
//  Little Lemon
//
//  Created by Adrien CHABAUD on 2024-01-25.
//

import SwiftUI

struct Hero: View {
    var body: some View {
        VStack {
            HStack {
                VStack {
                    Text("Little Lemon")
                    Text("Chicago")
                    Spacer()
                    Text("We are a family owned Mediterranean restaurants, focused on traditional recipes served with a modern twist.")
                }
                Image("Hero_image")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: 120, maxHeight: 140)
                    .clipShape(Rectangle())
                    .cornerRadius(16)
                
                
            }
        }
    }
}

#Preview {
    Hero()
}

