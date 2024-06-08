//
//  Extensions.swift
//  SmartTasks
//
//  Created by Ali Shahid on 08/06/2024.
//

import UIKit

extension UIView {
  
  var safeTopAnchor: NSLayoutYAxisAnchor {
    safeAreaLayoutGuide.topAnchor
  }
  
  var safeLeadingAnchor: NSLayoutXAxisAnchor {
    safeAreaLayoutGuide.leadingAnchor
  }
  
  var safeTrailingAnchor: NSLayoutXAxisAnchor {
    safeAreaLayoutGuide.trailingAnchor
  }
  
  var safeBottomAnchor: NSLayoutYAxisAnchor {
    safeAreaLayoutGuide.bottomAnchor
  }
  
  var trailing: NSLayoutXAxisAnchor {
    trailingAnchor
  }
  
  var leading: NSLayoutXAxisAnchor {
    leadingAnchor
  }
  
  var top: NSLayoutYAxisAnchor {
    topAnchor
  }
  
  var bottom: NSLayoutYAxisAnchor {
    bottomAnchor
  }
  
  var safeTop: NSLayoutYAxisAnchor {
    return self.safeAreaLayoutGuide.topAnchor
  }
  
  var safeLeading: NSLayoutXAxisAnchor {
    return self.safeAreaLayoutGuide.leadingAnchor
  }
  
  var safeTrailing: NSLayoutXAxisAnchor {
    return self.safeAreaLayoutGuide.trailingAnchor
  }
  
  var safeBottom: NSLayoutYAxisAnchor {
    return self.safeAreaLayoutGuide.bottomAnchor
  }
  
  var centerY: NSLayoutYAxisAnchor {
    centerYAnchor
  }
  
  var centerX: NSLayoutXAxisAnchor {
    centerXAnchor
  }
}

extension UITableViewCell {
  class var reuseIdentifier: String {
    return String(describing: self)
  }
}
