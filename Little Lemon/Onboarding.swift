//
//  Onboarding.swift
//  Little Lemon
//
//  Created by Anamarija Jukic on 07.07.2023..
//

import SwiftUI

let kFirstName = "kFirstName"
let kLastName = "kLastName"
let kEmail = "kEmail"

let kIsLoggedIn = "kIsLoggedIn"


struct Onboarding: View {
    
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var email: String = ""
    
    @State var isLoggedIn: Bool = false
    
    
    var body: some View {
        
        NavigationView {
            VStack {
                
                NavigationLink(destination: Home(), isActive: $isLoggedIn) {
                    EmptyView()
                }
                
                TextField("First Name", text: $firstName)
                TextField("Last Name", text: $lastName)
                TextField("Email", text: $email)
                
                Button {
                    if (!firstName.isEmpty && !lastName.isEmpty && !email.isEmpty) {
                        UserDefaults.standard.set(firstName, forKey: kFirstName)
                        UserDefaults.standard.set(lastName, forKey: kLastName)
                        UserDefaults.standard.set(email, forKey: kEmail)
                        
                        isLoggedIn = true
                        UserDefaults.standard.set(true, forKey: "kIsLoggedIn")
                        
                    } else {
                        // TODO: empty else statement
                    }
                } label: {
                    Text("Register")
                }
                
                
            }
            .onAppear() {
                if (UserDefaults.standard.bool(forKey: "kIsLoggedIn")) {
                    isLoggedIn = true
                }
            }
        }
        
        
        
    }
    
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding()
    }
}
