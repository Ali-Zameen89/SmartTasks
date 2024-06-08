//
//  TasksRouter.swift
//  SmartTasks
//
//  Created by Ali Shahid on 08/06/2024.
//

struct TasksRouter: TasksRouterProtocol {
  
  static func getTasksView() -> TasksViewProtocol? {
    
    let tasksViewController = TasksViewController()
    
//    let interactor = ReferralFirstEntryInteractor(referralOrigin: referralOrigin)
//    let presenter = ReferralFirstEntryPresenter()
//    var router = TasksRouter()
//    presenter.view = referralFirstEntryViewController
//    interactor.presenter = presenter
//    referralFirstEntryViewController.interactor = interactor
//    referralFirstEntryViewController.router = router
    
    return tasksViewController
  }
}



