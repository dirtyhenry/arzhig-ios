import Foundation

extension Decodable {
    /// Convenient method to load a collection of decodable objects from
    /// a bundled JSON file.
    static func loadCollectionFromBundle(
        bundle: Bundle = Bundle.main,
        resource: String?,
        type: String? = "json",
        with decoder: JSONDecoder = JSONDecoder()
    ) -> [Self] {
        do {
            let resourcePath = try bundle
                .path(forResource: resource, ofType: type)
                .map { URL(fileURLWithPath: $0) }
                .map { try Data(contentsOf: $0) }
                .map { try decoder.decode([Self].self, from: $0) }
            if let result = resourcePath {
                return result
            } else {
                fatalError("Could not load collection from bundle.")
            }
        } catch {
            fatalError("Could not load collection from bundle: \(error)")
        }
    }
}
