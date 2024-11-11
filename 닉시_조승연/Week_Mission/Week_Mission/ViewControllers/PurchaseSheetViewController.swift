import UIKit

class PurchaseSheetViewController: UIViewController {

    private let purchaseSheetView = PurchaseSheetView()
    
    override func loadView() {
        view = purchaseSheetView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        purchaseSheetView.closeButton.addTarget(self, action: #selector(dismissPurchaseSheet), for: .touchUpInside)
        setupSizeButtonActions()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let sheet = sheetPresentationController {
            sheet.detents = [.large()]
            sheet.prefersGrabberVisible = true 
        }
    }
    
    private func setupSizeButtonActions() {
        for button in purchaseSheetView.sizeButtons {
            button.addTarget(self, action: #selector(sizeButtonTapped(_:)), for: .touchUpInside)
        }
    }

    @objc private func sizeButtonTapped(_ sender: UIButton) {
        guard sender != purchaseSheetView.selectedSizeButton else { return }

        purchaseSheetView.selectedSizeButton?.layer.borderColor = UIColor.lightGray.cgColor
        sender.layer.borderColor = UIColor.black.cgColor
        purchaseSheetView.selectedSizeButton = sender
    }
    
    @objc private func dismissPurchaseSheet() {
        dismiss(animated: true, completion: nil)
    }
}
