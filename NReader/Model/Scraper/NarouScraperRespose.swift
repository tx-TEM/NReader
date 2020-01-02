import Foundation

struct NovelBody {
    var title: String
    var body: [String]

    init(_ title: String?, _ body: [String]) {
        self.title = title ?? ""
        self.body = body
    }
}

