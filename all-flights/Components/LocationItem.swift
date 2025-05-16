import SwiftUI

struct LocationItem: View {
    let icon: String
    let code: String
    let city: String
    let showRemoveButton: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                Image(systemName: icon)
                    .foregroundColor(.black)
                    .frame(width: 24)
                
                VStack(alignment: .leading) {
                    Text(code)
                        .font(.headline)
                        .foregroundColor(.black)
                    
                    Text(city)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                
                Spacer()
                
                if showRemoveButton {
                    Text("Remove")
                        .font(.subheadline)
                        .foregroundColor(.red)
                }
            }
            .padding()
            .background(Color.white)
        }
    }
}
