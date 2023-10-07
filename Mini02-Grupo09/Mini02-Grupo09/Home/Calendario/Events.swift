//
//  Events.swift
//  Mini02-Grupo09
//
//  Created by Samu Lima on 06/10/23.
//

import Foundation
import UIKit

class Event {
    var title: String
    var date: Date
    var frequency: String
    var id: UUID
    var notes: String
    

    init(title: String, date: Date, frequency: String, id: UUID, notes:String) {
        self.title = title
        self.date = date
        self.frequency = frequency
        self.id = id
        self.notes = notes
    }
}

class EventsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    

    @IBOutlet weak var tableView: UITableView!
    var events: [Event] = []

    
    func filterEvents(forDate selectedDate: Date) -> [Event] {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let selectedDateString = dateFormatter.string(from: selectedDate)

        let filteredEvents = events.filter { event in
            let eventDateString = dateFormatter.string(from: event.date)
            return eventDateString == selectedDateString
        }

        return filteredEvents
    }

    
    func loadEvents() {
       
        events = [
//            Event(title: "Evento 1", date: Date(), frequency: "daily", id: <#UUID#>, id: , notes:"a"),
//            Event(title: "Evento 2", date: Date(), frequency: "daily", id: <#UUID#>, id: , notes:"a"),
//            Event(title: "Evento 3", date: Date(), frequency: "daily", id: <#UUID#>, id: , notes:"a"),
           
        ]

        tableView.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        loadEvents()
    }

 
    func showEventsForSelectedDate(_ selectedDate: Date) {
        let filteredEvents = filterEvents(forDate: selectedDate)
     
    }

   
}
