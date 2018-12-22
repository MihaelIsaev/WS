import Foundation

public struct WSEventIdentifier<P: Codable>: Equatable, Hashable, CustomStringConvertible, ExpressibleByStringLiteral, Codable {
    /// The unique id.
    public let uid: String
    
    /// See `CustomStringConvertible`.
    public var description: String {
        return uid
    }
    
    /// Create a new `EventIdentifier`.
    public init(_ uid: String) {
        self.uid = uid
    }
    
    /// See `ExpressibleByStringLiteral`.
    public init(stringLiteral value: String) {
        self.init(value)
    }
}

//MARK: Local protocol events

public struct JoinPayload: Codable {
    public var channel: UUID
}

public struct LeavePayload: Codable {
    public var channel: UUID
}

extension WSEventIdentifier {
    public static var join: WSEventIdentifier<JoinPayload> { return .init("join") }
    public static var leave: WSEventIdentifier<LeavePayload> { return .init("leave") }
}
