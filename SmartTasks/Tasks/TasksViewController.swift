//
//  TasksViewController.swift
//  SmartTasks
//
//  Created by Ali Shahid on 08/06/2024.
//

import UIKit

final class TasksViewController: UIViewController {
  
  // Interactor to handle business logic
  var interactor: TasksInteractorProtocol?
  // Router to handle navigation
  var router: TasksRouterProtocol?
  
  // Array of view models to populate the table view
  private var viewModels = [TaskViewModel]()
  
  // Table view to display the tasks
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
  
  private lazy var noTasksView: NoTasksView = {
    let view = NoTasksView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  // Activity indicator to show progress
  private let activityIndicator = UIActivityIndicatorView(style: .large)
  
  // Load view programmatically
  override func loadView() {
    view = UIView(frame: UIScreen.main.bounds)
    view.backgroundColor = .white
  }
  
  // Called after the view has been loaded
  public override func viewDidLoad() {
    super.viewDidLoad()
    setupTableView()
    setupMainView()
    setupActivityIndicator()
    fetchData()
    setupNavigationBar()
  }
  
  // #ALI Refactor this.
  private func setupNavigationBar() {
    navigationItem.title = "Today"
    
    let titleFont = UIFont(name: "HelveticaNeue-Bold", size: 20) ?? UIFont.boldSystemFont(ofSize: 20)
    
    navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white, .font: titleFont]
    
    let backButton = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: #selector(backButtonTapped))
    let forwardButton = UIBarButtonItem(image: UIImage(systemName: "chevron.right"), style: .plain, target: self, action: #selector(forwardButtonTapped))
    navigationItem.leftBarButtonItem = backButton
    navigationItem.rightBarButtonItem = forwardButton
    
    // Background Color (Yellow)
    let yellowColor = UIColor(hexString: "FFDE61")
    navigationController?.navigationBar.backgroundColor = yellowColor
    navigationController?.navigationBar.tintColor = .white
    navigationController?.navigationBar.barTintColor = yellowColor
    
    // Remove Separator
    navigationController?.navigationBar.shadowImage = UIImage()
    navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
  }
  
  @objc func backButtonTapped() {
    showActivityIndicator()
    interactor?.fetchTasksForDate(.previous)
  }
  
  @objc func forwardButtonTapped() {
    showActivityIndicator()
    interactor?.fetchTasksForDate(.next)
  }
  
  // Setup the table view layout and constraints
  private func setupTableView() {
    view.backgroundColor = .white
    view.addSubview(tableView)
    tableView.backgroundColor = UIColor(hexString: "FFDE61")
    
    NSLayoutConstraint.activate([
      tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
      tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
      tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
    ])
  }
  
  private func setupMainView() {
    view.backgroundColor = UIColor(hexString: "FFDE61")
  }
  
  // Setup the activity indicator layout and constraints
  private func setupActivityIndicator() {
    activityIndicator.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(activityIndicator)
    
    NSLayoutConstraint.activate([
      activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)
    ])
  }
  
  // Show activity indicator and disable user interaction
  private func showActivityIndicator() {
    activityIndicator.startAnimating()
    view.isUserInteractionEnabled = false
  }
  
  // Hide activity indicator and enable user interaction
  private func hideActivityIndicator() {
    activityIndicator.stopAnimating()
    view.isUserInteractionEnabled = true
  }
  
  // Fetch tasks from the interactor
  private func fetchData() {
    showActivityIndicator()
    interactor?.fetchAllTasks()
  }
}

// Extension to conform to TasksViewProtocol
extension TasksViewController: TasksViewProtocol {
  
  // Populate table view with tasks
  func populateTasks(_ viewModels: [TaskViewModel]) {
    hideActivityIndicator()
    self.viewModels = viewModels
    tableView.isHidden = false
    noTasksView.isHidden = true
    tableView.reloadData()
  }
  
  // Show no tasks for today view
  func noTasksForToday() {
    hideActivityIndicator()
    
    tableView.isHidden = true
    
    noTasksView.removeFromSuperview()
    view.addSubview(noTasksView)
    
    // Set up constraints for noTasksView to center it in the view
    NSLayoutConstraint.activate([
      noTasksView.centerX.constraint(equalTo: view.centerX),
      noTasksView.centerY.constraint(equalTo: view.centerY),
      noTasksView.safeLeading.constraint(equalTo: view.safeLeading, constant: 20),
      noTasksView.safeTrailing.constraint(equalTo: view.safeTrailing, constant: -20)
    ])
  }
}

// Extension to conform to UITableViewDelegate and UITableViewDataSource
extension TasksViewController: UITableViewDelegate, UITableViewDataSource {
  
  // Return the number of rows in the section
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModels.count
  }
  
  // Configure the cell for the row at indexPath
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: TaskTableViewCell.reuseIdentifier, for: indexPath) as? TaskTableViewCell else {
      return UITableViewCell()
    }
    
    let viewModel = viewModels[indexPath.row]
    cell.setup(viewModel)
    
    return cell
  }
  
  // Handle row selection
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
  }
}