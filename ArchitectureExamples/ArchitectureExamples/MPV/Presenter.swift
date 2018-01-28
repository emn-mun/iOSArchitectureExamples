import Foundation

protocol GreetingViewPresenter {
  init(view: GreetingsView, person: Person)
  func showGreeting()
}

class GreetingPresenter: GreetingViewPresenter {
  unowned let view: GreetingsView
  let person: Person
  
  required init(view: GreetingsView, person: Person) {
    self.view = view
    self.person = person
  }
  
  func showGreeting() {
    let greeting = "Hello " + self.person.firstName + " " + self.person.lastName
    view.setGreeting(greeting: greeting)
  }
}
