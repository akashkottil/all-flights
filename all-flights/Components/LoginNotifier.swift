//
//  LoginNotifier.swift
//  all-flights
//
//  Created by Akash Kottill on 14/05/25.
//

import SwiftUI

struct LoginNotifier: View {
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text("Get notified before fare drop")
                    .font(.title)
                    .fontWeight(.bold)
                Text("Lorem ipsum dolor sit amet ")
                    .font(.title3)
                    
                Button(action: {}) {
                    Text("Login")
                        .foregroundColor(.white)
//                        .padding()
                        .padding(.vertical,10)
                        .padding(.horizontal,20)
                        .background(Color("buttonBlue"))
                        .cornerRadius(8)
                }
            }
//            .padding(.leading,20)
            Spacer()
            VStack{
                Image("messageImg")
            }
//            .padding(.trailing,20)
        }
        .padding()
        .background(Color.white)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.gray, lineWidth: 2)
        )
        .cornerRadius(20)
        .padding()
    }
}


#Preview {
    LoginNotifier()
}
