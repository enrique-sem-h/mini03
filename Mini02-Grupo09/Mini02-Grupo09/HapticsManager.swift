//
//  HapticsManager.swift
//  UIKit2
//
//  Created by Enrique Carvalho on 27/09/23.
//

import Foundation
import UIKit

final class HapticsManager{
    static let shared = HapticsManager() // creating a singleton of the class
    
    public func selectionVibrate(){ // defining the default selection haptic feedback
        let selectionFeedbackGenerator = UISelectionFeedbackGenerator() // creating the feedback
        selectionFeedbackGenerator.prepare() // preparing the vibration
        selectionFeedbackGenerator.selectionChanged() // triggering it
    }
    
    public func vibrate(for type: UINotificationFeedbackGenerator.FeedbackType){ // defining a haptic feedback with one of the predefined types
        let notificationGenerator = UINotificationFeedbackGenerator() // creating the feedback
        notificationGenerator.prepare() // preparing the feedback
        notificationGenerator.notificationOccurred(type) // triggering feedback for the desired type
    }
    
}
