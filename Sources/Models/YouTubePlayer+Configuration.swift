import Foundation

// MARK: - YouTubePlayer+Configuration

public extension YouTubePlayer {
    
    /// A YouTube player configuration.
    struct Configuration: Hashable, Sendable {
        
        // MARK: Properties
        
        /// The fullscreen mode.
        public let fullscreenMode: FullscreenMode
        
        /// A Boolean value that indicates whether HTML5 videos play inline or use the native full-screen controller.
        public let allowsInlineMediaPlayback: Bool
        
        /// A Boolean value that indicates whether HTML5 videos can play Picture in Picture.
        /// - Important: Picture-in-Picture mode may not work in every situation or with every video. Its support and availability depend on the underlying YouTube Player iFrame API.
        /// - Precondition: Please enable the `Audio`, `AirPlay`, and `Picture in Picture` background modes in your app's capabilities.
        /// - Note: Picture-in-Picture media playback is supported only on iOS and visionOS.
        public let allowsPictureInPictureMediaPlayback: Bool
        
        /// Boolean value indicating whether a non-persistent website data store should be used to get and set the site’s cookies and track cached data objects.
        public let useNonPersistentWebsiteDataStore: Bool
        
        /// A Boolean value indicating if safe area insets should be added automatically to content insets.
        public var automaticallyAdjustsContentInsets: Bool
        
        /// A custom user agent of the underlying web view.
        public var customUserAgent: String?
        
        /// The action to perform when a url gets opened.
        public var openURLAction: OpenURLAction
        
        // MARK: Initializer
        
        /// Creates a new instance of ``YouTubePlayer.Configuration``
        /// - Parameters:
        ///   - fullscreenMode: The fullscreen mode. Default value `.preferred`
        ///   - allowsInlineMediaPlayback: A Boolean value that indicates whether HTML5 videos play inline or use the native full-screen controller. Default value `true`
        ///   - allowsPictureInPictureMediaPlayback: A Boolean value that indicates whether HTML5 videos can play Picture in Picture. Default value `false`
        ///   - useNonPersistentWebsiteDataStore: Boolean value indicating whether a non-persistent website data store should be used. Default value `true`
        ///   - automaticallyAdjustsContentInsets: A Boolean value indicating if safe area insets should be added automatically to content insets. Default value `true`
        ///   - customUserAgent: A custom user agent of the underlying web view. Default value `nil`
        ///   - openURLAction: The action to perform when a url gets opened.. Default value `.default`
        public init(
            fullscreenMode: FullscreenMode = .preferred,
            allowsInlineMediaPlayback: Bool = true,
            allowsPictureInPictureMediaPlayback: Bool = false,
            useNonPersistentWebsiteDataStore: Bool = true,
            automaticallyAdjustsContentInsets: Bool = true,
            customUserAgent: String? = nil,
            openURLAction: OpenURLAction = .default
        ) {
            self.fullscreenMode = fullscreenMode
            self.allowsInlineMediaPlayback = allowsInlineMediaPlayback
            self.allowsPictureInPictureMediaPlayback = allowsPictureInPictureMediaPlayback
            self.useNonPersistentWebsiteDataStore = useNonPersistentWebsiteDataStore
            self.automaticallyAdjustsContentInsets = automaticallyAdjustsContentInsets
            self.customUserAgent = customUserAgent
            self.openURLAction = openURLAction
        }
        
    }
    
}

// MARK: - ExpressibleByURL

extension YouTubePlayer.Configuration: ExpressibleByURL {
    
    /// Creates a new instance of ``YouTubePlayer.Configuration``
    /// - Parameter url: The URL.
    public init?(
        url: URL
    ) {
        let queryItems = URLComponents(
            url: url, resolvingAgainstBaseURL: true
        )?
        .queryItems ?? .init()
        self.init(
            allowsInlineMediaPlayback: queryItems
                .first { $0.name == YouTubePlayer.Parameters.CodingKeys.playInline.rawValue }
                .flatMap { $0.value == "1" } ?? true
        )
    }
    
}
