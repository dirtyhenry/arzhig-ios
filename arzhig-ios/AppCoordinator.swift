import UIKit

protocol CoordinatorProtocol: NSObjectProtocol {
    var rootViewController: UIViewController { get }
    
    func start() -> Void
}

class AppCoordinator: NSObject, CoordinatorProtocol {
    var rootViewController: UIViewController {
        return tabBarController
    }
    
    let window = UIWindow(frame: UIScreen.main.bounds)
    
    let videosCoordinator = VideosCoordinator()
    let drawingCoordinator = DrawingCoordinator()
    
    var coordinators: [CoordinatorProtocol] {
        return [videosCoordinator, drawingCoordinator]
    }
    
    let tabBarController: UITabBarController
    
    override init() {
        self.tabBarController = UITabBarController()
        
        super.init()
    }
    
    func start() {
        coordinators.forEach { $0.start() }
        
        videosCoordinator.rootViewController.tabBarItem = UITabBarItem(title: "📺", image: nil, selectedImage: nil)
        drawingCoordinator.rootViewController.tabBarItem = UITabBarItem(title: "🎨", image: nil, selectedImage: nil)

        tabBarController.viewControllers = coordinators.map { $0.rootViewController }

        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
    }
}
