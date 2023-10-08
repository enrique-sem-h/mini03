//
//  Events.swift
//  Mini02-Grupo09
//
//  Created by Samu Lima on 06/10/23.
//

import Foundation
import UIKit

struct Task {
    var title: String
    var icon: UIImage
    var dogs: NSSet
    var date: Date
    var frequency: TasksManager.Frequency
    var id: UUID
    var notes: String
    
    
    init(title: String, date: Date, frequency: TasksManager.Frequency, id: UUID, notes:String) {
        self.title = title
        self.date = date
        self.frequency = frequency
        self.id = id
        self.notes = notes
    }
}

class EventsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var daySelector = DaySelector()
    var selectedDate = Date()
    var tasks: [Task] = []
    
    
    
    
    init(daySelector: DaySelector = DaySelector(), selectedDate: Date, tasks: [Task]) {
        self.daySelector = daySelector
        self.selectedDate = daySelector.selectedDate!
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func filterEvents(forDate selectedDate: Date) -> [Task] {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let selectedDateString = dateFormatter.string(from: selectedDate)
        
        let filteredEvents = tasks.filter { event in
            let eventDateString = dateFormatter.string(from: event.date)
            return eventDateString == selectedDateString
        }
        
        func showEventsForSelectedDate() {
            let filteredEvents = filterEvents(forDate: selectedDate)
        }
        
        
        return filteredEvents
    }
    
    
    func loadEvents() {
        
        if Task.date == selectedDate {
            filterEvents(forDate: selectedDate)
        }
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadEvents()
    }
    
    
    func showEventsForSelectedDate(_ selectedDate: Date) {
        let filteredEvents = filterEvents(forDate: selectedDate)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
    
    
}
