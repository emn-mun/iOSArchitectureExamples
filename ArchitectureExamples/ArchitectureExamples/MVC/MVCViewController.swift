import UIKit

class MVCViewController: UIViewController {

  var person: Person!
  @IBOutlet weak var greetingsLabel: UILabel!
  @IBOutlet weak var showGreetingsButton: UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    person = Person(firstName: "Ben", lastName: "Dover") // just for test
    self.showGreetingsButton.addTarget(self, action: #selector(didTapButton(button:)), for: .touchUpInside)
  }
  
  @objc func didTapButton(button: UIButton) {
    let greeting = "Hello " + self.person.firstName + " " + self.person.lastName
    greetingsLabel.text = greeting
  }
}
