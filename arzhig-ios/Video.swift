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
