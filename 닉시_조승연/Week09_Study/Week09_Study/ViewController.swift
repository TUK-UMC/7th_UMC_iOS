import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(gestureView)
        gestureView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    private lazy var gestureView: GestureImageView = {
        let view = GestureImageView()
        view.loadImage(from: "https://i.namu.wiki/i/vGtqBTctd1yTUBhSqEJ3BqwItC1eM1nRkyKhn03FYc-l77ftPcGwGIGojnHA6IjKhL73m8tbBmGI694rX6qKjw.webp")
        return view
    }()
}
