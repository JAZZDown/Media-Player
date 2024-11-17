import UIKit
import AVFoundation

class ViewController: UIViewController {
    private var player: AVPlayer?
    private let mediaURL = "http://127.0.0.1:5000/media"  // Flask server endpoint

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        fetchMediaMetadata()
        playMedia()
    }

    private func setupUI() {
        view.backgroundColor = .white
        let playButton = UIButton(type: .system)
        playButton.setTitle("Play", for: .normal)
        playButton.addTarget(self, action: #selector(playMedia), for: .touchUpInside)
        playButton.frame = CGRect(x: 100, y: 200, width: 100, height: 50)
        view.addSubview(playButton)
    }

    @objc private func playMedia() {
        guard let url = URL(string: mediaURL) else { return }
        player = AVPlayer(url: url)
        player?.play()
    }

    private func fetchMediaMetadata() {
        let url = URL(string: "http://127.0.0.1:5000/metadata")!
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print("Failed to fetch metadata: \(error)")
                return
            }
            guard let data = data, let metadata = String(data: data, encoding: .utf8) else { return }
            print("Media Metadata: \(metadata)")
        }
        task.resume()
    }
}
