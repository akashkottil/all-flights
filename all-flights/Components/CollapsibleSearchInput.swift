import SwiftUI

struct CollapsibleSearchInput: View {
    @StateObject private var viewModel = SearchViewModel()
    @Namespace private var animation
    
    // Binding to external isExpanded state (from HomeView)
        @Binding var isExpanded: Bool
    
    // Scroll offset tracking
    @State private var lastScrollOffset: CGFloat = 0
    @State private var scrollOffset: CGFloat = 0
    
    
    var body: some View {
        ZStack {
            if isExpanded {
                // Expanded search input
                expandedView
                    .transition(.opacity)
            } else {
                // Collapsed search input
                collapsedView
                    .transition(.opacity)
                    .zIndex(1)
            }
        }
        .animation(.spring(), value: isExpanded)
    }
    
    private var expandedView: some View {
        SearchInput()
            .matchedGeometryEffect(id: "searchContainer", in: animation)
    }
    
    private var collapsedView: some View {
        HStack {
            // Route info with icons
            HStack(spacing: 4) {
                Text("\(viewModel.originCode) - \(viewModel.destinationCode)")
                    .matchedGeometryEffect(id: "routeText", in: animation)
                    .font(.system(size: 16, weight: .medium))
                
                Text("· \(viewModel.formatTripDate())")
                    .matchedGeometryEffect(id: "dateText", in: animation)
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
            }
            .padding(.leading, 10)
            .padding(.vertical, 5)
            .matchedGeometryEffect(id: "leftContent", in: animation)

            Spacer()

            // Search button
            Button(action: {
                withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                    isExpanded = true
                }
            }) {
                Text("Search")
                    .foregroundColor(.white)
                    .padding(.horizontal, 15)
                    .padding(.vertical, 5)
            }
            .background(Color.orange)
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
            .matchedGeometryEffect(id: "searchButton", in: animation)
        }
        .padding(.vertical, 8)
        .padding(.horizontal, 10)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                .background(Color.white.cornerRadius(20))
                .matchedGeometryEffect(id: "searchBackground", in: animation)
        )
        .padding(.horizontal)
        .onTapGesture {
            withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                isExpanded = true
            }
        }
    }
}

// Extension for SearchViewModel
extension SearchViewModel {
    func formatTripDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "d MMM"
        return formatter.string(from: startDate)
    }
}


