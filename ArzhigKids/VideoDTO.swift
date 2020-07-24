import Foundation

struct VideoDTO: Codable {
    let id: Int
    let name: String
    let downloadURL: URL
    let sha256: String
    let description: String?
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
