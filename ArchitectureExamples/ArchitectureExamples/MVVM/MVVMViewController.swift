import UIKit

class MVVMViewController: UIViewController {
  @IBOutlet weak var showGreetingButton: UIButton!
  @IBOutlet weak var greetingLabel: UILabel!
  
  var viewModel: GreetingViewModelProtocol! {
    didSet {
      viewModel.greetingDidChange = { [unowned self] viewModel in
        self.greetingLabel.text = viewModel.greeting
      }
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    showGreetingButton.addTarget(self.viewModel, action: #selector(didtapButton(button:)), for: .touchUpInside)
    viewModel = GreetingViewModel(person: Person(firstName: "Ben", lastName: "Dover")) // only for testing
  }
  
  
  @objc func didtapButton(button: UIButton) {
    viewModel.showGreeting()
  }
  
}
