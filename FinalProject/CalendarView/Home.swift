//
//  Home.swift
//  FinalProject
//
//  Created by Student7 on 13/07/2023.
//

import SwiftUI
import FirebaseDatabase

struct Home: View {
    
    let databaseRef = Database.database().reference()
    
    @State var currentDate: Date = Date()
    @State var isAddingTask = false
    @State var newMissionTitle = ""
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }
    
    var timeFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        return formatter
    }

    
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 20) {
                
                // Custom Date Picker
                Text(dateFormatter.string(from: currentDate))
                CustomDatePicker(currentDate: $currentDate)
            }
            .padding(.vertical)
        }
        // Safe Area View
        .safeAreaInset(edge: .bottom) {
            VStack {
                Button {
                    isAddingTask = true
                } label: {
                    Text("Add Task")
                        .fontWeight(.bold)
                        .padding(.vertical)
                        .frame(maxWidth: .infinity)
                        .background(Color("Orange"), in: Capsule())
                }
                .sheet(isPresented: $isAddingTask) {
                    AddTaskView(newMissionTitle: $newMissionTitle, isAddingTask: $isAddingTask, addTask: addTask)
                    .onDisappear {
                        currentDate = Date()
                    }
                }
                .padding(.horizontal)
                .padding(.top, 10)
                .foregroundColor(.white)
                .background(.ultraThinMaterial)
            }
        }
    }
    
    
    func addTask(selectedTime: Date) {
        guard !newMissionTitle.isEmpty else {
            return
        }
        let newMission = Mission(title: newMissionTitle, time: selectedTime)
        
        if let index = tasks.firstIndex(where: { Calendar.current.isDate($0.taskDate, inSameDayAs: currentDate) }) {
            tasks[index].task.append(newMission)
        } else {
            let newTaskMetaData = TaskMetaData(task: [newMission], taskDate: currentDate)
            tasks.append(newTaskMetaData)
        }
        
        let taskData: [String: Any] = [
            "title": newMissionTitle,
            "time": timeFormatter.string(from: selectedTime),
            "selectedDate": dateFormatter.string(from: currentDate)
        ]
        databaseRef.child("tasks").child("tasks").childByAutoId().setValue(taskData)
        
        newMissionTitle = ""
        isAddingTask = false
    }
    
    
    struct AddTaskView: View {
        @Binding var newMissionTitle: String
        @Binding var isAddingTask: Bool
        var addTask: (Date) -> Void
        
        @State private var selectedTime = Date()
        
        var body: some View {
            VStack {
                TextField("Type a new task", text: $newMissionTitle)
                    .padding()
                    .foregroundColor(.black)
                
                DatePicker("Select Time", selection: $selectedTime, displayedComponents: .hourAndMinute)
                    .datePickerStyle(.compact)
                
                Button(action: {
                    print(newMissionTitle)
                    addTask(selectedTime)
                }) {
                    Text("Add")
                        .fontWeight(.bold)
                        .padding(.vertical)
                        .frame(maxWidth: .infinity)
                        .background(Color("Blue"), in: Capsule())
                }
            }
            .padding()
        }
    }
    
    
    struct Home_Previews: PreviewProvider {

        static var previews: some View {
            Home()
        }
    }
}
