//
//  TasksPresenter.swift
//  SmartTasks
//
//  Created by Ali Shahid on 09/06/2024.
//

struct TasksPresenter {
  
  weak var view: TasksViewProtocol?
  var viewModels = [TaskViewModel]()
}

extension TasksPresenter: TasksPresenterProtocol {
  
  mutating func formatData(tasks: [Task]?) {
    viewModels.removeAll()
    
    guard let tasks, !tasks.isEmpty else {
      return
    }
    
    for task in tasks {
      viewModels.append(TaskViewModel(task: task))
    }
    
    view?.populateTasks(viewModels)
  }
}
