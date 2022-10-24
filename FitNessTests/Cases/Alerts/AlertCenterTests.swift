
import XCTest
@testable import FitNess

class AlertCenterTests: XCTestCase {
  //swiftlint:disable implicitly_unwrapped_optional
  var sut: AlertCenter!

  override func setUpWithError() throws {
    try super.setUpWithError()
    sut = AlertCenter()
  }

  override func tearDownWithError() throws {
    sut = nil
    try super.tearDownWithError()
  }
  
  func testPostOne_generatesANotification() {
    
    // given
    let exp = expectation(
      forNotification: AlertNotification.name,
      object: sut,
      handler: nil)
    let alert = Alert("this is an alert")
    // when
    sut.postAlert(alert: alert)
  // then
    wait(for: [exp], timeout: 1)
    
  }
  
  func testPostingTwoAlerts_generatesTwoNotifications() {
    
    //given
    let exp1 = expectation(
      forNotification: AlertNotification.name,
      object: sut,
      handler: nil)
    let exp2 = expectation(
      forNotification: AlertNotification.name,
      object: sut,
      handler: nil)
    let alert1 = Alert("this is the first alert")
    let alert2 = Alert("this is the second alert")
   // when
    sut.postAlert(alert: alert1)
    sut.postAlert(alert: alert2)
   // then
    wait(for: [exp1, exp2], timeout: 1)
    
  }
  
  func testPostingTwoAlerts_generatesTwoNotifications2() {
    
    //given
    let exp = expectation(
      forNotification: AlertNotification.name,
      object: sut,
      handler: nil)
    exp.expectedFulfillmentCount = 2
    let alert1 = Alert("this is the first alert")
    let alert2 = Alert("this is the second alert")
  // when
    sut.postAlert(alert: alert1)
    sut.postAlert(alert: alert2)
  // then
    wait(for: [exp], timeout: 1)
    
  }
  
  func testPostDouble_generatesOnlyOneNotification() {
    
    //given
    let exp = expectation(
      forNotification: AlertNotification.name,
      object: sut,
      handler: nil)
    exp.expectedFulfillmentCount = 2
    exp.isInverted = true
    let alert = Alert("this is an alert")
  // when
    sut.postAlert(alert: alert)
    sut.postAlert(alert: alert)
  // then
    wait(for: [exp], timeout: 1)
    
    
  }
  
  
  
  
  
}
