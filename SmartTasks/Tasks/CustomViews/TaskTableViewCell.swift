//
//  TaskTableViewCell.swift
//  SmartTasks
//
//  Created by Ali Shahid on 08/06/2024.
//

import UIKit

final class TaskTableViewCell: UITableViewCell {
  
  // Main container view with rounded corners and a white background
  private lazy var mainContainerView: UIView = {
    let view = UIView()
    view.layer.cornerRadius = 5.0
    view.clipsToBounds = true
    view.backgroundColor = .white
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  // Main vertical stack view for arranging subviews vertically
  private lazy var mainVerticalStackView: UIStackView = {
    let stackView = UIStackView()
    stackView.axis = .vertical
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.spacing = 10.0
    return stackView
  }()
  
  // Main horizontal stack view for arranging subviews horizontally
  private lazy var mainHorizontalStackView: UIStackView = {
    let stackView = UIStackView()
    stackView.axis = .horizontal
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.spacing = 10.0
    return stackView
  }()
  
  // Stack view for due date labels
  private lazy var dueDateStackView: UIStackView = {
    let stackView = UIStackView()
    stackView.axis = .vertical
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.spacing = 7.0
    return stackView
  }()
  
  // Stack view for days left labels
  private lazy var daysLeftStackView: UIStackView = {
    let stackView = UIStackView()
    stackView.axis = .vertical
    stackView.alignment = .trailing
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.spacing = 7.0
    return stackView
  }()
  
  // Custom labels for task details
  let taskTitleLabel = CustomLabel(text: "Task Title", fontSize: .medium, fontName: "HelveticaNeue-Bold")
  let dueDateLabel = CustomLabel(text: "Due date", fontSize: .medium, textColor: .systemGray)
  let dueDateValueLabel = CustomLabel(text: "Apr 23 2016", fontSize: .medium)
  let daysLeftLabel = CustomLabel(text: "Days left", fontSize: .medium, textColor: .systemGray)
  let daysLeftValueLabel = CustomLabel(text: "12", fontSize: .medium)
  
  // Constants struct for spacing and colors (currently commented out)
  struct Constants {
    struct Spacing {
      //      static let mini: CGFloat = 4
      //      static let small: CGFloat = 8
      //      static let normal: CGFloat = 16
      //      static let large: CGFloat = 24
    }
    
    struct Color {
      static let background = UIColor.white
    }
  }
  
  // Initializer for creating the cell programmatically
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    self.contentView.backgroundColor = .clear
    self.backgroundColor = .clear
    setupViews()
  }
  
  // Required initializer for decoding the cell (not implemented)
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // Method to reset the cell's views before reuse
  override func prepareForReuse() {
    resetViews()
  }
  
  // Method to configure the cell with a TaskViewModel
  func setup(_ viewModel: TaskViewModel) {
    taskTitleLabel.text = viewModel.title
    taskTitleLabel.textColor = UIColor(hexString: "EF4B5E")
    dueDateValueLabel.text = viewModel.formattedDueDate
    dueDateValueLabel.textColor = UIColor(hexString: "EF4B5E")
    daysLeftValueLabel.text = viewModel.daysLeft
  }
}

// Private extension for setup and reset methods
private extension TaskTableViewCell {
  
  // Method to setup and layout the views
  func setupViews() {
    contentView.addSubview(mainContainerView)
    mainContainerView.addSubview(mainVerticalStackView)
    
    mainVerticalStackView.addArrangedSubview(taskTitleLabel)
    mainVerticalStackView.addArrangedSubview(UIView.customSeparatorView)
    
    dueDateStackView.addArrangedSubview(dueDateLabel)
    dueDateStackView.addArrangedSubview(dueDateValueLabel)
    
    mainVerticalStackView.addArrangedSubview(dueDateStackView)
    mainHorizontalStackView.addArrangedSubview(dueDateStackView)
    mainHorizontalStackView.addArrangedSubview(UIView.spacer)
    
    daysLeftStackView.addArrangedSubview(daysLeftLabel)
    daysLeftStackView.addArrangedSubview(daysLeftValueLabel)
    mainHorizontalStackView.addArrangedSubview(daysLeftStackView)
    
    mainVerticalStackView.addArrangedSubview(mainHorizontalStackView)
    
    // Activate layout constraints for the views
    NSLayoutConstraint.activate([
      mainContainerView.safeTop.constraint(equalTo: contentView.safeTop, constant: 5.0),
      mainContainerView.safeLeading.constraint(equalTo: contentView.safeLeading, constant: 10.0),
      mainContainerView.safeTrailing.constraint(equalTo: contentView.safeTrailing, constant: -10.0),
      mainContainerView.safeBottom.constraint(equalTo: contentView.safeBottom, constant: -5.0),
      
      mainVerticalStackView.safeTop.constraint(equalTo: mainContainerView.safeTop, constant: 10.0),
      mainVerticalStackView.safeLeading.constraint(equalTo: mainContainerView.safeLeading, constant: 10.0),
      mainVerticalStackView.safeTrailing.constraint(equalTo: mainContainerView.safeTrailing, constant: -10.0),
      mainVerticalStackView.safeBottom.constraint(equalTo: mainContainerView.safeBottom, constant: -10.0)
    ])
  }
  
  // Method to reset the views to their default state
  func resetViews() {
    taskTitleLabel.text = ""
    dueDateValueLabel.text = ""
    daysLeftValueLabel.text = ""
  }
}
