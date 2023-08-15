//
//  File.swift
//  
//
//  Created by Mohamad Rahmani on 8/15/23.
//

import Foundation

public func isOk(_ statusCode: Int) -> Bool {
  return statusCode >= 200 && statusCode < 300
}
