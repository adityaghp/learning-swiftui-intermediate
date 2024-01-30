//
//  HapticsUIView.swift
//  LearningSwiftUIIntermediate
//
//  Created by Aditya Ghorpade on 30/01/24.
//

import SwiftUI

class HapticManager {
    
    static let instance = HapticManager()
    
    func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(type)
    }
    
    func impact(style: UIImpactFeedbackGenerator.FeedbackStyle) {
        let generator = UIImpactFeedbackGenerator(style: style)
        generator.impactOccurred()
    }
}

struct HapticsUIView: View {
    var body: some View {
        VStack(spacing: 30) {
            Text("Click on different buttons below to see the Haptic feedback")
                .font(.title)
                .multilineTextAlignment(.center)
            
            Button("SUCCESS") { HapticManager.instance.notification(type: .success) }
            Button("WARNING") { HapticManager.instance.notification(type: .warning) }
            Button("ERROR") { HapticManager.instance.notification(type: .error) }
            
            Divider()
            
            Button("SOFT") { HapticManager.instance.impact(style: .soft) }
            Button("LIGHT") { HapticManager.instance.impact(style: .light) }
            Button("MEDIUM") { HapticManager.instance.impact(style: .medium) }
            Button("RIGID") { HapticManager.instance.impact(style: .rigid) }
            Button("HEAVY") { HapticManager.instance.impact(style: .heavy) }
        }
    }
}

#Preview {
    HapticsUIView()
}
