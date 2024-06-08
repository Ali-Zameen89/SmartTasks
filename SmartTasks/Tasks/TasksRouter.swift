//
//  TasksRouter.swift
//  SmartTasks
//
//  Created by Ali Shahid on 08/06/2024.
//

struct TasksRouter: TasksRouterProtocol {
  
  static func getTasksView() -> TasksViewProtocol? {
    
    let tasksViewController = TasksViewController()
    
    var interactor = TasksInteractor()
    var presenter = TasksPresenter()
    let router = TasksRouter()
    presenter.view = tasksViewController
    interactor.presenter = presenter
    tasksViewController.interactor = interactor
    tasksViewController.router = router
    
    return tasksViewController
  }
}



