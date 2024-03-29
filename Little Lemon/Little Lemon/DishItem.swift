//
//  DishItem.swift
//  Little Lemon
//
//  Created by Adrien CHABAUD on 2024-01-25.
//

import SwiftUI

struct DishItem: View {
    
    let dish: Dish
    
    var body: some View {
        HStack {
            VStack {
                Text(dish.title ?? "")
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                    .font(.sectionCategories())
                    .foregroundColor(Color.secondary4)
                
                Spacer(minLength: 10)
                
                Text(dish.descriptionDish ?? "")
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                    .font(.paragraphText())
                    .foregroundColor(Color.secondary4)
                
                Spacer(minLength: 5)
                
                Text("$" + (dish.price ?? ""))
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                    .font(.highlightText())
                    .foregroundColor(Color.secondary4)
            }
            
            AsyncImage(url: URL(string: dish.image ?? " ")){ image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                
            } placeholder: {
                ProgressView()
            }
                .frame(maxWidth: 90, maxHeight: 90)
                .clipShape(Rectangle())
        }
        .padding(.vertical)
        .frame(maxHeight: 150)
    }
}

#Preview {
    DishItem(dish: PersistenceController.oneDish())
}
