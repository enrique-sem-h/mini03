//
//  DogManager.swift
//  Mini02-Grupo09
//
//  Created by Enrique Carvalho on 25/09/23.
//

import Foundation
import CoreData
import UIKit

class DogManager: ObservableObject{ // handling the core data stuff
    static let shared = DogManager()
    
    private var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var dogs: [Dog]{
        let array = fetch() // fetching all dogs from core data to the array
        return array // returning the dog model array
    }
    
    enum Size: String, EnumLocalization{ // creating an enum with raw values to avoid typos
        case mini = "Mini"
        case small = "Small"
        case midSized = "Mid-Sized"
        case big = "Big"
        case giant = "Giant"
    }
    
    var fetchEnum: [Size]{
        var sizes: [Size] = []
        
        for i in Size.allCases{
            sizes.append(i)
        }
        
        return sizes
    }
    
    
    func save(){ // saving the object to the model
        do{
            try context.save() // try saving
        } catch {
            print("save error - " + error.localizedDescription) // if not able to save, handle errors here
        }
    }
    
    func newDog(image: UIImage, name: String, age: Int, weight: Float, size: Size){ // defining the create func
        let newDog = Dog(context: self.context)
        
        newDog.id = UUID()
        newDog.dateAdded = Date()
        newDog.image = image.pngData()
        newDog.name = name
        newDog.age = Int64(age)
        newDog.size = size.rawValue
        newDog.weight = weight
        
        save() // saving the new dog to core data model
    }
    
    func delete(dog: Dog){ // deleting from core data
        context.delete(dog)
        save()
    }
    
    func fetch() -> [Dog]{ // fetching all dogs from core data and returning as an array
        let request: NSFetchRequest<Dog> = Dog.fetchRequest() // creating the fetch request
        let sort = NSSortDescriptor(keyPath: \Dog.dateAdded, ascending: true) // creating sort
        request.sortDescriptors = [sort] // sorting the request with sort settings
        
        return (try? context.fetch(request)) ?? [] // try returning the array, else return empty
    }
    
    func edit(image: UIImage?, dog: Dog, name: String?, age: Int?, size: Size?, weight: Float?){ // editing any attribute
        
        if let image = image?.jpegData(compressionQuality: 0.8) { // if the user input the name, edit it here
            dog.image = image
        }
        
        if let name = name { // if the user input the name, edit it here
            dog.name = name
        }
        if let age = age { // if the user input the age, edit it age
            dog.age = Int64(age)
        }
        if let size = size?.rawValue { // if the user input the size, edit it size
            dog.size = size
        }
        if let weight = weight { // if the user input the weight, edit it weight
            dog.weight = weight
        }
        
        save()
    }
    
}
