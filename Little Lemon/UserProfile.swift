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
    
    
    @State var showOnboarding = false
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                Group {
                    Text("Personal information")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding([.leading, .trailing, .top], 20)
                        .foregroundColor(Color(red: 51/255, green: 51/255, blue: 51/255))
                    Text("Avatar")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding([.leading, .trailing, .top], 20)
                        .foregroundColor(Color(red: 51/255, green: 51/255, blue: 51/255))
                    
                    HStack {
                        Image("profile-image-placeholder")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 100, height: 100, alignment: .center)
                            .clipped()
                        
                        Button(action: { /* action for each category */ }) {
                            Text("Change")
                                .padding(EdgeInsets(top: 9, leading: 14, bottom: 9, trailing: 14))
                                .background(Color(red: 73/255, green: 94/255, blue: 87/255))
                                .foregroundColor(Color(red: 237/255, green: 239/255, blue: 238/255))
                                .cornerRadius(10)
                        }
                        .padding()
                        
                        Button(action: { /* action for each category */ }) {
                            Text("Remove")
                                .padding(EdgeInsets(top: 9, leading: 14, bottom: 9, trailing: 14))
                                .background(Color.white)
                                .foregroundColor(Color(red: 73/255, green: 94/255, blue: 87/255))
                            
                        }
                        .overlay(
                            RoundedRectangle(cornerRadius: 0) // Adjust corner radius if needed
                                .stroke(Color(red: 73/255, green: 94/255, blue: 87/255), lineWidth: 1)
                        )
                    }
                    
                    
                    Text("First Name")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding([.leading, .trailing, .top], 20)
                        .foregroundColor(Color(red: 51/255, green: 51/255, blue: 51/255))
                    Text(firstName)
                    
                    
                    Text("Last Name")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding([.leading, .trailing, .top], 20)
                        .foregroundColor(Color(red: 51/255, green: 51/255, blue: 51/255))
                    Text(lastName)
                    
                    
                    Text("Email")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding([.leading, .trailing, .top], 20)
                        .foregroundColor(Color(red: 51/255, green: 51/255, blue: 51/255))
                    Text(email)
                    
                }
                
                
                
                Button {
                    UserDefaults.standard.set(false, forKey: "kIsLoggedIn")
                    self.showOnboarding = true
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
                .fullScreenCover(isPresented: $showOnboarding) {
                    Onboarding()
                }
                
                
                
                
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
