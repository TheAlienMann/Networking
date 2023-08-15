//
//  File.swift
//  
//
//  Created by Mohamad Rahmani on 8/15/23.
//

import Foundation

public struct NoDataError: Error {
  public init() { }
}

public struct UnknownError: Error {
  public init() { }
}

public struct WrongStatusCodeError: Error {
  public let statusCdoe: Int
  public let response: HTTPURLResponse?
  public let responseBody: Data?
  
  public init(statusCdoe: Int,
              response: HTTPURLResponse?,
              responseBody: Data?) {
    self.statusCdoe = statusCdoe
    self.response = response
    self.responseBody = responseBody
  }
}
