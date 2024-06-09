//
//  CustomLabel.swift
//  SmartTasks
//
//  Created by Ali Shahid on 09/06/2024.
//

import UIKit

final class CustomLabel: UILabel {
  
  enum FontSize {
    case small, medium, large
    
    var size: CGFloat {
      switch self {
      case .small: return 10
      case .medium: return 15
      case .large: return 20
      }
    }
  }
  
  init(text: String, fontSize: FontSize, fontName: String? = nil, textColor: UIColor = .black) {
    super.init(frame: .zero)
    
    self.text = text
    if let fontName = fontName {
      self.font = UIFont(name: fontName, size: fontSize.size)
    } else {
      self.font = UIFont.systemFont(ofSize: fontSize.size)
    }
    
    self.numberOfLines = 0
    self.textColor = textColor
    self.textAlignment = .left
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
