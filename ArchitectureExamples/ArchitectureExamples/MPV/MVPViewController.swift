import UIKit

protocol GreetingsView: class {
  func setGreeting(greeting: String)
}

class MVPViewController: UIViewController, GreetingsView {
  @IBOutlet weak var showGreetingButton: UIButton!
  @IBOutlet weak var greetingLabel: UILabel!
  var presenter: GreetingViewPresenter!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    showGreetingButton.addTarget(self, action: #selector(didTapButton(button:)), for: .touchUpInside)
    presenter = GreetingPresenter(view: self, person: Person(firstName: "Ben", lastName: "Dover")) // for testing
  }
  
  @objc func didTapButton(button: UIButton) {
    presenter.showGreeting()
  }
  
  func setGreeting(greeting: String) {
    greetingLabel.text = greeting
  }
}
