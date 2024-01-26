//
//  Menu.swift
//  Little Lemon
//
//  Created by Adrien CHABAUD on 2024-01-24.
//

import SwiftUI

struct Menu: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    var body: some View {
        NavigationStack {
            VStack {
                VStack {
                    Text("Little Lemon")
                    Text("Chicago")
                    Text("We are a family owned Mediterranean restaurant, focused on traditional recipes served with a modern twist.")
                }
                
                FetchedObjects(sortDescriptors: buildSortDescriptors()) { (dishes: [Dish]) in
                    List {
                        ForEach(dishes) { dish in
                            DishItem(dish: dish)
                        }
                    }
                }
            }
        }.onAppear(){
            getMenuData()
        }
    }
    
    func getMenuData(){
        PersistenceController.shared.clear()
        
        let url = URL(string: "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json")!
        
        let urlRequest = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: urlRequest) {data,response,error in
            if let data = data {
                
                if let fullMenu = try? JSONDecoder().decode(MenuList.self, from: data){
                    for dish in fullMenu.menu {
                        let newDish = Dish(context: viewContext)
                        newDish.title = dish.title
                        newDish.price = dish.price
                        newDish.descriptionDish = dish.description
                        newDish.category = dish.category
                        newDish.image = dish.image
                    }
                    try? viewContext.save()
                }
                
            } else if let error = error {
                print("HTTP Request Failed \(error)")
            }
        }
        
        task.resume()
    }
    
    func buildSortDescriptors() -> [NSSortDescriptor]{
        return [NSSortDescriptor(key: "title", ascending: true, selector: #selector(NSString.localizedStandardCompare))]
    }
}

#Preview {
    Menu().environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
}
