//
//  PetDog.swift
//  UIKit2
//
//  Created by Enrique Carvalho on 22/09/23.
//

import Foundation
import CoreData
import UIKit

class TasksManager: ObservableObject{
    let container = NSPersistentContainer(name: "PetDogModel")
    var context: NSManagedObjectContext{
        return container.viewContext
    }
    var tasks : [DogTask] {
        let array = fetch()
        return array
    }
    
    public enum Frequency: String, CaseIterable{ // creating an enum with raw values to avoid typos
        case once = "once"
        case daily = "daily"
        case weekly = "weekly"
        case monthly = "monthly"
        case yearly = "yearly"
    }
    
    var fetchEnum: [Frequency]{
        var frequencies: [Frequency] = []
        
        for i in Frequency.allCases{
            frequencies.append(i)
        }
        
        return frequencies
    }
    
    init(){
        container.loadPersistentStores { _, error in
            if let error = error{
                print("Error creating the container - \(error.localizedDescription)")
            }
        }
    }
    
    func save(){
        do{
            try context.save()
        } catch {
            print("save error - " + error.localizedDescription)
        }
    }
    
    func newTask(title: String, icon: UIImage, dogs: NSSet, date: Date, frequency: Frequency, notes: String){
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
    
    func delete(task: DogTask){
        context.delete(task)
        save()
    }
    
    func fetch() -> [DogTask]{
        let request: NSFetchRequest<DogTask> = DogTask.fetchRequest()
        let sort = NSSortDescriptor(keyPath: \DogTask.date, ascending: true)
        request.sortDescriptors = [sort]
        
        return (try? context.fetch(request)) ?? []
    }
    
    func edit(dogTask: DogTask, title: String?, icon: UIImage?, dogs: NSSet?, date: Date?, frequency: Frequency?, notes: String?){ // editing any attribute
        
        if let title = title{ // if the user input the name, edit it here
            dogTask.title = title
        }
        
        if let dogs = dogs{
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
