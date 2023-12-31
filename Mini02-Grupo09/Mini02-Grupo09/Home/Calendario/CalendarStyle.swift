//
//  CalendarStyle.swift
//  Mini02-Grupo09
//
//  Created by Samu Lima on 27/09/23.
//

import Foundation
import UIKit

public enum DateStyle {
    
    case twelveHour
    case twentyFourHour
    case system
}

public struct CalendarStyle {
    public var header = DayHeaderStyle()
    public init() {}
}

public struct DayHeaderStyle {
    public var daySymbols = DaySymbolsStyle()
    public var daySelector = DaySelectorStyle()
    public var swipeLabel = SwipeLabelStyle()
    public var backgroundColor = SystemColors.systemBackground
    public var separatorColor = SystemColors.systemSeparator
    public init() {}
}

public struct DaySelectorStyle {
    public var activeTextColor = UIColor.black
    public var selectedBackgroundColor = UIColor(named: "Yellow")

    public var weekendTextColor = SystemColors.secondaryLabel
    public var inactiveTextColor = SystemColors.label
    public var inactiveBackgroundColor = UIColor.clear

    public var todayInactiveTextColor = SystemColors.label
    public var todayActiveTextColor = UIColor.black
    public var todayActiveBackgroundColor = UIColor(named: "Yellow")
    
    public var font = UIFont.systemFont(ofSize: 18)
    public var todayFont = UIFont.boldSystemFont(ofSize: 18)

    public init() {}
}

public struct DaySymbolsStyle {
    public var weekendColor = SystemColors.secondaryLabel
    public var weekDayColor = SystemColors.label
    public var font = UIFont(name: "Animal-Bold", size: 12)
    public init() {}
}

public struct SwipeLabelStyle {
    public var textColor = SystemColors.label
    public var font = UIFont.systemFont(ofSize: 24)
    public init() {}
}


public struct CurrentTimeIndicatorStyle {
    public var color = SystemColors.systemRed
    public var font = UIFont.systemFont(ofSize: 11)
    public var dateStyle : DateStyle = .system
    public init() {}
}


