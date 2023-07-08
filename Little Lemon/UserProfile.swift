//
//  UserProfile.swift
//  Little Lemon
//
//  Created by Anamarija Jukic on 07.07.2023..
//

import SwiftUI

struct UserProfile: View {
    
    var firstName = UserDefaults.standard.string(forKey: "kFirstName") ?? ""
    var lastName = UserDefaults.standard.string(forKey: "kLastName") ?? ""
    var email = UserDefaults.standard.string(forKey: "kEmail") ?? ""
    
    
    @State var tempFirstName = ""
    @State var tempLastName = ""
    @State var tempEmail = ""
    
    
    
    @Environment(\.presentationMode) var presentation
    
    
    @State var showOnboarding = false
    
    
    @State private var orderStatusChecked = false
    @State private var passwordChangesChecked = false
    @State private var specialOffersChecked = false
    @State private var newsletterChecked = false
    
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                Group {
                    Text("Personal information")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding([.leading, .trailing], 20)
                        .padding(.top, 5)
                        .foregroundColor(Color(red: 51/255, green: 51/255, blue: 51/255))
                    Text("Avatar")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding([.leading, .trailing], 20)
                        .padding(.top, 5)
                        .foregroundColor(Color(red: 51/255, green: 51/255, blue: 51/255))
                        .font(.system(size: 13) .bold())
                    
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
                    
                    Text("First name")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding([.leading, .trailing], 20)
                        .padding(.top, 2)
                        .foregroundColor(Color(red: 51/255, green: 51/255, blue: 51/255))
                        .font(.system(size: 13) .bold())
                    
                    
                    TextField("First Name", text: $tempFirstName)
                        .onAppear() {
                            self.tempFirstName = self.firstName
                        }
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(2)
                    
                    
                    Text("Last name")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding([.leading, .trailing], 20)
                        .foregroundColor(Color(red: 51/255, green: 51/255, blue: 51/255))
                        .font(.system(size: 13) .bold())
                    
                    TextField("Last Name", text: $tempLastName)
                        .onAppear() {
                            self.tempLastName = self.lastName
                        }
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(5)
                    
                    
                    Text("Email")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding([.leading, .trailing], 20)
                        .padding(.top, 2)
                        .foregroundColor(Color(red: 51/255, green: 51/255, blue: 51/255))
                        .font(.system(size: 13) .bold())
                    
                    TextField("Email", text: $tempEmail)
                        .onAppear() {
                            self.tempEmail = self.email
                        }
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(5)
                    
                    
                    
                    
                }
                
                Text("Email notifications")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.leading, .trailing, .top], 20)
                    .padding(.bottom, 5)
                    .foregroundColor(Color(red: 51/255, green: 51/255, blue: 51/255))
                
                VStack {
                    
                    Toggle(isOn: $orderStatusChecked) {
                        Text("Order statuses")
                    }
                    .toggleStyle(iOSCheckboxToggleStyle())
                    
                    
                    
                    Toggle(isOn: $passwordChangesChecked) {
                        Text("Password changes")
                    }
                    .toggleStyle(iOSCheckboxToggleStyle())
                    
                    
                    Toggle(isOn: $specialOffersChecked) {
                        Text("Special offers")
                    }
                    .toggleStyle(iOSCheckboxToggleStyle())
                    
                    
                    Toggle(isOn: $newsletterChecked) {
                        Text("Newsletter")
                    }
                    .toggleStyle(iOSCheckboxToggleStyle())
                    
                }
                .foregroundColor(Color(red: 51/255, green: 51/255, blue: 51/255))
                .padding(.leading, 20)
                .padding(.bottom, 30)
                .frame(maxWidth: .infinity, alignment: .leading)
                
                
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
                
                
                
                
                HStack {
                    
                    Button(action: {
                        self.tempFirstName = self.firstName
                        self.tempLastName = self.lastName
                        self.tempEmail = self.email
                        self.endEditing()
                    }) {
                        Text("Discard changes")
                            .padding(EdgeInsets(top: 14, leading: 19, bottom: 14, trailing: 19))
                            .background(Color.white)
                            .foregroundColor(Color(red: 73/255, green: 94/255, blue: 87/255))
                        
                    }
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color(red: 73/255, green: 94/255, blue: 87/255), lineWidth: 1)
                    )
                    
                    Button(action: {
                        
                        UserDefaults.standard.set(self.tempFirstName, forKey: "kFirstName")
                        UserDefaults.standard.set(self.tempLastName, forKey: "kLastName")
                        UserDefaults.standard.set(self.tempEmail, forKey: "kEmail")
                        self.endEditing()
                    }) {
                        Text("Save changes")
                            .padding(EdgeInsets(top: 14, leading: 19, bottom: 14, trailing: 19))
                            .background(Color(red: 73/255, green: 94/255, blue: 87/255))
                            .foregroundColor(Color(red: 237/255, green: 239/255, blue: 238/255))
                            .cornerRadius(10)
                    }
                }
                .padding(.top, 17)
                
                
                
                
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
    
    private func endEditing() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct UserProfile_Previews: PreviewProvider {
    static var previews: some View {
        UserProfile()
    }
}
