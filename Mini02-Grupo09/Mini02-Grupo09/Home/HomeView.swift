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
    let dateLabel = UILabel()
    
    let calendarButton = UIButton(type: .system)
    let filterButton = UIButton(type: .system)
    let petsButton = UIButton(type: .system)
    let configButton = UIButton(type: .system)
    let addTaskButton = UIButton(type: .custom)
    
    let celulas: [Task]/*[CustomTaskCell(), CustomTaskCell(), CustomTaskCell(), CustomTaskCell(), CustomTaskCell(), CustomTaskCell(), CustomTaskCell()]*/ // Dados da TableView temporários
    
    let dayState = DayViewState()
    
    let tasksTableView = UITableView()
    
    func setup() {
        
        // colocando o calendario
        configure()
        
        self.backgroundColor = .systemBackground
        // Configuração da Label da data
        
        
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.text = "Tarefas"
        dateLabel.font = UIFont.systemFont(ofSize: 50, weight: .semibold)
        self.addSubview(dateLabel)
        
        
        // Botão do calendário
        calendarButton.setImage(UIImage(systemName: "calendar"), for: .normal)
        
        // Botão do filtro
        filterButton.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        
        // Botão dos pets
        petsButton.setImage(UIImage(systemName: "pawprint"), for: .normal)
        
        // Botão da config
        configButton.setImage(UIImage(systemName: "gear"), for: .normal)
        
        // StackView dos botões
        let buttonStackView = UIStackView(arrangedSubviews: [calendarButton, filterButton, petsButton, configButton])
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        buttonStackView.axis = .horizontal
        buttonStackView.distribution = .equalSpacing
        self.addSubview(buttonStackView)
        
        tasksTableView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(tasksTableView)
        
        tasksTableView.register(CustomTaskCell.self, forCellReuseIdentifier: "CustomTaskCell")
        self.tasksTableView.separatorStyle = .none
        
        buttonStackView.isHidden = true
        dateLabel.isHidden = true
        
        // Botão de adicionar tarefa
        addTaskButton.translatesAutoresizingMaskIntoConstraints = false
        addTaskButton.setImage(UIImage(named: "AddTaskButton"), for: .normal)
        addTaskButton.frame = CGRect(x: 0, y: 0, width: 47, height: 47)
        self.addSubview(addTaskButton)
        
        NSLayoutConstraint.activate([
            // Constraints da data
            dateLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 14),
            dateLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            
            // Constraints da StackView dos botões do topo
            buttonStackView.centerYAnchor.constraint(equalTo: dateLabel.centerYAnchor),
            buttonStackView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -18),
            
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
    
    public init(calendar: Calendar = Calendar.autoupdatingCurrent) {
        self.calendar = calendar
        self.dayHeaderView = DayHeaderView(calendar: calendar)
        super.init(frame: .zero)
        configure()
    }
    
    override public init(frame: CGRect) {
        self.dayHeaderView = DayHeaderView(calendar: calendar)
        super.init(frame: frame)
        configure()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        self.dayHeaderView = DayHeaderView(calendar: calendar)
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


