
import Foundation
import Combine

class AutocompleteViewModel: ObservableObject {
    @Published var searchText = ""
    @Published var results: [AutocompleteItem] = []

    private var cancellables = Set<AnyCancellable>()

    init() {
        $searchText
            .debounce(for: .milliseconds(300), scheduler: RunLoop.main)
            .removeDuplicates()
            .sink { [weak self] text in
                guard !text.isEmpty else {
                    self?.results = []
                    return
                }
                self?.fetchSuggestions(for: text)
            }
            .store(in: &cancellables)
    }

    func fetchSuggestions(for query: String) {
        let baseURL = "https://staging.plane.lascade.com/api/autocomplete"
        var components = URLComponents(string: baseURL)!
        components.queryItems = [
            URLQueryItem(name: "search", value: query),
            URLQueryItem(name: "country", value: "IN"),
            URLQueryItem(name: "language", value: "en-GB")
        ]

        guard let url = components.url else {
            print("Invalid URL")
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let decoded = try JSONDecoder().decode(AutocompleteResponse.self, from: data)
                    DispatchQueue.main.async {
                        self.results = decoded.data
                    }
                } catch {
                    print("Decoding error:", error)
                }
            } else if let error = error {
                print("Network error:", error)
            }
        }.resume()
    }
}
