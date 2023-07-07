//
//  Home.swift
//  Little Lemon
//
//  Created by Anamarija Jukic on 07.07.2023..
//

import SwiftUI

struct Home: View {
    
    let persistenceController = PersistenceController.shared
    
    var body: some View {
        TabView {
            Menu()
                // different than the exercise due to the error ‼️
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .tabItem {
                    Label("Menu", systemImage: "list.dash")
                }
            
            UserProfile()
                .tabItem {
                    Label("Profile", systemImage: "square.and.pencil")
                }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
