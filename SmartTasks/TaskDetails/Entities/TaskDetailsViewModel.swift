//
//  TaskDetailsViewModel.swift
//  SmartTasks
//
//  Created by Ali Shahid on 09/06/2024.
//

import Foundation

/// Represents a view model for displaying task detail information in the UI.
struct TaskDetailsViewModel {
  
  // MARK: - Private Properties
  
  /// The underlying Task data model.
  private let task: Task
  
  
  // MARK: - Initialization
  
  /// Initializes a TaskViewModel with a Task object.
  /// - Parameter task: The Task object containing the data to be displayed.
  init(task: Task) {
    self.task = task
  }
  
  // MARK: - Computed Properties
  
  /// The title of the task.
  var title: String? {
    return task.title
  }
  
  /// The description of the task.
  var taskDescription: String? {
    return task.description
  }
  
  /// The due date of the task, formatted as "MMM dd yyyy" (e.g., "Aug 31 2024").
  var formattedDueDate: String? {
    return task.dueDate?.getFormattedDate()
  }
  
  // MARK: - Getters
  
  var taskEntity: Task {
    return task
  }
}
