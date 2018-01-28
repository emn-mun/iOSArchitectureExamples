import Foundation

protocol GreetingOutput: class {
  func receiveGreetingData(greetingData: GreetingData)
}

protocol GreetingViewEventHandler {
  weak var view: GreetingView? { get set }
  func didTapShowGreetingButton()
}

class ViperGreetingPresenter: GreetingOutput, GreetingViewEventHandler {
  weak var view: GreetingView?
  var greetingProvider: GreetingProvider!
  
  func didTapShowGreetingButton() {
    greetingProvider.provideGreetingData()
  }
  
  func receiveGreetingData(greetingData: GreetingData) {
    let greeting = greetingData.greeting + " " + greetingData.subject
    view?.setGreeting(greeting: greeting)
  }
}
