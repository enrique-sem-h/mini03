//
//  DayView.swift
//  CalendarioSemanal
//
//  Created by Samu Lima on 27/09/23.
//

import UIKit

 
//public class DayView: UIView {
//    
////    public weak var delegate: DayViewDelegate?
////    
////    /// Hides or shows header view
////    public var isHeaderViewVisible = true {
////        didSet {
////            headerHeight = isHeaderViewVisible ? DayView.headerVisibleHeight : 0
////            dayHeaderView.isHidden = !isHeaderViewVisible
////            setNeedsLayout()
////            configureLayout()
////        }
////    }
////    
////    
////    static let headerVisibleHeight: Double = 88
////    public var headerHeight: Double = headerVisibleHeight
////    public let dayHeaderView: DayHeaderView
////    
////    public var state: DayViewState? {
////        didSet {
////            dayHeaderView.state = state
////        }
////    }
////    
////    public var calendar: Calendar = Calendar.autoupdatingCurrent
////    
////    private var style = CalendarStyle()
////    
////    public init(calendar: Calendar = Calendar.autoupdatingCurrent) {
////        self.calendar = calendar
////        self.dayHeaderView = DayHeaderView(calendar: calendar)
////        super.init(frame: .zero)
////        configure()
////    }
////    
////    override public init(frame: CGRect) {
////        self.dayHeaderView = DayHeaderView(calendar: calendar)
////        super.init(frame: frame)
////        configure()
////    }
////    
////    required public init?(coder aDecoder: NSCoder) {
////        self.dayHeaderView = DayHeaderView(calendar: calendar)
////        super.init(coder: aDecoder)
////        configure()
////    }
////   
////    //colocando o setup na view
////   func configure() {
////        addSubview(dayHeaderView)
////        configureLayout()
////        
////        if state == nil {
////            let newState = DayViewState(date: Date(), calendar: calendar)
////            newState.move(to: Date())
////            state = newState
////        }
////    }
////    
////    
////    //configurando o setup
////    func configureLayout() {
////        dayHeaderView.translatesAutoresizingMaskIntoConstraints = false
////
////        dayHeaderView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor).isActive = true
////        dayHeaderView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor).isActive = true
////        dayHeaderView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
////        let heightConstraint = dayHeaderView.heightAnchor.constraint(equalToConstant: headerHeight)
////        heightConstraint.priority = .defaultLow
////        heightConstraint.isActive = true
////
////    }
////    
////    public func updateStyle(_ newStyle: CalendarStyle) {
////        style = newStyle
////        dayHeaderView.updateStyle(style.header)
////    }
////    
////    public func transitionToHorizontalSizeClass(_ sizeClass: UIUserInterfaceSizeClass) {
////        dayHeaderView.transitionToHorizontalSizeClass(sizeClass)
////        updateStyle(style)
////    }
////    
//}
