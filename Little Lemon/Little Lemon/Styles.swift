//
//  Styles.swift
//  Little Lemon
//
//  Created by Adrien CHABAUD on 2024-01-26.
//

import Foundation
import SwiftUI

extension Font {
    static func displayFont() -> Font {
        return Font.custom("Markazi Text", size: 42).weight(.medium)
    }
    
    static func subTitleFont() -> Font {
            return Font.custom("Markazi Text", size: 32)
        }
        
    static func leadText() -> Font {
        return Font.custom("Karla", size: 16).weight(.medium)
    }
        
    static func regularText() -> Font {
        return Font.custom("Markazi Text", size: 18)
    }
        
    static func sectionTitle() -> Font {
        return Font.custom("Karla", size: 18).weight(.black)
    }
    
    static func sectionCategories() -> Font {
        return Font.custom("Karla", size: 16).weight(.heavy)
    }
    
    static func paragraphText() -> Font {
        return Font.custom("Karla", size: 14)
    }
    
    static func highlightText() -> Font {
        return Font.custom("Karla", size: 20).weight(.medium)
    }
}

extension Text {
    func onboardingTextStyle() -> some View {
        self
            .frame(maxWidth: .infinity, alignment: .leading)
            .foregroundColor(Color.primary1)
            .font(.custom("Karla-Bold", size: 13))
    }
}

struct ButtonStyleYellow: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity)
            .foregroundStyle(configuration.isPressed ? .white : .black)
            .padding(10)
            .background(configuration.isPressed ? Color.primary1 : Color.primary2)
            .clipShape(RoundedRectangle(cornerRadius: 8.0))
            .padding(.horizontal)
        
    }
}

struct ButtonPrimary: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundStyle(configuration.isPressed ? .white : Color.primary1)
            .padding(10)
            .background(configuration.isPressed ? Color.primary1 : .white)
            .clipShape(RoundedRectangle(cornerRadius: 8.0))
            .overlay(
                RoundedRectangle(cornerRadius: 8.0)
                    .stroke(Color.primary1, lineWidth: 1)
            )
            .padding(.horizontal)
    }
}
