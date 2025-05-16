//
//  RootTabView.swift
//  all-flights
//
//  Created by Akash Kottill on 13/05/25.
//

import SwiftUI

struct RootTabView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }

            FlightListView()
                .tabItem {
                    Label("Flights", systemImage: "airplane")
                }

            ExploreView()
                .tabItem {
                    Label("Explore", systemImage: "globe")
                }

            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
        }
    }
}
