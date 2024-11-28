import Moya
import Foundation

enum SearchAPI {
    case search(query: String)
}

extension SearchAPI: TargetType {
    var baseURL: URL {
        return URL(string: "https://dummyjson.com")!
    }

    var path: String {
        switch self {
        case .search:
            return "/products/search"
        }
    }

    var method: Moya.Method {
        return .get
    }

    var task: Task {
        switch self {
        case .search(let query):
            return .requestParameters(parameters: ["q": query], encoding: URLEncoding.queryString)
        }
    }

    var headers: [String: String]? {
        return ["Content-Type": "application/json"]
    }

    var sampleData: Data {
        return Data()
    }
}
