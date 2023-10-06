//
//  PetDog.swift
//  UIKit2
//
//  Created by Enrique Carvalho on 22/09/23.
//

import Foundation
import CoreData
import UIKit

class TasksManager: ObservableObject{ // handling the core data stuff
    let container = NSPersistentContainer(name: "AppModel") // defining the container with the model name
    
    var context: NSManagedObjectContext{
        return container.viewContext
    } // defining the context as a computed property
    
    var tasks : [DogTask] {
        let array = fetch() // fetching all tasks from core data to the array
        return array // returning the task model array
    }
    
    // MARK: reccurent tasks
    var dailyTasks: [DogTask] { // fetching all daily tasks, which is done in a similar way to feching tasks
        let array = fetch()
        var dailyArray: [DogTask] = []
        
        for task in array{
            if task.frequency == "Daily"{
                dailyArray.append(task)
            }
        }
        
        return dailyArray
    }
    
    var weeklyTasks: [DogTask]{ // fetching all weekly tasks
        let array = fetch()
        var weeklyArray: [DogTask] = []
        
        for task in array{
            if task.frequency == "Weekly"{
                weeklyArray.append(task)
            }
        }
        
        return weeklyArray
    }
    
    var monthlyTasks: [DogTask]{ // fetching all monthly tasks
        let array = fetch()
        var monthlyArray: [DogTask] = []
        
        for task in array{
            if task.frequency == "Monthly"{
                monthlyArray.append(task)
            }
        }
        
        return monthlyArray
    }
    
    var yearlyTasks: [DogTask]{ // fetching all yearly tasks
        let array = fetch()
        var yearlyArray: [DogTask] = []
        
        for task in array{
            if task.frequency == "Yearly"{
                yearlyArray.append(task)
            }
        }
        
        return yearlyArray
    }
    
    public enum Frequency: String, EnumLocalization{ // creating an enum with raw values to avoid typos
        case once = "Once"
        case daily = "Daily"
        case weekly = "Weekly"
        case monthly = "Monthly"
        case yearly = "Yearly"
    }
    
    var fetchEnum: [String]{ // fetching all values to the enum
        var frequencies: [String] = [] // creating the array
        
        for i in Frequency.allCases{
            frequencies.append(i.localized) // appending all items to the array
        }
        
        return frequencies // returning it
    }
    
    init(){
        container.loadPersistentStores { _, error in
            if let error = error{
                print("Error creating the container - \(error.localizedDescription)")
            }
        }
    }
    
    func save(){ // saving the object to the model
        do{
            try context.save() // try saving
        } catch {
            print("save error - " + error.localizedDescription) // if not able to save, handle errors here
        }
    }
    
    func newTask(title: String, icon: UIImage, dogs: NSSet, date: Date, frequency: Frequency, notes: String?){ // defining the create func
        let newTask = DogTask(context: self.context)
        
        newTask.id = UUID()
        newTask.title = title
        newTask.icon = icon.jpegData(compressionQuality: 0.8)
        newTask.dogs = dogs
        newTask.date = date
        newTask.frequency = frequency.rawValue
        newTask.notes = notes
        
        save()
    }
    
    func delete(task: DogTask){ // deleting an instance of the model from core data
        context.delete(task)
        save()
    }
    
    func fetch() -> [DogTask]{ // fetching all tasks from core data and returning as an array
        let request: NSFetchRequest<DogTask> = DogTask.fetchRequest() // creating the fetch request
        let sort = NSSortDescriptor(keyPath: \DogTask.date, ascending: true) // creating sort
        request.sortDescriptors = [sort] // sorting the request with sort settings
        
        return (try? context.fetch(request)) ?? [] // try returning the array, else return empty
    }
    
    func edit(dogTask: DogTask, title: String?, icon: UIImage?, dogs: NSSet?, date: Date?, frequency: Frequency?, notes: String?){ // editing any attribute
        
        if let title = title{ // if the user input the name, edit it here
            dogTask.title = title
        }
        
        if let dogs = dogs{ // if the user input the dogs to be changed, do it here
            dogTask.dogs = dogs
        }
        
        if let icon = icon?.jpegData(compressionQuality: 0.8) { // if the user input the name, edit it here
            dogTask.icon = icon
        }
        if let date = date { // if the user input the age, edit it age
            dogTask.date = date
        }
        if let frequency = frequency?.rawValue { // if the user input the size, edit it size
            dogTask.frequency = frequency
        }
        if let notes = notes { // if the user input the weight, edit it weight
            dogTask.notes = notes
        }
        
        save()
    }
    
}
