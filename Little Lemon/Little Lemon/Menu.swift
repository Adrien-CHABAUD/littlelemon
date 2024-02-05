//
//  Menu.swift
//  Little Lemon
//
//  Created by Adrien CHABAUD on 2024-01-24.
//

import SwiftUI

struct Menu: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @State var searchText = ""
    @State var startersEnabled = true
    @State var mainEnabled = true
    @State var drinkEnabled = true
    @State var dessertEnabled = true
    
    var body: some View {
        NavigationStack {
            VStack {
                Header()
                
                VStack {
                    Hero()
                        .frame(maxHeight: 180)
                    
                    TextField("Search Menu", text: $searchText)
                        .textFieldStyle(.roundedBorder)

                }
                .padding()
                .background(Color.primary1)
                
                Text("Order for DELIVERY!")
                    .font(.sectionTitle())
                    .foregroundStyle(.secondary4)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top)
                    .padding(.leading)
                
                ScrollView(.horizontal){
                    HStack {
                        Toggle("Starters", isOn: $startersEnabled)
                        Toggle("Main", isOn: $mainEnabled)
                        Toggle("Desserts", isOn: $dessertEnabled)
                        Toggle("Drinks", isOn: $drinkEnabled)
                    }
                    .toggleStyle(CustomToggle())
                    .padding(.horizontal)
                }
                
                FetchedObjects(predicate: buildPredicate(), sortDescriptors: buildSortDescriptors()) { (dishes: [Dish]) in
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
    
    func buildPredicate() -> NSPredicate {
        if(!searchText.isEmpty){
            return NSPredicate(format: "title CONTAINS[cd] %@", searchText)
        }
        return NSPredicate(value: true)
    }
}

#Preview {
    Menu().environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
}
