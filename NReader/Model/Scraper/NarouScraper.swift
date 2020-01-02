import Alamofire
import Combine
import Kanna

/// 小説家になろうへのスクレイピングを行うクラス
/// 小説の本文、各話のリストを取得する
final class NarouScraper {

    public static var baseURL: URL {
        URL(string: "https://ncode.syosetu.com/")!
    }


    /// 小説の本文情報を取得
    public static func getNovelBody(_ ncode: String, _ episode: Int) -> Future<NovelBody,Error> {
        let path = "\(ncode)/\(String(episode))/"
        let url = baseURL.appendingPathComponent(path)

        return Future<NovelBody,Error> { promise in
            AF.request(url, method: .get)
                .validate(statusCode: 200..<300)
                .responseString { response in
                    switch response.result {
                    case .success:
                        guard let html = response.value else {
                            promise(.failure(NarouScraperError.dataNil))
                            return
                        }

                        guard let body = self.parseNovelBody(html) else {
                            promise(.failure(NarouScraperError.parse))
                            return
                        }

                        promise(.success(body))

                    case .failure(let error):
                        promise(.failure(error))
                    }

            }
        }
    }

    private static func parseNovelBody(_ html: String) -> NovelBody? {
        guard let doc = try? HTML(html: html, encoding: .utf8) else {
            return nil
        }

        let title = doc.xpath("//*[@id=\"novel_color\"]/p").first?.text ?? ""
        let body = doc.xpath("//*[@id=\"novel_honbun\"]").compactMap { $0.text }

        return NovelBody(title, body)
    }

}

