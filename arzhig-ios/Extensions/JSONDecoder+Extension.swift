import Foundation

extension JSONDecoder {
    static func customEncoder(withDateFormat dateFormat: String = "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ") -> JSONDecoder {
        let res = JSONDecoder()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        res.dateDecodingStrategy = .formatted(dateFormatter)
        return res
    }
}
