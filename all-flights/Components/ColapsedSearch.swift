import SwiftUI

struct ColapsedSearch: View {
    var body: some View {
        HStack {
            Text("Enter a city")
                .padding(.leading, 10)

            Spacer()

            Button(action: {}) {
                Text("Search")
                    .padding(.horizontal, 15)
                    .padding(.vertical, 5)
            }
            .background(Color("SecondaryColor"))
            .foregroundColor(.white)
            .clipShape(RoundedCorner(radius: 10, corners: [.topRight, .bottomRight])) // Rounded only on the right side
        }
        .padding(.vertical, 5)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.gray, lineWidth: 1)
        )
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .padding(.horizontal, 10)
    }
}

// Helper struct to round only specific corners
struct RoundedCorner: Shape {
    var radius: CGFloat = 10.0
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}

#Preview {
    ColapsedSearch()
}
