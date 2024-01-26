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
                        .font(.displayFont())
                        .foregroundStyle(Color.primary2)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                        
                        
                    Text("Chicago")
                        .font(.subTitleFont())
                        .foregroundStyle(Color.secondary3)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                    
                    Spacer(minLength: 2)
                    Text("We are a family owned Mediterranean restaurants, focused on traditional recipes served with a modern twist.")
                        .foregroundStyle(Color.secondary3)
                        .font(.leadText())
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
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
        .padding()
        .background(Color.primary1)
        .frame(maxWidth: .infinity, maxHeight: 240)
}

