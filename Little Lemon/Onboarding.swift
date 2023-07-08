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
                
                Image("Logo")
                
                HStack {
                    VStack {
                        Text("Little Lemon")
                            .foregroundColor(Color(red: 244/255, green: 206/255, blue: 20/255))
                            .font(.largeTitle)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.bottom, 3)
                        Text("Chicago")
                            .foregroundColor(Color(red: 237/255, green: 239/255, blue: 238/255))
                            .font(.title2)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.bottom, 2)
                        
                        Text("We are a family owned Mediterranean restaurant, focused on traditional recipes served with a modern twist.")
                            .multilineTextAlignment(.leading)
                            .foregroundColor(Color(red: 237/255, green: 239/255, blue: 238/255))
                            .font(.system(size: 15))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.bottom, 10)
                        
                        
                        
                    }
                    
                    Image("Hero image")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 120, height: 120, alignment: .center)
                        .clipped()
                        .cornerRadius(10)
                }
                .padding()
                .background(Color(red: 73/255, green: 94/255, blue: 87/255))
                
                
                
                Text("First Name *")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.leading, .trailing, .top], 20)
                    .foregroundColor(Color(red: 51/255, green: 51/255, blue: 51/255))
                
                TextField("Enter First Name", text: $firstName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .foregroundColor(Color(red: 51/255, green: 51/255, blue: 51/255))
                
                Text("Last Name *")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.leading, .trailing, .top], 20)
                    .foregroundColor(Color(red: 51/255, green: 51/255, blue: 51/255))
                TextField("Enter Last Name", text: $lastName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .foregroundColor(Color(red: 51/255, green: 51/255, blue: 51/255))
                
                Text("Email *")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.leading, .trailing, .top], 20)
                    .foregroundColor(Color(red: 51/255, green: 51/255, blue: 51/255))
                TextField("Enter Email", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .foregroundColor(Color(red: 51/255, green: 51/255, blue: 51/255))
                
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
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color(red: 244/255, green: 206/255, blue: 20/255))
                        .cornerRadius(5)
                }
                .padding([.leading, .trailing])
                
                
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .onAppear {
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
