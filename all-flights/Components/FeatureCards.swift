//
//  FeatureCards.swift
//  all-flights
//
//  Created by Akash Kottill on 14/05/25.
//

import SwiftUI

struct FeatureCards: View {
    var body: some View {
        HStack{
            HStack (){
                VStack (alignment: .leading){
                    
                    Image("trackFlight")
                    Text("Track")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(Color("PrimaryColor"))
                    Text("yout Flights")
                        .font(.title3)
                        .fontWeight(.medium)
                        .foregroundColor(Color("PrimaryColor"))
                }
                .padding(.leading,30)
                Spacer()
                
            }
            .frame(width: 175, height: 150)
            .background(Color.blue.opacity(0.06))
            .cornerRadius(30)
            .overlay(
                RoundedRectangle(cornerRadius: 30)
                    .stroke(Color("PrimaryColor"), lineWidth: 1)
            )
            Spacer()
            HStack (){
                VStack (alignment: .leading){
                    
                    Image("exploreFlight")
                    Text("Track")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(Color("PrimaryColor"))
                    Text("yout Flights")
                        .font(.title3)
                        .fontWeight(.medium)
                        .foregroundColor(Color("PrimaryColor"))
                }
                .padding(.leading,30)
                Spacer()
                
            }
            .frame(width: 175, height: 150)
            .background(Color.blue.opacity(0.06))
            .cornerRadius(30)
            .overlay(
                RoundedRectangle(cornerRadius: 30)
                    .stroke(Color("PrimaryColor"), lineWidth: 1)
            )
        }
        .padding()
        
        
        
    }
}


#Preview {
    FeatureCards()
}
