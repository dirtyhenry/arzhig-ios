import Foundation

struct Video: Codable {
    let id: Int
    let name: String
    let downloadURL: URL
    let sha256: String
    let description: String
    let createdAt: Date
    let updatedAt: Date
    
    enum CodingKeys: String, CodingKey {
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case downloadURL = "downloadurl"
        
        case id
        case name
        case sha256
        case description
    }
}

extension Decodable {
    static func loadCollectionFromBundle(
        bundle: Bundle = Bundle.main,
        resource: String? = "videos",
        type: String? = "json"
    ) -> [Self] {
        do {
            let resourcePath = try bundle
                .path(forResource: resource, ofType: type)
                .map { URL(fileURLWithPath: $0) }
                .map { try Data(contentsOf: $0) }
                .map { try JSONDecoder().decode([Self].self, from: $0) }
            if let result = resourcePath {
                return result
            } else {
                fatalError("Coudln't load video collection from bundle.")
            }
        } catch {
            fatalError("Coudln't load video collection from bundle.")
        }
    }
}

