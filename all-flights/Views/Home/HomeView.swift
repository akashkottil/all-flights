import SwiftUI

struct HomeView: View {
    @State private var showResults = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                ZStack(alignment: .top) {
                    
                    // Background Gradient
                     Color("PrimaryColor")
                    .frame(height: UIScreen.main.bounds.height * 0.3)
                    .ignoresSafeArea()
                    
                    
                    VStack(spacing: 16) {
                        Spacer().frame(height: 20)
                        
                        // Header (Logo + Texts)
                        HStack {
                            Image("logoHome")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .cornerRadius(6)
                                .padding(.trailing, 4)
                            
                            Text("All Flights")
                                .font(.title3)
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                            
                            Spacer()
                            
                            Image("homeProfile")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .cornerRadius(6)
                                .padding(.trailing, 4)
                            
                        }
                        .padding(.horizontal)
                        
//                        input box
                        
                        SearchInput()
////                        
//////                                    heading
                                    HStack{
                                        Text("Recent Search")
                                            .font(.title2)
                                            .foregroundColor(Color.black)
                                            .fontWeight(.medium)
                                        Spacer()
                                        Text("Clear All")
                                            .foregroundColor(Color.blue)
                                            .fontWeight(.bold)
                                    }
                                    .padding(.horizontal)
                        
                    
                        RecentSearch()
                        
                        HStack{
                            Text("Cheapest Flights")
                                .font(.title2)
                                .foregroundColor(Color.black)
                                .fontWeight(.medium)
                            
                            Text("Kochi")
                                .foregroundColor(Color.blue)
                                .fontWeight(.bold)
                            Image("dropdownIcon")
                            Spacer()
                        }
                        .padding(.horizontal)
                        
//                        ResultCard()
                        
                        CheapFlights()
                        FeatureCards()
                        LoginNotifier()
//                        ResultCard()
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
                                        .font(.title3)
                                        .fontWeight(.bold)
                                    Text("Rate us On Appstore")
                                }
                                Spacer()
                                Button(action: {}) {
                                    Text("Rate Us")
                                        .foregroundColor(.white)
                                        .padding(.vertical,10)
                                        .padding(.horizontal,20)
                                        .background(Color("buttonBlue"))
                                        .cornerRadius(10)
                                }
                            }
                            .padding()
                            
                        }
                        
                        
                        
                    }
                    .padding(.top, 30)
                }
            }
            .padding(.bottom, UIScreen.main.bounds.height * 0.1)
            .background(Color.gray.opacity(0.06))
            .ignoresSafeArea()
//            .navigationDestination(isPresented: $showResults) {
//                ResultScreen()
//            }.scrollIndicators(.hidden)
        }
    }
}

#Preview {
    HomeView()
}
