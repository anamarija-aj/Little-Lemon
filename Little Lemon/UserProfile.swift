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

    
    var body: some View {
        VStack {
            Text("Personal information")
            Image("profile-image-placeholder")
            Text(firstName)
            Text(lastName)
            Text(email)
        }
    }
}

struct UserProfile_Previews: PreviewProvider {
    static var previews: some View {
        UserProfile()
    }
}
