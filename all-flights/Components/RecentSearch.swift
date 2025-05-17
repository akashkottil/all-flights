import SwiftUI

struct RecentSearch: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                ForEach(0..<5, id: \.self) { _ in
                    VStack(alignment: .leading) {
                        Text("COK - LON")
                            .font(.system(size: 16))
                            .fontWeight(.bold)
                        HStack {
                            Text("Economy")
                            HStack{
                                
                            }
                            .frame(width: 6 , height:6)
                            .background(Color.gray.opacity(0.6))
                            .cornerRadius(100)
                            Text("3 People")
                        }
                        .foregroundColor(Color.gray.opacity(0.8))
                        .fontWeight(.medium)
                        .font(.system(size: 14))
                    }
                    .padding()
                    .background(Color.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray.opacity(0.5), lineWidth: 2)
                    )
                    .cornerRadius(10)
                    
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



