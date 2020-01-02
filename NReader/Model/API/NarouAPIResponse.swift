import Foundation

struct NovelInfo: Codable {
    var title: String
    var ncode: String
    var userid: Int
    var writer: String
    var story: String

    var generalLastup: String
    var globalPoint: Int

    enum CodingKeys: String, CodingKey {
        case title
        case ncode
        case userid
        case writer
        case story
        case generalLastup
        case globalPoint
    }
}

struct MetaData: Codable {
    let allcount: Int
}

struct NarouAPIResponse {
    let metaData: MetaData
    let novelInfoList: [NovelInfo]

    init(metaData: MetaData, novelInfoList: [NovelInfo]) {
        self.metaData = metaData
        self.novelInfoList = novelInfoList
    }

}

extension NarouAPIResponse: Decodable {

    init(from decoder: Decoder) throws {
        var meta: MetaData = MetaData(allcount: 0)
        var novelInfoList: [NovelInfo] = []
        var unkeyedContainer = try decoder.unkeyedContainer()

        while !unkeyedContainer.isAtEnd {
            // unkeyedContainer.currentIndex: decodeが成功するたびにインクリメントされる

            do {
                // index 0: MetaData
                if unkeyedContainer.currentIndex == 0 {
                    meta = try unkeyedContainer.decode(MetaData.self)

                } else {
                    let novelInfo = try unkeyedContainer.decode(NovelInfo.self)
                    novelInfoList.append(novelInfo)
                }

            } catch {
                print("error")
            }

        }

        self.init(metaData: meta, novelInfoList: novelInfoList)
    }
}
