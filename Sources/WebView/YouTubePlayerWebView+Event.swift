import Foundation

// MARK: - YouTubePlayerWebView+Event

extension YouTubePlayerWebView {
    
    /// A YouTubePlayerWebView Event
    enum Event: Sendable {
        /// Received JavaScriptEvent from YouTubePlayer
        case receivedJavaScriptEvent(YouTubePlayer.JavaScriptEvent)
        /// Did fail provisional navigation
        case didFailProvisionalNavigation(Error)
        /// Web content process did terminate
        case webContentProcessDidTerminate
    }
    
}

// MARK: - JavaScript Event

extension YouTubePlayerWebView.Event {
    
    /// The received JavaScript event, if available.
    var javaScriptEvent: YouTubePlayer.JavaScriptEvent? {
        if case .receivedJavaScriptEvent(let javaScriptEvent) = self {
            return javaScriptEvent
        } else {
            return nil
        }
    }
    
}
