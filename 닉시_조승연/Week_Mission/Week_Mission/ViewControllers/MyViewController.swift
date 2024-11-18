import UIKit

class MyViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white

        let myView = MyView(frame: self.view.frame)
        myView.viewController = self
        view.addSubview(myView)
        
        myView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
    }
}
