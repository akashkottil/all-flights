import SwiftUI

struct AccountView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    // Login section
                    loginSection
                    
                    // App settings section
                    appSettingsSection
                    
                    // Legal and Info section
                    legalAndInfoSection
                }
                .padding(.horizontal)
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Account")
                        .font(.headline)
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.black)
                    }
                }
            }
            .background(Color(UIColor.systemGroupedBackground))
        }
    }
    
    // MARK: - Login Section
    private var loginSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Ready for Takeoff?")
                .font(.title2)
                .fontWeight(.bold)
            
            Text("Log In Now")
                .font(.title3)
                .fontWeight(.bold)
            
            Text("Access your profile, manage settings, and view personalized features.")
                .font(.subheadline)
                .foregroundColor(.secondary)
                .padding(.top, 2)
            
            Button(action: {
                // Handle login action
            }) {
                Text("Login")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(.horizontal, 24)
                    .padding(.vertical, 12)
                    .background(Color.blue)
                    .cornerRadius(8)
            }
            .padding(.top, 8)
        }
        .padding(.top, 8)
    }
    
    // MARK: - App Settings Section
    private var appSettingsSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("App settings")
                .font(.headline)
                .padding(.bottom, 2)
            
            SettingsRow(
                icon: AnyView(
                    Image("indiaFlag")
                        .resizable()
                        .frame(width: 24, height: 16)
                ),
                title: "Region",
                value: "India"
            )
            
            SettingsRow(
                icon: nil,
                title: "Currency",
                value: "Rupee"
            )
            
            SettingsRow(
                icon: nil,
                title: "Display",
                value: "Light mode"
            )
        }
        .padding(.top, 8)
    }
    
    // MARK: - Legal and Info Section
    private var legalAndInfoSection: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Legal and Info")
                .font(.headline)
                .padding(.bottom, 16)
            
            VStack(spacing: 0) {
                NavigationLink(destination: EmptyView()) {
                    HStack {
                        Text("Request a feature")
                            .foregroundColor(.black)
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundColor(.gray)
                    }
                    .padding(.vertical, 16)
                }
                
                Divider()
                
                NavigationLink(destination: EmptyView()) {
                    HStack {
                        Text("Contact us")
                            .foregroundColor(.black)
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundColor(.gray)
                    }
                    .padding(.vertical, 16)
                }
                
                Divider()
                
                NavigationLink(destination: EmptyView()) {
                    HStack {
                        Text("Privacy policy")
                            .foregroundColor(.black)
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundColor(.gray)
                    }
                    .padding(.vertical, 16)
                }
                
                Divider()
                
                NavigationLink(destination: EmptyView()) {
                    HStack {
                        Text("About us")
                            .foregroundColor(.black)
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundColor(.gray)
                    }
                    .padding(.vertical, 16)
                }
                
                Divider()
                
                NavigationLink(destination: EmptyView()) {
                    HStack {
                        Text("Rate our app")
                            .foregroundColor(.black)
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundColor(.gray)
                    }
                    .padding(.vertical, 16)
                }
            }
            .background(Color.white)
            .cornerRadius(12)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.gray.opacity(0.2), lineWidth: 1)
            )
        }
    }
}

// Helper component for settings rows
struct SettingsRow: View {
    let icon: AnyView?
    let title: String
    let value: String
    
    var body: some View {
        NavigationLink(destination: EmptyView()) {
            HStack {
                if let icon = icon {
                    icon
                        .padding(.trailing, 8)
                }
                
                Text(title)
                    .foregroundColor(.black)
                
                Spacer()
                
                Text(value)
                    .foregroundColor(.gray)
                
                Image(systemName: "chevron.right")
                    .foregroundColor(.gray)
                    .font(.caption)
            }
            .padding(.vertical, 12)
            .padding(.horizontal, 16)
            .background(Color.white)
            .cornerRadius(12)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.gray.opacity(0.2), lineWidth: 1)
            )
        }
    }
}

// Preview
struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
