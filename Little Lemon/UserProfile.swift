//
//  UserProfile.swift
//  Little Lemon
//
//  Created by Anamarija Jukic on 07.07.2023..
//

import SwiftUI

struct UserProfile: View {
    
    let firstName = UserDefaults.standard.string(forKey: "kFirstName") ?? ""
    let lastName = UserDefaults.standard.string(forKey: "kLastName") ?? ""
    let email = UserDefaults.standard.string(forKey: "kEmail") ?? ""
    
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        
        NavigationView {
            VStack {
                Text("Personal information")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.leading, .trailing, .top], 20)
                    .foregroundColor(Color(red: 51/255, green: 51/255, blue: 51/255))
                    
                Image("profile-image-placeholder")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 100, alignment: .center)
                    .clipped()
                Text(firstName)
                Text(lastName)
                Text(email)
                
                Button {
                    UserDefaults.standard.set(false, forKey: "kIsLoggedIn")
                    self.presentation.wrappedValue.dismiss()
                } label: {
                    Text("Logout")
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color(red: 244/255, green: 206/255, blue: 20/255))
                        .cornerRadius(5)
                }
                .padding([.leading, .trailing])
                
                Spacer()
                
                
            }
        }
        
        .navigationBarItems(
            leading:
                Image("Logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 50),
            trailing:
                    Image("profile-image-placeholder")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 50, height: 50, alignment: .center)
                        .clipped()
                
        )
        
        
        
    }
}

struct UserProfile_Previews: PreviewProvider {
    static var previews: some View {
        UserProfile()
    }
}
