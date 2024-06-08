//
//  TaskViewModel.swift
//  SmartTasks
//
//  Created by Ali Shahid on 09/06/2024.
//

import Foundation

struct TaskViewModel {
  
  private let task: Task
  
  private let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd"
    return formatter
  }()
  
  init(task: Task) {
    self.task = task
  }
  
  var title: String? {
    return task.title
  }
  
  var formattedDueDate: String? {
    guard let dueDate = task.dueDate,
          let date = dateFormatter.date(from: dueDate) else { return nil }
    
    dateFormatter.dateFormat = "MMM dd yyyy"
    return dateFormatter.string(from: date)
  }
  
  var daysLeft: String? {
    dateFormatter.dateFormat = "yyyy-MM-dd"
    guard let dueDateString = task.dueDate,
          let dueDate = dateFormatter.date(from: dueDateString) else {
      return nil
    }
    
    let calendar = Calendar.current
    let components = calendar.dateComponents([.day], from: Date(), to: dueDate)
    
    if let days = components.day {
      if days < 0 {
        return "Overdue"
      } else if days == 0 {
        return "Due Today"
      } else {
        return "\(days)"
      }
    } else {
      return nil
    }
  }
}
