import SwiftUI

struct HomeView: View {
    @State private var showResults = false
    @State private var navigateToAccount = false // Add state for navigation
    
    var body: some View {
        NavigationStack {
            ScrollView {
                ZStack(alignment: .top) {
                    
                    // Background Gradient
                    Color("AppPrimaryColor")
                        .frame(height: UIScreen.main.bounds.height * 0.3)
                        .ignoresSafeArea()
                    
                    VStack(spacing: 16) {
                        Spacer().frame(height: 20)
                        
                        // Header (Logo + Texts)
                        HStack {
                            Image("logoHome")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .cornerRadius(6)
                                .padding(.trailing, 4)
                            
                            Text("All Flights")
                                .font(.title3)
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                            
                            Spacer()
                            
                            // Add tap gesture to navigate to AccountView
                            Image("homeProfile")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .cornerRadius(6)
                                .padding(.trailing, 4)
                                .onTapGesture {
                                    navigateToAccount = true
                                }
                        }
                        .padding(.horizontal,25)
                        
                        // input box
                        SearchInput()
                        
                        
                        
                        // heading
                        HStack{
                            Text("Recent Search")
                                .font(.system(size: 18))
                                .foregroundColor(Color.black)
                                .fontWeight(.semibold)
                            Spacer()
                            Text("Clear All")
                                .foregroundColor(Color("ThridColor"))
                                .font(.system(size: 14))
                                .fontWeight(.bold)
                        }
                        .padding(.horizontal)
                        
                        RecentSearch()
                        
                        HStack{
                            Text("Cheapest Flights")
                                .font(.system(size: 18))
                                .foregroundColor(Color.black)
                                .fontWeight(.semibold)
                            
                            Text("Kochi")
                                .foregroundColor(Color("ThridColor"))
                                .fontWeight(.semibold)
                                .font(.system(size: 18))
                            Image("dropdownIcon")
                               
                            Spacer()
                        }
                        .padding(.horizontal)
                        
                        CheapFlights()
                        FeatureCards()
                        LoginNotifier()
                        
                        ZStack{
                            LinearGradient(
                                gradient: Gradient(colors: [Color("gradientBlueLeft"), Color("gradientBlueRight")]),
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                            HStack{
                                Image("starImg")
                                Spacer()
                                VStack(alignment:.leading){
                                    Text("How do you feel?")
                                        .font(.system(size: 22))
                                        .fontWeight(.bold)
                                    Text("Rate us On Appstore")
                                        .font(.system(size: 14))
                                        .fontWeight(.semibold)
                                }
                                Spacer()
                                Button(action: {}) {
                                    Text("Rate Us")
                                        .font(.system(size: 14))
                                        .fontWeight(.semibold)
                                        .foregroundColor(.white)
                                        .padding(.vertical,10)
                                        .padding(.horizontal,20)
                                        .background(Color("buttonBlue"))
                                        .cornerRadius(10)
                                    
                                }
                            }
                            .padding()
                            
                        }
                        BottomSignature()
                    }
                    .padding(.top, 30)
                }
            }
            .padding(.bottom, UIScreen.main.bounds.height * 0.1)
            .background(Color.gray.opacity(0.06))
            .ignoresSafeArea()
            // Add navigation destination to AccountView
            .navigationDestination(isPresented: $navigateToAccount) {
                AccountView()
            }
        }
        .scrollIndicators(.hidden)
    }
}

#Preview {
    HomeView()
}
