//
//  Menu.swift
//  Little Lemon
//
//  Created by Anamarija Jukic on 07.07.2023..
//

import SwiftUI

struct Menu: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @State var searchText = ""
    
    var body: some View {
        VStack {
            Text("Little Lemon")
            Text("Chicago")
            Text("We are a family owned Mediterranean restaurant, focused on traditional recipes served with a modern twist.")
            
            TextField("Search menu", text: $searchText)
            
            FetchedObjects(sortDescriptors: buildSortDescriptors()) { (dishes: [Dish]) in
                List {
                    ForEach(dishes) { dish in
                        
                        let dishTitle = dish.title ?? ""
                        let dishPrice = dish.price ?? ""
                        
                        let dishImage = dish.image ?? ""
                        
                        
                        HStack {
                            
                            HStack {
                                Text(dishTitle)
                                Spacer()
                                Text("$ \(dishPrice)")
                            }.padding(10)
                            
                            Spacer()
                            AsyncImage(url: URL(string: dishImage)) { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(width: 150, height: 150, alignment: .center)
                            
                            
                        }
                        
                    }
                }
                
            }
            
            
        }
        .onAppear {
            getMenuData()
        }
    }
    
    func getMenuData() {
        
        PersistenceController.shared.clear()
        
        let urlString = "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json"
        
        let url = URL(string: urlString)!
        
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                let decoder = JSONDecoder()
                
                if let menuList = try? decoder.decode(MenuList.self, from: data) {
                    // menu list stuff
                    for menuItem in menuList.menu {
                        let dish = Dish(context: viewContext)
                        dish.title = menuItem.title
                        dish.image = menuItem.image
                        dish.price = menuItem.price
                    }
                    try? viewContext.save()
                    
                }
            }
        }
        
        task.resume()
        
    }
    
    func buildSortDescriptors() -> [NSSortDescriptor] {
        return [NSSortDescriptor(key: "title", ascending: true, selector: #selector(NSString.localizedStandardCompare(_:)))]
    }
    
    
}

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
    }
}
