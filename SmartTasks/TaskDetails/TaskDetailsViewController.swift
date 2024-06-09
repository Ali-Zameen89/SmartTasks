//
//  TaskDetailsViewController.swift
//  SmartTasks
//
//  Created by Ali Shahid on 09/06/2024.
//

import UIKit

final class TaskDetailsViewController: UIViewController {
  
  // Main container view with rounded corners and a clear background
  private lazy var mainContainerView: UIView = {
    let view = UIView()
    view.layer.cornerRadius = 5.0
    view.clipsToBounds = true
    view.backgroundColor = .clear
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  // Background imageView
  private lazy var backgroundImage: UIImageView = {
    let imageView = UIImageView()
    imageView.image = UIImage(named: "task_details_background")
    imageView.clipsToBounds = true
    imageView.backgroundColor = .clear
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  // Main vertical stack view for arranging subviews vertically
  private lazy var mainVerticalStackView: UIStackView = {
    let stackView = UIStackView()
    stackView.axis = .vertical
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.spacing = 10.0
    return stackView
  }()
  
  // Stack view for title and date
  private lazy var titleDateStackView: UIStackView = {
    let stackView = UIStackView()
    stackView.axis = .vertical
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.spacing = 5.0
    return stackView
  }()
  
  // Stack view for due date and days left
  private lazy var dueDateDaysLeftStackView: UIStackView = {
    let stackView = UIStackView()
    stackView.axis = .horizontal
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.spacing = 10.0
    return stackView
  }()
  
  // Custom labels for task details
  let taskTitleLabel = CustomLabel(text: "Task Title", fontSize: .large, fontName: "HelveticaNeue-Bold", textColor: .red)
  let dueDateLabel = CustomLabel(text: "Due date", fontSize: .small, textColor: .systemGray)
  let dueDateValueLabel = CustomLabel(text: "Apr 23 2016", fontSize: .medium, textColor: .red)
  let daysLeftLabel = CustomLabel(text: "Days left", fontSize: .small, textColor: .systemGray)
  let daysLeftValueLabel = CustomLabel(text: "12", fontSize: .medium, textColor: .red)
  let taskDescriptionLabel = CustomLabel(text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus in porta nunc, sed porttitor lectus. Sed dictum velit non orci fringilla tristique. Nam semper gravida consequat. Morbi id tellus nunc.", fontSize: .small)
  let taskStatusLabel = CustomLabel(text: "Unresolved", fontSize: .medium, textColor: .systemOrange)
  
  // Resolve and Can't resolve buttons
  private lazy var resolveButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("Resolve", for: .normal)
    button.backgroundColor = .systemGreen
    button.setTitleColor(.white, for: .normal)
    button.layer.cornerRadius = 5.0
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  private lazy var cantResolveButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("Can't resolve", for: .normal)
    button.backgroundColor = .systemRed
    button.setTitleColor(.white, for: .normal)
    button.layer.cornerRadius = 5.0
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  private lazy var buttonStackView: UIStackView = {
    let stackView = UIStackView()
    stackView.axis = .horizontal
    stackView.distribution = .fillEqually
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.spacing = 10.0
    stackView.addArrangedSubview(resolveButton)
    stackView.addArrangedSubview(cantResolveButton)
    return stackView
  }()
  
  // Interactor to handle business logic
  var interactor: TaskDetailsInteractorProtocol?
  
  // Router to handle navigation
  var router: TaskDetailsRouterProtocol?
  
  // Array of view models to populate the table view
  //  private var viewModels = [TaskViewModel]()
  
  // Load view programmatically
  override func loadView() {
    view = UIView(frame: UIScreen.main.bounds)
  }
  
  // Called after the view has been loaded
  public override func viewDidLoad() {
    super.viewDidLoad()
    setupViews()
    fetchData()
    setupNavigationBar()
  }
  
  // #ALI Refactor this.
  private func setupNavigationBar() {
    navigationItem.title = "Task Detail"
    
    let titleFont = UIFont(name: "HelveticaNeue-Bold", size: 20) ?? UIFont.boldSystemFont(ofSize: 20)
    
    navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white, .font: titleFont]
    
    let backButton = UIBarButtonItem(image: UIImage(named: "back-arrow"), style: .plain, target: self, action: #selector(backButtonTapped))
    
    navigationItem.leftBarButtonItem = backButton
    
    // Background Color
    navigationController?.navigationBar.backgroundColor = AppConstants.Colors.yellowBackgroundColor
    navigationController?.navigationBar.tintColor = .white
    navigationController?.navigationBar.barTintColor = AppConstants.Colors.yellowBackgroundColor
    
    // Remove Separator
    navigationController?.navigationBar.shadowImage = UIImage()
    navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
  }
  
  @objc func backButtonTapped() {
    self.navigationController?.popViewController(animated: true)
  }
  
  private func setupViews() {
    
    view.backgroundColor = AppConstants.Colors.yellowBackgroundColor
    
    view.addSubview(mainContainerView)
    
    mainContainerView.addSubview(backgroundImage)
    
    mainContainerView.addSubview(mainVerticalStackView)
    
    titleDateStackView.addArrangedSubview(taskTitleLabel)
    titleDateStackView.addArrangedSubview(dueDateLabel)
    titleDateStackView.addArrangedSubview(dueDateValueLabel)
    
    dueDateDaysLeftStackView.addArrangedSubview(dueDateLabel)
    dueDateDaysLeftStackView.addArrangedSubview(dueDateValueLabel)
    dueDateDaysLeftStackView.addArrangedSubview(UIView())
    dueDateDaysLeftStackView.addArrangedSubview(daysLeftLabel)
    dueDateDaysLeftStackView.addArrangedSubview(daysLeftValueLabel)
    
    mainVerticalStackView.addArrangedSubview(titleDateStackView)
    mainVerticalStackView.addArrangedSubview(UIView.customSeparatorView)
    mainVerticalStackView.addArrangedSubview(dueDateDaysLeftStackView)
    mainVerticalStackView.addArrangedSubview(UIView.customSeparatorView)
    mainVerticalStackView.addArrangedSubview(taskDescriptionLabel)
    mainVerticalStackView.addArrangedSubview(UIView.customSeparatorView)
    mainVerticalStackView.addArrangedSubview(taskStatusLabel)
    mainVerticalStackView.addArrangedSubview(buttonStackView)
    
    NSLayoutConstraint.activate([
      mainContainerView.safeTop.constraint(equalTo: view.safeTop, constant: 20.0),
      mainContainerView.safeLeading.constraint(equalTo: view.safeLeading, constant: 15.0),
      mainContainerView.safeTrailing.constraint(equalTo: view.safeTrailing, constant: -15.0),
      
      mainVerticalStackView.safeTop.constraint(equalTo: mainContainerView.safeTop, constant: 50.0),
      mainVerticalStackView.safeLeading.constraint(equalTo: mainContainerView.safeLeading, constant: 10.0),
      mainVerticalStackView.safeTrailing.constraint(equalTo: mainContainerView.safeTrailing, constant: -10.0),
      mainVerticalStackView.safeBottom.constraint(equalTo: mainContainerView.safeBottom, constant: -20.0),
      
      resolveButton.heightAnchor.constraint(equalToConstant: 44.0),
      cantResolveButton.heightAnchor.constraint(equalToConstant: 44.0),
      
      backgroundImage.safeTop.constraint(equalTo: mainContainerView.safeTop),
      backgroundImage.safeLeading.constraint(equalTo: mainContainerView.safeLeading),
      backgroundImage.safeTrailing.constraint(equalTo: mainContainerView.safeTrailing),
      backgroundImage.safeBottom.constraint(equalTo: mainContainerView.safeBottom),
    ])
  }
  
  // Fetch task details from the interactor
  private func fetchData() {
    interactor?.getDetails()
  }
}

// Extension to conform to TaskDetailsViewProtocol
extension TaskDetailsViewController: TaskDetailsViewProtocol {
  
  func populateTaskDetails(_ viewModel: TaskDetailsViewModel) {
    taskDescriptionLabel.text = viewModel.taskDescription
    taskTitleLabel.text = viewModel.title
    dueDateValueLabel.text = viewModel.formattedDueDate
  }
  
  
  // Populate table view with tasks
  //  func populateTasks(_ viewModels: [TaskViewModel]) {
  //    hideActivityIndicator()
  //    self.viewModels = viewModels
  //    tableView.isHidden = false
  //    noTasksView.isHidden = true
  //    tableView.reloadData()
  //  }
}
