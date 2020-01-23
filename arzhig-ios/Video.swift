import Foundation

class Video {
    enum State {
        case toBeDownloaded
        case downloadInProgress
        case playable
    }
    
    let uuid: String
    let name: String
    let downloadURL: URL
    let description: String?
    var state: State
    var downloadProgress: Progress?
    
    init(dto: VideoDTO) {
        self.uuid = dto.sha256
        self.name = dto.name
        self.downloadURL = dto.downloadURL
        self.description = dto.description
        self.state = .toBeDownloaded
        self.downloadProgress = nil
    }
    
    var stateAsString: String {
        switch state {
        case .downloadInProgress:
            return "download in progress"
        case .playable:
            return "playable"
        case .toBeDownloaded:
            return "to be downloaded"
        }
    }
}

extension Video {
    var filesystemURL: URL {
        let documentsDirectoryURL = try! FileManager.default.url(for: .documentDirectory,
                                                                 in: .userDomainMask,
                                                                 appropriateFor: nil,
                                                                 create: false)
        return documentsDirectoryURL.appendingPathComponent("\(uuid).mp4")
    }
    
    var filesystemPath: String {
        return "\(NSHomeDirectory())/Documents/\(uuid).mp4"
    }
}
