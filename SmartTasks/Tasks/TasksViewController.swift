//
//  TasksViewController.swift
//  SmartTasks
//
//  Created by Ali Shahid on 08/06/2024.
//

import UIKit

final class TasksViewController: UIViewController, TasksViewProtocol {
  
  override func loadView() {
    view = UIView(frame: UIScreen.main.bounds)
    view.backgroundColor = .white
  }
}
