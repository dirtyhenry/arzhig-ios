import UIKit
import AVFoundation

class VideosCoordinator: NSObject, CoordinatorProtocol {
    var rootViewController: UIViewController {
        return splitViewController
    }
    
    let splitViewController = UISplitViewController()
    let masterViewController = VideoListViewController()
    let detailViewController = VideoDetailViewController()
    
    var sessionTasks: [URLSessionDownloadTask] = []
    
    override init() {
        super.init()
    }
    
    func start() {
        setUpAudioSession()
        
        let videos = VideoDTO.loadCollectionFromBundle(resource: "videos", with: JSONDecoder.customEncoder())
        masterViewController.delegate = self
        masterViewController.videos = videos
            .map { dto in
                let transformedVideo = Video(dto: dto)
                if FileManager.default.fileExists(atPath: transformedVideo.filesystemPath) {
                    debugPrint("Found video at \(transformedVideo.filesystemPath)")
                    transformedVideo.state = .playable
                } else {
                    debugPrint("Did not find video at \(transformedVideo.filesystemPath)")
                    transformedVideo.state = .toBeDownloaded
                }
                
                return transformedVideo
        }
        
        let masterNavigationController = UINavigationController(rootViewController: masterViewController)
        let detailNavigationController = UINavigationController(rootViewController: detailViewController)
        
        splitViewController.viewControllers = [masterNavigationController, detailNavigationController]
    }
    
    private func setUpAudioSession() {
        let audioSession = AVAudioSession.sharedInstance()
        do {
            try audioSession.setCategory(.playback, mode: .moviePlayback)
        }
        catch {
            print("Setting category to AVAudioSessionCategoryPlayback failed.")
        }
    }
    
    // FIXME: setup proper architecture here!
    func download(video: Video) {
        video.state = .downloadInProgress

        debugPrint("Downloading to \(video.filesystemURL)")
        let downloadTask = URLSession.shared.downloadTask(with: video.downloadURL, completionHandler: { (tempPathURL, urlResponse, error) in
            guard let tempPathURL = tempPathURL, error == nil else {
                video.state = .toBeDownloaded
                return
            }
            
            do {
                try FileManager.default.moveItem(
                    at: tempPathURL,
                    to: video.filesystemURL
                )
                video.state = .playable
                DispatchQueue.main.async {
                    self.masterViewController.tableView.reloadData()
                }
            } catch {
                print("Error: \(error)")
            }
        })
        video.downloadProgress = downloadTask.progress
        sessionTasks.append(downloadTask)
        downloadTask.resume()
        masterViewController.tableView.reloadData()
    }
}

extension VideosCoordinator: VideoListViewControllerDelegate {
    func videoListViewController(_: VideoListViewController, didSelectItem item: Video) {
        // FIXME: setup proper architecture here!
        switch item.state {
        case .toBeDownloaded:
            download(video: item)
        case .downloadInProgress:
            debugPrint("Selected video being downloaded...")
        case .playable:
            detailViewController.detailItem = item
            detailViewController.navigationItem.leftBarButtonItem = splitViewController.displayModeButtonItem
            detailViewController.navigationItem.leftItemsSupplementBackButton = true
            splitViewController.showDetailViewController(detailViewController, sender: self)
        }
    }
}
