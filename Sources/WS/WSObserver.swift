import Foundation

open class WSObserver: WSControllerable {
    public weak var logger: WSLoggable?
    
    public init () {}
    
    //MARK: WSDelegate
    
    public func wsOnOpen(_ ws: WS, _ client: WSClient) -> Bool {
        if ws.clients.insert(client).inserted {
            return true
        }
        client.connection.close(code: .unexpectedServerError)
        return false
    }
    
    public func wsOnClose(_ ws: WS, _ client: WSClient) {
        ws.clients.remove(client)
        ws.channels.forEach { channel in
            channel.clients.remove(client)
        }
    }
    
    public func wsOnText(_ ws: WS, _ client: WSClient, _ text: String) {}
    public func wsOnBinary(_ ws: WS, _ client: WSClient, _ data: Data) {}
    public func wsOnError(_ ws: WS, _ client: WSClient, _ error: Error) {}
}
