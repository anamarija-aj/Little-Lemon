//
//  UserProfile.swift
//  Little Lemon
//
//  Created by Anamarija Jukic on 07.07.2023..
//

import SwiftUI

struct UserProfile: View {
    var body: some View {
        VStack {
            Text("Personal information")
            Image("profile-image-placeholder")
        }
    }
}

struct UserProfile_Previews: PreviewProvider {
    static var previews: some View {
        UserProfile()
    }
}
