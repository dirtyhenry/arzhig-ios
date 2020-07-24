@testable import Arzhig
import XCTest

class DecodableExtensionTests: XCTestCase {
    func testLoadCollectionFromBundle() {
        let videos = VideoDTO.loadCollectionFromBundle(
            bundle: Bundle(for: DecodableExtensionTests.self),
            resource: "videos-for-tests",
            with: JSONDecoder.customEncoder())
        
        XCTAssertEqual(videos.count, 1000)
        
        guard let firstVideo = videos.first else {
            XCTFail("Couldn't fetch first video")
            return
        }
        
        XCTAssertEqual(firstVideo.id, 1)
        XCTAssertEqual(firstVideo.name, "Bowip gotec fooz.")
        XCTAssertEqual(firstVideo.downloadURL.absoluteString, "http://nomow.gg/do")
        XCTAssertEqual(firstVideo.sha256, "82331b5bbb6a4dad2eb5f86232a3d6c1b54cc7b40dc032efa9130d1570c45725")
        XCTAssertEqual(firstVideo.description, "Jozi rik kenbeim ijgokada dijuvu cedumu tereja mene regre rumohelas nuc ini hocdezeba vase bothip.")
        XCTAssertEqual(firstVideo.createdAt, Date(timeIntervalSince1970: 2885958316.774))
        XCTAssertEqual(firstVideo.updatedAt, Date(timeIntervalSince1970: 1960278957.973))
    }

    func testLoadCollectionFromBundlePerformance() {
        self.measure {
            _ = VideoDTO.loadCollectionFromBundle(
            bundle: Bundle(for: DecodableExtensionTests.self),
            resource: "videos-for-tests",
            with: JSONDecoder.customEncoder())
        }
    }

}
