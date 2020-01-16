import UIKit

class VideosCoordinator: NSObject {
    let window = UIWindow(frame: UIScreen.main.bounds)
    
    let splitViewController = UISplitViewController()
    let masterViewController = VideoListViewController()
    let detailViewController = VideoDetailViewController()
    
    override init() {
        super.init()
    }
    
    func start() {
        masterViewController.delegate = self
        let masterNavigationController = UINavigationController(rootViewController: masterViewController)
        let detailNavigationController = UINavigationController(rootViewController: detailViewController)
        
        splitViewController.viewControllers = [masterNavigationController, detailNavigationController]

        window.rootViewController = splitViewController
        window.makeKeyAndVisible()
    }
}

extension VideosCoordinator: VideoListViewControllerDelegate {
    func videoListViewController(_: VideoListViewController, didSelectItem item: NSDate) {
        detailViewController.detailItem = item
        detailViewController.navigationItem.leftBarButtonItem = splitViewController.displayModeButtonItem
        detailViewController.navigationItem.leftItemsSupplementBackButton = true
        splitViewController.showDetailViewController(detailViewController, sender: self)
    }
}
