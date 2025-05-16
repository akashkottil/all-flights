import SwiftUI

struct LocationSheet: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var origin: String = ""
    @State private var destination: String = ""
    
    // Use the shared ViewModel
    @StateObject private var viewModel = AutocompleteViewModel()
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Top bar
                HStack {
                    Button(action: {
                        dismiss() // Dismiss the sheet
                    }) {
                        Image("CloseImg")
                    }
                    Spacer()
                    Text("From Where?")
                        .bold()
                        .font(.title2)
                    Spacer()
                }
                
                // Origin input
                HStack {
                    TextField("Origin City, Airport or Place", text: $viewModel.searchText)
                        .padding()
                    Image("locationClose")
                        .padding(.trailing)
                }
                .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))
                .foregroundColor(Color.black.opacity(0.8))
                
                // Destination input
                HStack {
                    TextField("Destination City, Airport or Place", text: $destination)
                        .padding()
                    Image("locationClose")
                        .padding(.trailing)
                }
                .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))
                .foregroundColor(Color.black.opacity(0.8))
                
                // GPS suggestion row
                HStack {
                    Image("gps")
                    Text("Use current Location")
                        .foregroundColor(Color("PrimaryColor"))
                    Spacer()
                }
                
                // Display autocomplete results
                ForEach(viewModel.results) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.code)
                                .font(.headline)
                            Text(item.city)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        Spacer()
                        Text(item.country)
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    .padding()
                    .onTapGesture {
                        // Handle selection
                        NotificationCenter.default.post(
                            name: Notification.Name("LocationSelected"),
                            object: item
                        )
                        dismiss()
                    }
                    Divider()
                }
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .topLeading) // Push content to top
        }
        .background(Color.white)
    }
}

// MARK: - Preview
#Preview {
    LocationSheet()
}
