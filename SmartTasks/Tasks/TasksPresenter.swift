//
//  TasksPresenter.swift
//  SmartTasks
//
//  Created by Ali Shahid on 09/06/2024.
//

import Foundation

struct TasksPresenter {
  // MARK: - Properties
  weak var view: TasksViewProtocol?
  private(set) var viewModels = [TaskViewModel]()
  
  /// A date formatter for converting between string and Date representations.
  private let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd" // Initial format for parsing the due date
    return formatter
  }()
}

extension TasksPresenter: TasksPresenterProtocol {
  
  // MARK: - Data Formatting
  mutating func formatData(selectedDate: Date, tasks: [Task]?) {
    viewModels.removeAll()
    
    guard let tasks = tasks, !tasks.isEmpty else {
      view?.noTasksForToday()
      return
    }
    
    viewModels = tasks.compactMap { TaskViewModel(task: $0) } // Remove nil viewModels
    view?.populateTasks(targetDate: "", viewModels: viewModels)
  }
  
//  func formattedTargetDate(date: Date) -> String? {
//      dateFormatter.dateFormat = "yyyy-MM-dd" // Reset the date formatter for parsing
//      
//      // Ensure the due date string is valid and can be converted to a Date
//      guard let dueDateString = date,
//            let dueDate = dateFormatter.date(from: dueDateString) else {
//        return nil
//      }
//      
//      let calendar = Calendar.current
//      let components = calendar.dateComponents([.day], from: Date(), to: dueDate)
//      
//      // Calculate days remaining and format the result
//      if let days = components.day {
//        if days < 0 {
//          return "Overdue"
//        } else if days == 0 {
//          return "Due Today"
//        } else {
//          return "\(days)" // Only the number, matching the design
//        }
//      } else {
//        return nil // Handle unexpected date calculation errors
//      }
//      return task.targetDate?.getFormattedDate()
//    }
    
}
