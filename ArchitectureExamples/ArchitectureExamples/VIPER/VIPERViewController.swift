import UIKit

protocol GreetingView: class {
  func setGreeting(greeting: String)
}

class VIPERViewController: UIViewController, GreetingView {
  @IBOutlet weak var showGreetingButton: UIButton!
  @IBOutlet weak var greetingLabel: UILabel!
  
  var eventHandler: GreetingViewEventHandler!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    showGreetingButton.addTarget(self, action: #selector(didtapButton(button:)), for: .touchUpInside)
    // =========== Setup code; must be set from outside
    let presenter = ViperGreetingPresenter()
    let interactor = GreetingInteractor()
    interactor.output = presenter
    presenter.greetingProvider = interactor
    eventHandler = presenter
    eventHandler.view = self
    // ======================  ======================
  }
  
  @objc func didtapButton(button: UIButton) {
    eventHandler.didTapShowGreetingButton()
  }
  
  func setGreeting(greeting: String) {
    greetingLabel.text = greeting
  }
}
