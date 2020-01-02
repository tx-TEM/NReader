import Foundation

enum NarouScraperError: Error {
    case network
    case server
    case dataNil
    case parse
    case unknown(String)
}
