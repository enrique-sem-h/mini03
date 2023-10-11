//
//  HomeView.swift
//  Mini02-Grupo09
//
//  Created by Gabriel Eduardo on 27/09/23.
//

import Foundation
import UIKit

protocol HomeViewDelegate: AnyObject {
    
    func dayView(dayView: HomeView, didTapTimelineAt date: Date)
    func dayView(dayView: HomeView, didLongPressTimelineAt date: Date)
    func dayViewDidBeginDragging(dayView: HomeView)
    func dayViewDidTransitionCancel(dayView: HomeView)
    func dayView(dayView: HomeView, willMoveTo date: Date)
    func dayView(dayView: HomeView, didMoveTo  date: Date)
    
}

class HomeView: UIView {
    weak var viewController: HomeViewController?
    
    let addTaskButton = UIButton(type: .custom)
    
    let swipeLabel = SwipeLabelView()
    
    let tasksTableView: UITableView = {
        let tasksTableView = UITableView()
        tasksTableView.translatesAutoresizingMaskIntoConstraints = false
        return tasksTableView
    }()
    
    func setup() {
        
        // colocando o calendario
        configure()
        
        self.backgroundColor = .systemBackground
        
        self.addSubview(tasksTableView)
        let gradient = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = [
            UIColor(red: 52 / 255, green: 46 / 255, blue: 77 / 255, alpha: 0.3).cgColor,
            UIColor(red: 54 / 255, green: 46 / 255, blue: 77 / 255, alpha: 1.0).cgColor
        ]
        gradient.zPosition = -1
        tasksTableView.backgroundColor = .clear
        tasksTableView.layer.addSublayer(gradient)
        
        
        tasksTableView.register(CustomTaskCell.self, forCellReuseIdentifier: "CustomTaskCell")
        self.tasksTableView.separatorStyle = .none
        
        // Botão de adicionar tarefa
        addTaskButton.translatesAutoresizingMaskIntoConstraints = false
        addTaskButton.setImage(UIImage(named: "AddTaskButton"), for: .normal)
        addTaskButton.frame = CGRect(x: 0, y: 0, width: 47, height: 47)
        self.addSubview(addTaskButton)
        
        NSLayoutConstraint.activate([
            
            // Constraints da TableView de tarefas
            tasksTableView.topAnchor.constraint(equalTo: dayHeaderView.bottomAnchor, constant: 16),
            tasksTableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tasksTableView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            tasksTableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            // Constraints do botão de adicionar tarefa
            addTaskButton.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor),
            addTaskButton.bottomAnchor.constraint(equalTo: self.layoutMarginsGuide.bottomAnchor),
            
            // Constraints do calendario
            dayHeaderView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            dayHeaderView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            dayHeaderView.widthAnchor.constraint(equalTo: self.widthAnchor),
            dayHeaderView.heightAnchor.constraint(equalToConstant: 90)
        ])
    }
    
    
    // calendario
    
    public weak var delegate: HomeViewDelegate?
    
    public var isHeaderViewVisible = true {
        didSet {
            headerHeight = isHeaderViewVisible ? HomeView.headerVisibleHeight : 0
            dayHeaderView.isHidden = !isHeaderViewVisible
            setNeedsLayout()
            configureLayout()
        }
    }
    
    private static let headerVisibleHeight: Double = 88
    public var headerHeight: Double = headerVisibleHeight
    public let dayHeaderView: DayHeaderView
    
    public var state: DayViewState? {
        didSet {
            dayHeaderView.state = state
        }
    }
    
    public var calendar: Calendar = Calendar.autoupdatingCurrent
    
    private var style = CalendarStyle()
    
    public init(calendar: Calendar = Calendar.autoupdatingCurrent, viewController: HomeViewController) {
        self.viewController = viewController
        self.calendar = calendar
        self.dayHeaderView = DayHeaderView(calendar: calendar, viewController: self.viewController!)
        super.init(frame: .zero)
        configure()
    }
    
    override public init(frame: CGRect) {
        self.dayHeaderView = DayHeaderView(calendar: calendar, viewController: nil)
        super.init(frame: frame)
        configure()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        self.dayHeaderView = DayHeaderView(calendar: calendar, viewController: self.viewController!)
        super.init(coder: aDecoder)
        configure()
    }
    
    //colocando o setup na view
    func configure() {
        addSubview(dayHeaderView)
        configureLayout()
        
        if state == nil {
            let newState = DayViewState(date: Date(), calendar: calendar)
            newState.move(to: Date())
            state = newState
        }
    }
    
    
    //configurando o setup
    func configureLayout() {
        dayHeaderView.translatesAutoresizingMaskIntoConstraints = false
        
        dayHeaderView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor).isActive = true
        dayHeaderView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor).isActive = true
        dayHeaderView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
//        let heightConstraint = dayHeaderView.heightAnchor.constraint(equalToConstant: headerHeight)
//        heightConstraint.priority = .defaultLow
//        heightConstraint.isActive = true
        
    }
    
    public func updateStyle(_ newStyle: CalendarStyle) {
        style = newStyle
        dayHeaderView.updateStyle(style.header)
    }
    
    public func transitionToHorizontalSizeClass(_ sizeClass: UIUserInterfaceSizeClass) {
        dayHeaderView.transitionToHorizontalSizeClass(sizeClass)
        updateStyle(style)
    }
}


