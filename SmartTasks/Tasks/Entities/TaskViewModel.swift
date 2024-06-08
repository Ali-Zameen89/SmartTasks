//
//  TaskViewModel.swift
//  SmartTasks
//
//  Created by Ali Shahid on 09/06/2024.
//

struct TaskViewModel {
  
  private let task: Task
  
  init(task: Task) {
    self.task = task
  }
  
  var title: String? {
    return task.title
  }
}
