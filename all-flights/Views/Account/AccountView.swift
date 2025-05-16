import SwiftUI

struct AccountView:View {
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack{
                    HStack{
                        Button(action: {
                                                    // This will navigate back to the previous screen
                                                    dismiss()
                                                }) {
                                                    Image("BackIcon")
                                                }
                        Spacer()
                        Text("Account")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .padding(.trailing,30)
                        Spacer()
                    }
//                    header ends
                    
                    Divider()
                    
                    VStack(alignment:.leading, spacing: 15){
                        VStack(alignment: .leading){
                            Text("Ready for Takeoff? ")
                                .font(.title)
                                .fontWeight(.bold)
                            Text("Log In Now")
                                .font(.title)
                                .fontWeight(.bold)
                        }
                        Text("Access your profile, manage settings, and view personalized features.")
                            .font(.title3)
                        Button(action: {}) {
                            Text("Login")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding(.vertical,10)
                                .padding(.horizontal,20)
                                .background(Color("buttonBlue"))
                                .cornerRadius(10)
                        }
                        
                        VStack(alignment: .leading){
                            Text("App Settings")
                                .font(.title)
                                .fontWeight(.semibold)
                                
                            HStack {
                                VStack(alignment: .leading) {
                                    Text("Region")
                                        .font(.title3)
                                        .fontWeight(.semibold)
                                    HStack {
                                        Image("flag")
                                        Text("India")
                                    }
                                    Spacer()
                                }
                                Spacer()
                                Image("RightArrow")
                            }
                            .padding(.vertical, 10)
                            .padding(.horizontal, 20)
                            .background(Color.white) // Optional: background color
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.gray, lineWidth: 1)
                            )
                            .cornerRadius(10)
                            
                            HStack {
                                VStack(alignment: .leading) {
                                    Text("Currency")
                                        .font(.title3)
                                        .fontWeight(.semibold)
                                    HStack {
                                        
                                        Text("India")
                                    }
                                    Spacer()
                                }
                                Spacer()
                                Image("RightArrow")
                            }
                            .padding(.vertical, 10)
                            .padding(.horizontal, 20)
                            .background(Color.white) // Optional: background color
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.gray, lineWidth: 1)
                            )
                            .cornerRadius(10)
                            
                            
                            HStack {
                                VStack(alignment: .leading) {
                                    Text("Display")
                                        .font(.title3)
                                        .fontWeight(.semibold)
                                    HStack {
                                        
                                        Text("Light mode")
                                    }
                                    Spacer()
                                }
                                Spacer()
                                Image("RightArrow")
                            }
                            .padding(.vertical, 10)
                            .padding(.horizontal, 20)
                            .background(Color.white) // Optional: background color
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.gray, lineWidth: 1)
                            )
                            .cornerRadius(10)

                            VStack(alignment: .leading){
                                Text("Legal and Info")
                                    .font(.title)
                                    .fontWeight(.semibold)
                                VStack(spacing:10){
                                    HStack {
                                        VStack(alignment: .leading) {
                                            Text("Request a feature")
                                                .font(.title3)
                                                .fontWeight(.semibold)
                                            
                                            Spacer()
                                        }
                                        Spacer()
                                        Image("RightArrow")
                                        
                                    }
                                    Divider()
                                    HStack {
                                        VStack(alignment: .leading) {
                                            Text("Contact us")
                                                .font(.title3)
                                                .fontWeight(.semibold)
                                            
                                            Spacer()
                                        }
                                        Spacer()
                                        Image("RightArrow")
                                        
                                    }
                                    Divider()
                                    HStack {
                                        VStack(alignment: .leading) {
                                            Text("About us")
                                                .font(.title3)
                                                .fontWeight(.semibold)
                                            
                                            Spacer()
                                        }
                                        Spacer()
                                        Image("RightArrow")
                                        
                                    }
                                    Divider()
                                    HStack {
                                        VStack(alignment: .leading) {
                                            Text("Rate our app")
                                                .font(.title3)
                                                .fontWeight(.semibold)
                                            
                                            Spacer()
                                        }
                                        Spacer()
                                        Image("RightArrow")
                                        
                                    }
                                    
                                }.padding(.vertical, 10)
                                    .padding(.horizontal, 20)
                                    .background(Color.white) // Optional: background color
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color.gray, lineWidth: 1)
                                    )
                                    .cornerRadius(10)
                                
                                
                                
                                
                            }
                            
                        }
                    }
                    .padding(.top,20)
                    
                }
                .padding()
                
            }.scrollIndicators(.hidden)
        }
    }
}


#Preview {
    AccountView()
}
