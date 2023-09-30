////
////  AddTaskViewController.swift
////  Mini02-Grupo09
////
////  Created by Enrique Carvalho on 28/09/23.
////
//
//import UIKit
//
//class aaa: UIViewController{
//
////    var stack = UIStackView()
////    var hTitleStack = UIStackView()
////    var dateStack = UIStackView()
//    var icon = UIImageView()
//    var taskTF = UITextField()
//    var petPicker = UIPickerView()
//    var datePicker = UIDatePicker()
//    var recurrency = UISegmentedControl()
//    var noteField = UITextField()
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .systemBackground
//        
//        addSubs()
//        setupUIComponents()
//        recurrencyBuilder()
//        setupConstraints()
//        
//    }
//    
//    func addSubs(){
////        view.addSubview(stack)
////        view.addSubview(hTitleStack)
//        view.addSubview(icon)
//        view.addSubview(taskTF)
//        view.addSubview(petPicker)
////        view.addSubview(dateStack)
//        view.addSubview(datePicker)
//        view.addSubview(recurrency)
//        view.addSubview(noteField)
//    }
//    
//    func setupUIComponents(){
////        stack.translatesAutoresizingMaskIntoConstraints = false
////        stack.axis = .vertical
////        stack.spacing = 50
////        stack.distribution = .fillEqually
//        
////        hTitleStack.translatesAutoresizingMaskIntoConstraints = false
////        hTitleStack.axis = .horizontal
////        hTitleStack.spacing = 10
////        hTitleStack.distribution = .fill
//        
//        icon.translatesAutoresizingMaskIntoConstraints = false
//        icon.image = .init(systemName: "pawprint.fill")
//        icon.layer.cornerRadius = 100
//        icon.heightAnchor.constraint(equalToConstant: 30).isActive = true
//        icon.widthAnchor.constraint(equalToConstant: 30).isActive = true
//        
//        taskTF.translatesAutoresizingMaskIntoConstraints = false
//        taskTF.borderStyle = .none
//        taskTF.placeholder = "Feed the dog"
//        taskTF.addBottomBorderWithColor(color: .gray, width: 1)
//        
//        petPicker.translatesAutoresizingMaskIntoConstraints = false
//        petPicker.delegate = self
//        petPicker.dataSource = self
//        
//        datePicker.translatesAutoresizingMaskIntoConstraints = false
//        datePicker.maximumDate = .now
//        datePicker.datePickerMode = .dateAndTime
//        datePicker.preferredDatePickerStyle = .compact
//        
//        recurrency.translatesAutoresizingMaskIntoConstraints = false
//        recurrency.selectedSegmentIndex = 1
//        
//        noteField.translatesAutoresizingMaskIntoConstraints = false
//        noteField.borderStyle = .roundedRect
//        noteField.placeholder = "Notes"
//        
//        
////        hTitleStack.addArrangedSubview(icon)
////        hTitleStack.addArrangedSubview(taskTF)
////        dateStack.addArrangedSubview(datePicker)
////
////        stack.addArrangedSubview(hTitleStack)
////        stack.addArrangedSubview(petPicker)
////        stack.addArrangedSubview(dateStack)
////        stack.addArrangedSubview(recurrency)
////        stack.addArrangedSubview(noteField)
//    }
//    
//    func setupConstraints(){
//        var constraints: [NSLayoutConstraint] = []
//        
//        constraints.append(datePicker.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30))
//        constraints.append(datePicker.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30))
//        constraints.append(datePicker.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0))
//        
////        constraints.append(icon.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30))
////        constraints.append(icon.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60))
////
////        constraints.append(taskTF.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0))
////        constraints.append(taskTF.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0))
////
////        constraints.append(datePicker.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0))
////        constraints.append(datePicker.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0))
////
////        constraints.append(taskTF.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0))
////        constraints.append(taskTF.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0))
////
////        constraints.append(taskTF.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0))
////        constraints.append(taskTF.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0))
////
////        constraints.append(taskTF.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0))
////        constraints.append(taskTF.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0))
//        
//        NSLayoutConstraint.activate(constraints)
//        
//    }
//    
//    func recurrencyBuilder(){
//        let repetitions = ["Once", "Daily", "Weekly", "Monthly", "Yearly"]
//        
//        for i in 0..<repetitions.count{
//            recurrency.insertSegment(withTitle: repetitions[i], at: i, animated: true)
//        }
//    }
//    
//    
//}
