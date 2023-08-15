import Foundation

public struct Endpoint<A> {
  public var apiEndpoint: APIEndpoint
  public var request: URLRequest
  var expectedStatusCode: (Int) -> Bool = isOk
  var parse: (Data?, URLResponse?) -> Result<A, Error>
  
  public init(apiEndpoint: APIEndpoint,
              expectedStatusCode: @escaping (Int) -> Bool = isOk,
              parse: @escaping (Data?, URLResponse?) -> Result<A, Error>) {
    
    var components = URLComponents()
    components.scheme = apiEndpoint.scheme.rawValue
    components.host = apiEndpoint.baseURL
    components.path = apiEndpoint.path
    var requestURL: URL = URL(string: "a-url")!
    if let url = components.url {
      requestURL = url
      request = URLRequest(url: requestURL)
    }
    if let params = apiEndpoint.query {
      components.queryItems = params.map {
        URLQueryItem(name: $0.key, value: "\($0.value)")
      }
      requestURL = components.url!
    }
    request = URLRequest(url: requestURL)
    if let accept = apiEndpoint.accept {
      request.setValue(accept.rawValue, forHTTPHeaderField: "Accept")
    }
    if let contentType = apiEndpoint.contentType {
      request.setValue(contentType.rawValue, forHTTPHeaderField: "Content-Type")
    }
    if let headers = apiEndpoint.headers, headers.isEmpty == false {
      for (key, value) in headers {
        request.setValue(value, forHTTPHeaderField: key)
      }
    }
    if let timeoutInterval = apiEndpoint.timeoutInterval {
      request.timeoutInterval = timeoutInterval
    }
    request.httpMethod = apiEndpoint.method.description
    if let body = apiEndpoint.body {
      request.httpBody = body
    }
    self.apiEndpoint = apiEndpoint
    self.expectedStatusCode = expectedStatusCode
    self.parse = parse
  }
}
