//
//  TaskDetailsInteractor.swift
//  SmartTasks
//
//  Created by Ali Shahid on 09/06/2024.
//

final class TaskDetailsInteractor {
  
  private let task: Task
  
  var presenter: TaskDetailsPresenterProtocol?
  
  init(task: Task) {
    self.task = task
  }
}

extension TaskDetailsInteractor: TaskDetailsInteractorProtocol {
  
  func getDetails() {
    presenter?.formatData(self.task)
  }
}

