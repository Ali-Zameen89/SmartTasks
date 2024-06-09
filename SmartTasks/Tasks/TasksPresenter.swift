//
//  TasksPresenter.swift
//  SmartTasks
//
//  Created by Ali Shahid on 09/06/2024.
//

struct TasksPresenter {
  // MARK: - Properties
  weak var view: TasksViewProtocol?
  private(set) var viewModels = [TaskViewModel]()
}

extension TasksPresenter: TasksPresenterProtocol {
  
  // MARK: - Data Formatting
  mutating func formatData(tasks: [Task]?) {
    viewModels.removeAll()
    
    guard let tasks = tasks, !tasks.isEmpty else {
      view?.noTasksForToday()
      return
    }
    
    viewModels = tasks.compactMap { TaskViewModel(task: $0) } // Remove nil viewModels
    view?.populateTasks(viewModels)
  }
}
