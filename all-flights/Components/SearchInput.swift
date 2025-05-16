import SwiftUI

struct SearchInput: View {
    @StateObject private var viewModel = SearchViewModel()
    @Namespace private var animation
    
    var body: some View {
        VStack(spacing: 0) {
            // Trip type selector
            TripTypeSelector(viewModel: viewModel, namespace: animation)
            
            // Selected trip view
            if viewModel.tripType == .multiCity {
                MultiCityView(viewModel: viewModel)
            } else {
                SingleTripView(viewModel: viewModel)
            }
            
            Divider().padding(.horizontal, 20)
            
            // Passenger and class selector
            HStack {
                Image("profileIcon")
                    .foregroundColor(.black)
                    .frame(width: 24)
                
                Text("\(viewModel.adultsCount) Adult - \(viewModel.travelClass.rawValue)")
                    .font(.subheadline)
                    .foregroundColor(.black)
                
                Spacer()
            }
            .padding()
            .background(Color.white)
            
            Spacer()
            
            // Direct flights toggle
            HStack {
                Text("Direct flights only")
                    .font(.subheadline)
                    .foregroundColor(.black)
                
                Spacer()
                
                Toggle("", isOn: $viewModel.directFlightsOnly)
                    .labelsHidden()
                    .toggleStyle(SwitchToggleStyle(tint: .blue))
            }
            .padding(.horizontal)
            
            // Search button
            Button(action: {
                viewModel.search()
            }) {
                Text("Search Flights")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.orange)
                    .cornerRadius(10)
            }
            .padding()
        }
        .background(Color.white)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.orange, lineWidth: 1)
        )
        .padding()
        // In the SearchInput.swift file, update the sheet presentation:
        .sheet(isPresented: $viewModel.isLocationSheetOpen) {
            LocationSheet(
                isOrigin: viewModel.isEditingOrigin,
                onLocationSelected: { location in
                    viewModel.handleLocationSelection(location)
                }
            )
        }
    }
}

// Preview
struct SearchInput_Previews: PreviewProvider {
    static var previews: some View {
        SearchInput()
            .previewLayout(.sizeThatFits)
            .padding()
            .background(Color.blue.opacity(0.1))
    }
}
