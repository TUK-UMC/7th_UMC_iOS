import Foundation
import Alamofire

final class APIClient {
    static let shared = APIClient()
    
    private let session: Session
    private let apiKey: String
    
    private init() {
        // Info.plist에서 API_KEY 가져오기
        guard let apiKey = Bundle.main.object(forInfoDictionaryKey: "API_KEY") as? String else {
            fatalError("API_KEY가 설정되지 않았습니다.")
        }
        
        self.apiKey = apiKey
        let interceptor = AuthorizationInterceptor(kakaoKey: apiKey) // 불러온 API key 사용
        session = Session(interceptor: interceptor)
    }
    
    public func request<T: Codable>(
        _ url: String,
        method: HTTPMethod,
        parameters: Parameters? = nil,
        completion: @escaping (Result<T, Error>) -> Void) {
            session.request(url, method: method, parameters: parameters)
                .validate()
                .responseDecodable(of: T.self) { response in
                    switch response.result {
                    case .success(let value):
                        completion(.success(value))
                    case .failure(let error):
                        completion(.failure(error))
                    }
                }
        }
}
