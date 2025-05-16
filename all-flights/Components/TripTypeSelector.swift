import SwiftUI

struct TripTypeSelector: View {
    @ObservedObject var viewModel: SearchViewModel
    let namespace: Namespace.ID
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(TripType.allCases, id: \.self) { type in
                Button(action: {
                    viewModel.selectTripType(type)
                }) {
                    Text(type.rawValue)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 15)
                        .background(
                            ZStack {
                                if viewModel.tripType == type {
                                    Capsule()
                                        .fill(Color.white)
                                        .matchedGeometryEffect(id: "TAB", in: namespace)
                                }
                            }
                        )
                        .foregroundColor(viewModel.tripType == type ? Color.blue : Color.black.opacity(0.6))
                }
            }
        }
        .padding(.vertical, 8)
        .background(Color.gray.opacity(0.1))
        .clipShape(Capsule())
        .padding(.horizontal, 25) // Increased horizontal padding
        .padding(.top, 10)
        .padding(.horizontal, 30)
    }
}
