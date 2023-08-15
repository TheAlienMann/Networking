//
//  APIEndpointProtocol.swift
//  
//
//  Created by Mohamad Rahmani on 8/15/23.
//

import Foundation

public protocol APIEndpoint {
  var scheme: HTTPScheme { get }
  var baseURL: String { get }
  var path: String { get }
  var query: [String: String]? { get}
  var headers: [String: String]? { get}
  var method: Methods { get}
  var accept: ContentType? { get }
  var contentType: ContentType? { get }
  var body: Data? { get }
  var timeoutInterval: TimeInterval? { get }
}
