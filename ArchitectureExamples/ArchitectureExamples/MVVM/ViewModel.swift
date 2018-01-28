import Foundation

protocol GreetingViewModelProtocol: class {
  var greeting: String? { get }
  var greetingDidChange: ((GreetingViewModelProtocol) -> ())? { get set } // function to call when greeting did change
  init(person: Person)
  func showGreeting()
}

class GreetingViewModel: GreetingViewModelProtocol {
  let person: Person
  var greeting: String? {
    didSet {
      greetingDidChange?(self)
    }
  }
  var greetingDidChange: ((GreetingViewModelProtocol) -> ())?
  
  required init(person: Person) {
    self.person = person
  }
  
  func showGreeting() {
    self.greeting = "Hello " + person.firstName + " " + person.lastName
  }
}
