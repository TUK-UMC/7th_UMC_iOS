import UIKit

class HomeUISegmentedControl: UISegmentedControl {

    private let underlineView = UIView()

    init(items: [String]) {
        super.init(items: items)
        selectedSegmentIndex = 0
        setupAppearance()
        setupUnderline()
        removeDivider()
        addTarget(self, action: #selector(segmentChanged), for: .valueChanged)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupAppearance() {
        setBackgroundImage(UIImage(), for: .normal, barMetrics: .default)
        setBackgroundImage(UIImage(), for: .selected, barMetrics: .default)
        setBackgroundImage(UIImage(), for: .highlighted, barMetrics: .default)

        removeDivider()
        
        setTitleTextAttributes(
            [
                NSAttributedString.Key.foregroundColor: UIColor.black,
                .font: UIFont.systemFont(ofSize: 16, weight: .light)
            ],
            for: .normal
        )
        setTitleTextAttributes(
            [
                NSAttributedString.Key.foregroundColor: UIColor.black,
                .font: UIFont.systemFont(ofSize: 16, weight: .bold)
            ],
            for: .selected
        )
    }

    private func removeDivider() {
        setDividerImage(UIImage(), forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)
    }

    private func setupUnderline() {
        underlineView.backgroundColor = .black
        addSubview(underlineView)
        
        updateUnderlinePosition()
    }
    
    private func updateUnderlinePosition() {
        guard let title = titleForSegment(at: selectedSegmentIndex) else { return }
        let titleWidth = (title as NSString).size(withAttributes: [.font: UIFont.boldSystemFont(ofSize: 16)]).width
        let segmentWidth = bounds.width / CGFloat(numberOfSegments)
        let underlineXPosition = segmentWidth * CGFloat(selectedSegmentIndex) + (segmentWidth - titleWidth) / 2
        
        underlineView.frame = CGRect(x: underlineXPosition, y: bounds.height - 2, width: titleWidth, height: 2)
    }

    @objc private func segmentChanged() {
        UIView.animate(withDuration: 0.2) {
            self.updateUnderlinePosition()
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        
        let segmentWidth = bounds.width / CGFloat(numberOfSegments)
        for index in 0..<numberOfSegments {
            setWidth(segmentWidth, forSegmentAt: index)
        }
        
        updateUnderlinePosition()
    }
}
