//
//  TasksProtocols.swift
//  SmartTasks
//
//  Created by Ali Shahid on 08/06/2024.
//

import Foundation

protocol TasksRouterProtocol {
  
}

protocol TasksViewProtocol: AnyObject {
//  var router: TasksRouterProtocol { get set }
//  var interactor: TasksInteractorProtocol { get set }
  
  func populateTasks(_ viewModels: [TaskViewModel])
}

protocol TasksInteractorProtocol {
  mutating func fetchTasks()
}

protocol TasksPresenterProtocol {
  mutating func formatData(tasks: [Task]?)
}

protocol TasksWorkerProtocol {
  func fetchTasks(completion: @escaping (TasksResponse) -> Void)
}

protocol TasksRemoteDataSourceProtocol {
  func fetchTasks(completion: @escaping (TasksResponse) -> Void)
}
