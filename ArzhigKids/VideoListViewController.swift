import UIKit

protocol VideoListViewControllerDelegate: NSObjectProtocol {
    func videoListViewController(_: VideoListViewController, didSelectItem item: Video)
}

class VideoListViewController: UITableViewController {
    weak var delegate: VideoListViewControllerDelegate?
    
    var videos = [Video]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationItem.leftBarButtonItem = editButtonItem

        // Register
        tableView.register(VideoCell.self, forCellReuseIdentifier: "VideoCell")
    }

    override func viewWillAppear(_ animated: Bool) {
        clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }

    // MARK: - Table View

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "VideoCell", for: indexPath) as? VideoCell else {
            fatalError("Couldn't dequeue a cell with the given identifier.")
        }
        let video = videos[indexPath.row]
        cell.headlineLabel.text = video.name
        cell.bodyLabel.text = video.stateAsString
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let video = videos[indexPath.row]
        delegate?.videoListViewController(self, didSelectItem: video)
    }
}

