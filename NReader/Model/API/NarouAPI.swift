import Alamofire
import Combine
import Foundation

/// 小説家になろうのAPIを扱うクラス
/// 小説のタイトルリスト、ランキング情報を取得可能
final class NarouAPI {

    public static var baseURL: URL {
        URL(string: "https://api.syosetu.com/novelapi/api/")!
    }


    static func novelListRequest(sortOption: NarouSortOption? = nil, limit: Int = 20) -> Future<NarouAPIResponse, Error> {

        let parameters: Parameters = [
            "out" : "json",
            "order" : sortOption?.rawValue ?? "",
            "lim" : String(limit),
            "of" : "t-n-u-w-s-gp-gl"
        ]

        return Future<NarouAPIResponse, Error> { promise in
            AF.request(baseURL,method: .get, parameters: parameters)
                .validate(statusCode: 200..<300)
                .validate(contentType: ["application/json"])
                .responseData { response in
                    switch response.result {
                        case .success:
                            guard let data = response.data else {
                                promise(.failure(NarouAPIError.dataNil))
                                return
                            }
                            
                            let decoder = JSONDecoder()
                            decoder.keyDecodingStrategy = .convertFromSnakeCase

                            guard let response = try? decoder.decode(NarouAPIResponse.self, from: data) else {
                                promise(.failure(NarouAPIError.parse))
                                return
                            }

                            promise(.success(response))

                        case .failure(let error):
                            promise(.failure(error))
                    }
            }
        }
    }

}
