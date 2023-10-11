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
    static let shared = TasksManager()
    
    private var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var tasks : [DogTask] {
        let array = fetch() // fetching all tasks from core data to the array
        return array // returning the task model array
    }
    
    func save(){ // saving the object to the model
        do{
            try context.save() // try saving
        } catch {
            print("save error - " + error.localizedDescription) // if not able to save, handle errors here
        }
    }
    
    func newTask(title: String, icon: UIImage, dogs: NSSet, date: Date, notes: String?){ // defining the create func
        let newTask = DogTask(context: self.context)
        
        newTask.id = UUID()
        newTask.title = title
        newTask.icon = icon.pngData()
        newTask.dogs = dogs
        newTask.date = date
        newTask.notes = notes
        newTask.isDone = false
        
       
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
    
    func edit(dogTask: DogTask, title: String?, icon: UIImage?, dogs: NSSet?, date: Date?, notes: String?){ // editing any attribute
        
        if let title = title{ // if the user input the name, edit it here
            dogTask.title = title
        }
        
        if let dogs = dogs{ // if the user input the dogs to be changed, do it here
            dogTask.dogs = dogs
        }
        
        if let icon = icon?.pngData() { // if the user input the name, edit it here
            dogTask.icon = icon
        }
        if let date = date { // if the user input the age, edit it age
            dogTask.date = date
        }
        if let notes = notes { // if the user input the weight, edit it weight
            dogTask.notes = notes
        }
        
        dogTask.isDone = false
        
        save()
    }
    
}
