//
//  TasksInteractor.swift
//  SmartTasks
//
//  Created by Ali Shahid on 08/06/2024.
//

struct TasksInteractor {
  
  private var tasksWorker: TasksWorkerProtocol
  var presenter: TasksPresenterProtocol?
  
  init(tasksWorker: TasksWorkerProtocol = TasksWorker()) {
    self.tasksWorker = tasksWorker
  }
}

extension TasksInteractor: TasksInteractorProtocol {
  
  mutating func fetchTasks() {
    var presenter = self.presenter
    tasksWorker.fetchTasks { tasksResponse in
      presenter?.formatData(tasks: tasksResponse.tasks)
    }
  }
}
