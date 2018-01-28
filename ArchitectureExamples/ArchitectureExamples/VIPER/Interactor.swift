import Foundation

struct GreetingData { // Transport data structure (not Entity)
  let greeting: String
  let subject: String
}

protocol GreetingProvider {
  func provideGreetingData()
}

class GreetingInteractor: GreetingProvider {
  weak var output: GreetingOutput!
  func provideGreetingData() {
    let person = Person(firstName: "Ben", lastName: "Dover") // should come from data access layer
    let subject = person.firstName + " " + person.lastName
    let greeting = GreetingData(greeting: "Hello", subject: subject)
    output.receiveGreetingData(greetingData: greeting)
  }
}
