import UIKit

class AppCoordinator: NSObject {
    let window = UIWindow(frame: UIScreen.main.bounds)
    
    let tabBarController: UITabBarController
    
    override init() {
        self.tabBarController = UITabBarController()
        
        super.init()
    }
    
    func start() {
        let videosCoordinator = VideosCoordinator()
        let drawingCoordinator = DrawingCoordinator()
        
        videosCoordinator.splitViewController.tabBarItem = UITabBarItem(title: "📺", image: nil, selectedImage: nil)
        drawingCoordinator.rootViewController.tabBarItem = UITabBarItem(title: "🎨", image: nil, selectedImage: nil)

        tabBarController.viewControllers = [
            videosCoordinator.splitViewController,
            drawingCoordinator.rootViewController
        ]
        
        window.rootViewController = tabBarController
        window.makeKeyAndVisible()
    }
}
