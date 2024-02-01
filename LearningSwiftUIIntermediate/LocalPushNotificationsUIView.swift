//
//  LocalPushNotificationsUIView.swift
//  LearningSwiftUIIntermediate
//
//  Created by Aditya Ghorpade on 30/01/24.
//

import SwiftUI
import UserNotifications
import CoreLocation

class NotificationManager {
    
    static let instance = NotificationManager()
    
    func requestAuthorization() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { success, error in
            if let error = error {
                print("ERROR: \(error)")
            } else {
                print("SUCCESS")
            }
        }
    }
    
    func scheduleNotification() {
        let content = UNMutableNotificationContent()
        content.title = "This is a sample notification test!"
        content.subtitle = "This is an example to demonstrate how to implement local push notifications in iOS"
        content.sound = .default
        content.badge = 1
        
        // There are three way in which trigger can be implemented. //
        
        // 1. TIME
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5.0, repeats: false)
        
        // 2. CALENDER
        //var dateCoponents = DateComponents()
        //dateCoponents.hour = 11
        //dateCoponents.minute = 45
        //dateCoponents.weekday = 1
        //let trigger = UNCalendarNotificationTrigger(dateMatching: dateCoponents, repeats: true)
        
        // 3. LOCATION
        //let coordinates = CLLocationCoordinate2D(latitude: 16.49282 ,longitude: 74.77462)
        //let region = CLCircularRegion(center: coordinates, radius: 1000, identifier: UUID().uuidString)
        //region.notifyOnEntry = true
        //region.notifyOnExit = false
        //let trigger = UNLocationNotificationTrigger(region: region, repeats: true)
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request)
    }
    
    func cancelNotification() {
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        UNUserNotificationCenter.current().removeAllDeliveredNotifications()
    }
}

struct LocalPushNotificationsUIView: View {
    var body: some View {
        VStack(spacing: 40) {
            Text("Press the buttons below to allow permission and schedule notifications")
                .font(.headline)
                .multilineTextAlignment(.center)
            
            Button("REQUEST PERMISSION") {
                NotificationManager.instance.requestAuthorization()
            }
            
            Button("SCHEDULE NOTIFICATION") {
                NotificationManager.instance.scheduleNotification()
            }
            
            Button("CANCEL NOTIFICATION") {
                NotificationManager.instance.cancelNotification()
            }
        }
    }
}

#Preview {
    LocalPushNotificationsUIView()
}
