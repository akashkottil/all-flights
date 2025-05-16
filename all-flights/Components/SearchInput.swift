import SwiftUI

// Trip model to handle multiple trips for multi-city
struct Trip: Identifiable {
    var id = UUID()
    var originCode: String
    var originCity: String
    var destinationCode: String
    var destinationCity: String
    var date: Date
}

struct SearchInput: View {
    // State variables
    @State private var tripType: TripType = .returnTrip
    @State private var originCode: String = "COK"
    @State private var originCity: String = "Cochin"
    @State private var destinationCode: String = "DXB"
    @State private var destinationCity: String = "Dubai"
    @State private var startDate: Date = Date()
    @State private var endDate: Date = Calendar.current.date(byAdding: .day, value: 7, to: Date())!
    @State private var adultsCount: Int = 1
    @State private var travelClass: TravelClass = .economy
    @State private var directFlightsOnly: Bool = false
    
    @State private var isLocationSheetOpen: Bool = false
    @State private var isEditingOrigin: Bool = true
    @State private var currentTripIndex: Int = 0
    
    // For multi-city
    @State private var trips: [Trip] = [
        Trip(originCode: "COK", originCity: "Cochin", destinationCode: "DXB", destinationCity: "Dubai", date: Date())
    ]
    
    // For animations
    @Namespace private var animation
    
    // Enum for trip types
    enum TripType: String, CaseIterable {
        case returnTrip = "Return"
        case oneWay = "One way"
        case multiCity = "Multi city"
    }
    
    // Enum for travel classes
    enum TravelClass: String {
        case economy = "Economy"
        case business = "Business"
        case firstClass = "First Class"
    }
    
