
import XCTest

class ButtonObserver {
  var token: NSKeyValueObservation?
  
  func observe(_ button: UIButton, expectation: XCTestExpectation)  {
    
      token = button
      .observe(\.titleLabel?.text, options: [.new], changeHandler: { _, _ in
        expectation.fulfill()
      })
    
    
  }
  
  deinit {
    token?.invalidate()
  }
  
  
}
