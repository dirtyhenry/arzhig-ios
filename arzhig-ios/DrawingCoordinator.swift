import UIKit

class DrawingCoordinator: NSObject, CoordinatorProtocol {
    let rootViewController: UIViewController
    
    override init() {
        rootViewController = DrawingViewController()
        
        super.init()
    }
    
    func start() {}
}
