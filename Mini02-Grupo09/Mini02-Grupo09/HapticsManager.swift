//
//  HapticsManager.swift
//  UIKit2
//
//  Created by Enrique Carvalho on 27/09/23.
//

import Foundation
import UIKit

final class HapticsManager{
    static let shared = HapticsManager()
    
    private init(){}
    
    public func selectionVibrate(){
        let selectionFeedbackGenerator = UISelectionFeedbackGenerator()
        selectionFeedbackGenerator.prepare()
        selectionFeedbackGenerator.selectionChanged()
    }
    
    public func vibrate(for type: UINotificationFeedbackGenerator.FeedbackType){
        let notificationGenerator = UINotificationFeedbackGenerator()
        notificationGenerator.prepare()
        notificationGenerator.notificationOccurred(type)
    }
    
}
