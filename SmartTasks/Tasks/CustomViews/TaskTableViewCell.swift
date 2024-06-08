//
//  TaskTableViewCell.swift
//  SmartTasks
//
//  Created by Ali Shahid on 08/06/2024.
//

import UIKit

final class TaskTableViewCell: UITableViewCell {
  
//  private lazy var addressView: DBZAddressView = {
//    let view = DBZAddressView()
//    view.isSkeletonable = true
//    view.skeletonCornerRadius = 6.0
//    view.translatesAutoresizingMaskIntoConstraints = false
//    return view
//  }()
  
  struct Constants {
    struct Spacing {
    }
    
    struct Color {
    }
  }
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    backgroundColor = .clear
    setupViews()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func prepareForReuse() {
    resetViews()
  }
}

private extension TaskTableViewCell {
  
  // MARK: - Views Setup
  func setupViews() {
//    isSkeletonable = true
//    selectionStyle = .none
//    addressView.handler = self
//    contentView.isSkeletonable = true
//    contentView.addSubview(addressView)
//    addressView.accessibilityIdentifier = "addressView"
//    contentView.backgroundColor = Constants.Color.background
//    
//    NSLayoutConstraint.activate([
//      addressView.top.constraint(equalTo: contentView.safeTop, constant: Constants.Spacing.mini),
//      addressView.bottom.constraint(equalTo: contentView.safeBottom, constant: -Constants.Spacing.mini),
//      addressView.leading.constraint(equalTo: contentView.safeLeading, constant: Constants.Spacing.normal),
//      addressView.trailing.constraint(equalTo: contentView.safeTrailing, constant: -Constants.Spacing.normal)
//    ])
  }
  
  func resetViews() {
  }
}
