//
//  TasksViewController.swift
//  SmartTasks
//
//  Created by Ali Shahid on 08/06/2024.
//

import UIKit

final class TasksViewController: UIViewController {
  
  var interactor: TasksInteractorProtocol?
  var router: TasksRouterProtocol?
  
  private var viewModels = [TaskViewModel]()
  
  private lazy var tableView: UITableView = {
    let tableView = UITableView()
    tableView.dataSource = self
    tableView.delegate = self
    tableView.backgroundColor = .clear
    tableView.register(TaskTableViewCell.self, forCellReuseIdentifier: TaskTableViewCell.reuseIdentifier)
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    tableView.separatorStyle = .none
    return tableView
  }()
  
  override func loadView() {
    view = UIView(frame: UIScreen.main.bounds)
  }
  
  public override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
    interactor?.fetchTasks()
  }
  
  func setupUI() {
    view.backgroundColor = .white
    
    view.addSubview(tableView)
    
    tableView.backgroundColor = .systemYellow
    
    NSLayoutConstraint.activate([
      tableView.safeTop.constraint(equalTo: view.safeTop),
      tableView.safeLeading.constraint(equalTo: view.safeLeading),
      tableView.safeTrailing.constraint(equalTo: view.safeTrailing),
      tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
    ])
  }
}

extension TasksViewController: TasksViewProtocol {
  
  func populateTasks(_ viewModels: [TaskViewModel]) {
    self.viewModels.removeAll()
    self.viewModels.append(contentsOf: viewModels)
    tableView.reloadData()
  }
}

extension TasksViewController: UITableViewDelegate, UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModels.count
  }
  
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: TaskTableViewCell.self), for: indexPath) as? TaskTableViewCell else {
      return UITableViewCell()
    }
    
    let viewModel = viewModels[indexPath.row]
    
    cell.textLabel?.text = viewModel.title
    
    return cell
  }
  
  
}
