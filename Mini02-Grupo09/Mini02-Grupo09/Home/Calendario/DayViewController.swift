//
//  DayViewController.swift
//  CalendarioSemanal
//
//  Created by Samu Lima on 27/09/23.
//

import Foundation
import UIKit

open class DayViewController: UIViewController, HomeViewDelegate {
    
    lazy var dayView: HomeView = HomeView()
    
    var delegate: HomeViewDelegate? {
        get {
            dayView.delegate
        }
        set(value) {
            dayView.delegate = value
        }
    }
    
    public var calendar = Calendar.autoupdatingCurrent {
        didSet {
            dayView.calendar = calendar
        }
    }
    
    
    open override func loadView() {
        view = dayView
    }
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        edgesForExtendedLayout = []
        view.tintColor = SystemColors.systemRed
        delegate = self
        
        let sizeClass = traitCollection.horizontalSizeClass
        configureDayViewLayoutForHorizontalSizeClass(sizeClass)
    }
    
    
    open override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        super.willTransition(to: newCollection, with: coordinator)
        configureDayViewLayoutForHorizontalSizeClass(newCollection.horizontalSizeClass)
    }
    
    open func configureDayViewLayoutForHorizontalSizeClass(_ sizeClass: UIUserInterfaceSizeClass) {
        dayView.transitionToHorizontalSizeClass(sizeClass)
    }
    
    // MARK: - DayViewDelegate
    
    
    func dayView(dayView: HomeView, didTapTimelineAt date: Date) {}
    func dayViewDidBeginDragging(dayView: HomeView) {}
    func dayViewDidTransitionCancel(dayView: HomeView) {}
    
    func dayView(dayView: HomeView, willMoveTo date: Date) {}
    func dayView(dayView: HomeView, didMoveTo date: Date) {}
    
    func dayView(dayView: HomeView, didLongPressTimelineAt date: Date) {}
    
    
    
    
    
}
