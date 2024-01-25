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
                Text(dish.descriptionDish ?? "")
                Text("$" + (dish.price ?? ""))
                
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
        }
    }
}

#Preview {
    DishItem(dish: PersistenceController.oneDish())
}
