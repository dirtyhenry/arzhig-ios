import UIKit

class VideoDetailViewController: UIViewController {
    weak var detailDescriptionLabel: UILabel?
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = .white
        
        let tmpLabel = UILabel()
        tmpLabel.translatesAutoresizingMaskIntoConstraints = false
        tmpLabel.text = "👋"
        detailDescriptionLabel = tmpLabel
        view.addSubview(tmpLabel)
        
        NSLayoutConstraint.activate([
            tmpLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            tmpLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    func configureView() {
        // Update the user interface for the detail item.
        if let detail = detailItem {
            if let label = detailDescriptionLabel {
                label.text = detail.name
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureView()
    }
    
    var detailItem: Video? {
        didSet {
            // Update the view.
            configureView()
        }
    }
}

