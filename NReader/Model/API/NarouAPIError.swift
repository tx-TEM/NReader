import Foundation

enum NarouAPIError: Error {
    case network
    case server
    case dataNil
    case parse
    case unknown(String)
}
