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
            
            HStack {
                Image("Logo")
                    .padding([.leading, .trailing], 60)
                
                Image("profile-image-placeholder")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 25, height: 25, alignment: .center)
                    .clipped()
                
            }
            
            
            VStack {
                HStack {
                    VStack {
                        Text("Little Lemon")
                            .foregroundColor(Color(red: 244/255, green: 206/255, blue: 20/255))
                        Text("Chicago")
                            .foregroundColor(Color(red: 237/255, green: 239/255, blue: 238/255))
                        
                        Text("We are a family owned Mediterranean restaurant, focused on traditional recipes served with a modern twist.")
                            .multilineTextAlignment(.leading)
                            .foregroundColor(Color(red: 237/255, green: 239/255, blue: 238/255))
                        
                        
                    }
                    
                    Image("Hero image")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100, height: 100, alignment: .center)
                        .clipped()
                        .cornerRadius(10)
                }
                
                HStack {
                    Image(systemName: "magnifyingglass.circle.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 40, height: 40)
                        .foregroundColor(Color(red: 237/255, green: 239/255, blue: 238/255))
                    TextField("Search menu", text: $searchText)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.leading)
                        .cornerRadius(8)
                }
                .padding()
                
                
                
            }
            .padding()
            .background(Color(red: 73/255, green: 94/255, blue: 87/255))
            
            
            
            
            
            
            FetchedObjects(predicate: buildPredicate(), sortDescriptors: buildSortDescriptors()) { (dishes: [Dish]) in
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
    
    func buildPredicate() -> NSPredicate {
        if searchText.isEmpty {
            return NSPredicate(value: true)
        } else {
            return NSPredicate(format: "title CONTAINS[cd] %@", searchText)
        }
    }
    
    
}

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
    }
}
