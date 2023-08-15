//
//  Methods.swift
//  
//
//  Created by Mohamad Rahmani on 8/15/23.
//

import Foundation

public enum Methods: String, CustomStringConvertible {
  case get, post, put, patch, delete
  
  public var description: String {
    rawValue.uppercased()
  }
}