    var body: some View {
        VStack(spacing: 0) {
            // Trip type selector
            HStack(spacing: 0) {
                ForEach(TripType.allCases, id: \.self) { type in
                    Button(action: {
                        withAnimation(.bouncy()) {
                            tripType = type
                            if type == .multiCity && trips.isEmpty {
                                trips = [Trip(originCode: "COK", originCity: "Cochin", destinationCode: "DXB", destinationCity: "Dubai", date: Date())]
                            }
                        }
                    }
                    ) {
                        Text(type.rawValue)
                            .padding(.vertical, 10)
                            .padding(.horizontal, 15)
                            .background(
                                ZStack {
                                    if tripType == type {
                                        Capsule()
                                            .fill(Color.white)
                                            .matchedGeometryEffect(id: "TAB", in: animation)
                                    }
                                }
                            )
                            .foregroundColor(tripType == type ? Color.blue : Color.black.opacity(0.6))
                    }
                }
            }
            .padding(.vertical, 8)
            
            .background(Color.gray.opacity(0.1))
            .clipShape(Capsule())
            .padding(.horizontal, 10)
            .padding(.top, 10)
            .padding(.horizontal, 30)
            
            if tripType == .multiCity {
                // Multi-city View
                VStack(spacing: 0) {
                    ForEach(0..<trips.count, id: \.self) { index in
                        multiCityTripView(for: index)
                            .background(Color.white)
                            .overlay(
                                HStack {
                                    Spacer()
                                    Button(action: {
                                        withAnimation {
                                            if trips.count > 1 {
                                                trips.remove(at: index)
                                            }
                                        }
                                    }) {
                                        Text("Remove")
                                            .font(.subheadline)
                                            .foregroundColor(.red)
                                    }
                                    .padding(.trailing)
                                    .padding(.top, 5)
                                }
                            )
                    }
                    
                    // Add flight button
                    Button(action: {
                        withAnimation {
                            trips.append(Trip(
                                originCode: "COK",
                                originCity: "Cochin",
                                destinationCode: "DXB",
                                destinationCity: "Dubai",
                                date: Date()
                            ))
                        }
                    }) {
                        HStack {
                            Image(systemName: "plus.circle.fill")
                                .foregroundColor(.blue)
                            Text("Add flight")
                                .foregroundColor(.blue)
                                .fontWeight(.medium)
                        }
                        .padding()
                    }
                }
            } else {
                // Single or Return trip view
                VStack(spacing: 0) {
                    // Origin location selector
                    Button {
                        isEditingOrigin = true
                        isLocationSheetOpen.toggle()
                    } label: {
                        HStack {
                            Image(systemName: "airplane.departure")
                                .foregroundColor(.black)
                                .frame(width: 24)
                            
                            VStack(alignment: .leading) {
                                Text(originCode)
                                    .font(.headline)
                                    .foregroundColor(.black)
                                
                                Text(originCity)
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                            
                            Spacer()
                            
                            Text("Remove")
                                .font(.subheadline)
                                .foregroundColor(.red)
                        }
                        .padding()
                        .background(Color.white)
                    }
                    
                    if tripType == .returnTrip {
                        Divider().padding(.horizontal, 20)
                        
                        // Destination location selector
                        Button {
                            isEditingOrigin = false
                            isLocationSheetOpen.toggle()
                        } label: {
                            HStack {
                                Image(systemName: "airplane.arrival")
                                    .foregroundColor(.black)
                                    .frame(width: 24)
                                
                                VStack(alignment: .leading) {
                                    Text(destinationCode)
                                        .font(.headline)
                                        .foregroundColor(.black)
                                    
                                    Text(destinationCity)
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                }
                                
                                Spacer()
                                
                                Text("Remove")
                                    .font(.subheadline)
                                    .foregroundColor(.red)
                            }
                            .padding()
                            .background(Color.white)
                        }
                    }
                    
                    Divider().padding(.horizontal, 20)
                    
                    // Date selector
                    HStack {
                        Image("CalendarIcon")
                            .foregroundColor(.black)
                            .frame(width: 24)
                        
                        if tripType == .returnTrip {
                            Text(formatDateRange())
                                .font(.subheadline)
                                .foregroundColor(.black)
                        } else {
                            Text(formatSingleDate(startDate))
                                .font(.subheadline)
                                .foregroundColor(.black)
                        }
                        
                        Spacer()
                    }
                    .padding()
                    .background(Color.white)
                }
            }
            
            Divider().padding(.horizontal, 20)
            
            // Passenger and class selector
            HStack {
                Image("profileIcon")
                    .foregroundColor(.black)
                    .frame(width: 24)
                
                Text("\(adultsCount) Adult - \(travelClass.rawValue)")
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
                
                Toggle("", isOn: $directFlightsOnly)
                    .labelsHidden()
                    .toggleStyle(SwitchToggleStyle(tint: .blue))
            }
            .padding(.horizontal)
            
            // Search button
            Button(action: {
                // Search action
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
        .sheet(isPresented: $isLocationSheetOpen) {
            LocationSheet()
        }
        .onAppear {
            // Set up notification observer for location selection
            setupNotificationObserver()
        }
    }
    
    private func setupNotificationObserver() {
        NotificationCenter.default.addObserver(
            forName: Notification.Name("LocationSelected"),
            object: nil,
            queue: .main
        ) { notification in
            if let selectedLocation = notification.object as? AutocompleteItem {
                updateLocation(selectedLocation)
            }
        }
    }
    
    private func updateLocation(_ location: AutocompleteItem) {
        if tripType == .multiCity {
            // Update for multi-city
            if isEditingOrigin {
                trips[currentTripIndex].originCode = location.code
                trips[currentTripIndex].originCity = location.city
            } else {
                trips[currentTripIndex].destinationCode = location.code
                trips[currentTripIndex].destinationCity = location.city
            }
        } else {
            // Update for return or one-way
            if isEditingOrigin {
                originCode = location.code
                originCity = location.city
            } else {
                destinationCode = location.code
                destinationCity = location.city
            }
        }
    }
    
    @ViewBuilder
    func multiCityTripView(for index: Int) -> some View {
        VStack(spacing: 0) {
            // Origin
            Button {
                isEditingOrigin = true
                currentTripIndex = index
                isLocationSheetOpen.toggle()
            } label: {
                HStack {
                    Image(systemName: "airplane.departure")
                        .foregroundColor(.black)
                        .frame(width: 24)
                    
                    VStack(alignment: .leading) {
                        Text(trips[index].originCode)
                            .font(.headline)
                            .foregroundColor(.black)
                        
                        Text(trips[index].originCity)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    
                    Spacer()
                }
                .padding()
                .background(Color.white)
            }
            
            Divider().padding(.horizontal, 20)
            
            // Destination
            Button {
                isEditingOrigin = false
                currentTripIndex = index
                isLocationSheetOpen.toggle()
            } label: {
                HStack {
                    Image(systemName: "airplane.arrival")
                        .foregroundColor(.black)
                        .frame(width: 24)
                    
                    VStack(alignment: .leading) {
                        Text(trips[index].destinationCode)
                            .font(.headline)
                            .foregroundColor(.black)
                        
                        Text(trips[index].destinationCity)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    
                    Spacer()
                }
                .padding()
                .background(Color.white)
            }
            
            Divider().padding(.horizontal, 20)
            
            // Date
            HStack {
                Image(systemName: "calendar")
                    .foregroundColor(.black)
                    .frame(width: 24)
                
                Text(formatSingleDate(trips[index].date))
                    .font(.subheadline)
                    .foregroundColor(.black)
                
                Spacer()
            }
            .padding()
            .background(Color.white)
            
            Divider().padding(.horizontal, 20)
        }
    }
    
    // Helper method to format date range for display
    private func formatDateRange() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE,d MMM"
        
        let startDateStr = dateFormatter.string(from: startDate)
        let endDateStr = dateFormatter.string(from: endDate)
        
        return "\(startDateStr) - \(endDateStr)"
    }
    
    // Helper method to format a single date
    private func formatSingleDate(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE,d MMM"
        return dateFormatter.string(from: date)
    }
}



