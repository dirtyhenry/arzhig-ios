import UIKit

class DrawingCoordinator: NSObject {
    let rootViewController: UIViewController
    
    override init() {
        rootViewController = DrawingViewController()
        
        super.init()
    }
    
    func start() {}
}
