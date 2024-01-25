//
//  Home.swift
//  Little Lemon
//
//  Created by Adrien CHABAUD on 2024-01-24.
//

import SwiftUI

struct Home: View {
    var body: some View {
        TabView {
            Menu().tabItem { Label("Menu", systemImage: "list.dash") }
        }
    }
}

#Preview {
    Home()
}
