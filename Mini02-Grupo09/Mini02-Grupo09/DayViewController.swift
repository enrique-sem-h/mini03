//
//  DayViewController.swift
//  CalendarioSemanal
//
//  Created by Samu Lima on 27/09/23.
//

import Foundation
import UIKit

open class DayViewController: UIViewController, DayViewDelegate {
    
    public lazy var dayView: DayView = DayView()

    public var delegate: DayViewDelegate? {
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


    open func dayView(dayView: DayView, didTapTimelineAt date: Date) {}
    open func dayViewDidBeginDragging(dayView: DayView) {}
    open func dayViewDidTransitionCancel(dayView: DayView) {}

    open func dayView(dayView: DayView, willMoveTo date: Date) {}
    open func dayView(dayView: DayView, didMoveTo date: Date) {}

    open func dayView(dayView: DayView, didLongPressTimelineAt date: Date) {}





}

