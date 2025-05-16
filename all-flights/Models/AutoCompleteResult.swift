import Foundation

struct AutocompleteItem: Codable, Identifiable {
    let id: String
    let name: String
    let code: String
    let city: String
    let country: String
    let type: String
    
    enum CodingKeys: String, CodingKey {
        case id, name, code, city, country, type
    }
}

struct AutocompleteResponse: Codable {
    let data: [AutocompleteItem]
}
