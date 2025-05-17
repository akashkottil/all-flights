//
//  Result.swift
//  all-flights
//
//  Created by Akash Kottill on 14/05/25.
//
import SwiftUI

struct Result: View {
    var body: some View {
        NavigationStack{
            ScrollView{
                ZStack{
                    // Background Gradient
                     Color("AppPrimaryColor")
                    .frame(height: UIScreen.main.bounds.height * 0.2)
                    .ignoresSafeArea()
                }
            }
            .padding(.bottom, UIScreen.main.bounds.height * 0.1)

            .ignoresSafeArea()
        }
    }
}


#Preview {
    Result()
}
