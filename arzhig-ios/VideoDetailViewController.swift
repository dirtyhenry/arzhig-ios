import UIKit
import AVKit
import AVFoundation

class VideoDetailViewController: UIViewController {
    weak var playButton: UIButton?
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = .white
        
        let tmpPlayButton = UIButton(type: .system)
        tmpPlayButton.translatesAutoresizingMaskIntoConstraints = false
        tmpPlayButton.setTitle("👋", for: .normal)
        tmpPlayButton.addTarget(self, action: #selector(playVideo(_:)), for: .touchUpInside)
        
        playButton = tmpPlayButton
        view.addSubview(tmpPlayButton)
        
        NSLayoutConstraint.activate([
            tmpPlayButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            tmpPlayButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    func configureView() {
        // Update the user interface for the detail item.
        if let detail = detailItem {
            if let button = playButton {
                button.setTitle("▶️ \(detail.name)", for: .normal)
            }
        }
    }
    
    @IBAction func playVideo(_ sender: UIButton) {
        if let video = detailItem {
            // Create an AVPlayer, passing it the HTTP Live Streaming URL.
            let player = AVPlayer(url: video.downloadURL)
            
            // Create a new AVPlayerViewController and pass it a reference to the player.
            let controller = AVPlayerViewController()
            controller.player = player
            
            // Modally present the player and call the player's play() method when complete.
            present(controller, animated: true) {
                player.play()
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

