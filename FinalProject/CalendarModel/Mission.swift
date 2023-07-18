//
//  Task.swift
//  FinalProject
//
//  Created by Student7 on 13/07/2023.
//

import SwiftUI

// Task Model and Sample Tasks
// Array of Tasks
struct Mission: Identifiable {
    var id = UUID().uuidString
    var title: String
    var time: Date = Date()
}

// Total Task Meta View
struct TaskMetaData: Identifiable {
    var id = UUID().uuidString
    var task: [Mission]
    var taskDate: Date
}

// Sample Date for Testing
//func getSampleDate(offset: Int) -> Date {
//    let calendar = Calendar.current
//    let date = calendar.date(byAdding: .day, value: offset, to: Date())
    
 //   return date ?? Date()
//}

// Sample Tasks
var tasks: [TaskMetaData] = [
    //TaskMetaData(task: [
    //    Mission(title: "Talk to bank"),
    //   Mission(title: "Send flowers to friend"),
    //    Mission(title: "Job Meeting")
    //], taskDate: getSampleDate(offset: 1)),
    //TaskMetaData(task: [
    
     //   Mission(title: "Do A Workout")
    //], taskDate: getSampleDate(offset: -3)),
    //TaskMetaData(task: [
    
     //   Mission(title: "Meeting with Hoel Salamon")
    //], taskDate: getSampleDate(offset: -8)),
]
