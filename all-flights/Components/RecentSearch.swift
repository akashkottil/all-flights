import SwiftUI

struct RecentSearch: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                ForEach(0..<5, id: \.self) { _ in
                    VStack(alignment: .leading) {
                        Text("COK - LON")
                            .font(.title3)
                            .fontWeight(.bold)
                        HStack {
                            Text("Economy")
                            Text("3 Peoples")
                        }
                        .foregroundColor(.gray)
                        .fontWeight(.medium)
                    }
                    .padding()
                    .background(Color.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray, lineWidth: 2)
                    )
                    .cornerRadius(10)
                    .shadow(radius: 2) // Optional: adds nice depth
                }
            }
            .padding()
        }
        
    }
}

#Preview {
    RecentSearch()
}

//            heading
//            HStack{
//                Text("Recent Search")
//                    .font(.title)
//                    .foregroundColor(Color.black)
//                    .fontWeight(.medium)
//                Spacer()
//                Text("Clear All")
//                    .foregroundColor(Color.blue)
//                    .fontWeight(.bold)
//            }
//            .padding(.horizontal)



