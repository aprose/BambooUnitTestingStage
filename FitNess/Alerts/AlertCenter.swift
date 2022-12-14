
import Foundation

class AlertCenter {
  
  static var instance = AlertCenter()
  
  private var alertQueue: [Alert] = []


  init(center: NotificationCenter = .default) {
    self.notificationCenter = center
  }

  // MARK: - Notifications
  let notificationCenter: NotificationCenter

  func postAlert(alert: Alert) {
    
   guard !alertQueue.contains(alert) else { return }
   alertQueue.append(alert)
    
    let notification = Notification(
      name: AlertNotification.name,
      object: self)
    notificationCenter.post(notification)
    
  }
}

// MARK: - Class Helpers
extension AlertCenter {
}
