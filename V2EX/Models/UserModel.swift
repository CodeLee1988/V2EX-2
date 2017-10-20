import Foundation

struct UserModel {

    private struct SerializationKeys {
        static let avatarNormal = "avatar_normal"
        static let twitter = "twitter"
        static let github = "github"
        static let avatarMini = "avatar_mini"
        static let website = "website"
        static let bio = "bio"
        static let psn = "psn"
        static let username = "username"
        static let status = "status"
        static let location = "location"
        static let id = "id"
        static let created = "created"
        static let btc = "btc"
        static let tagline = "tagline"
        static let avatarLarge = "avatar_large"
        static let url = "url"
    }

    // MARK: Properties
    public var twitter: String?
    public var github: String?
    public var website: String?
    public var bio: String?
    public var psn: String?
    public var username: String
    public var status: String?
    public var location: String?
    public var id: Int?
    public var created: Int?
    public var btc: String?
    public var url: String
    public var tagline: String?
    public var avatarMini: String?
    public var avatarNormal: String
    public var avatarLarge: String?

    var avatarNormalSrc: String {
        return Constants.Config.URIScheme + avatarNormal
    }

    static var isLogin: Bool {
        if let username = UserModel.current?.username,
            username.isNotEmpty {
            return true
        }
        return false
    }

    public static var current: UserModel? {
        guard let avatarSrc = UserDefaults.get(forKey: Constants.Keys.avatarSrc) as? String,
            let name = UserDefaults.get(forKey: Constants.Keys.username) as? String else {
                return nil
        }
        return UserModel(username: name, url: "/member/\(name)", avatar: avatarSrc)
    }
    
    init(username: String, url: String, avatar: String) {
        self.username = username
        self.url = url
        self.avatarNormal = avatar
    }

    public static func store(_ user: UserModel?) {
        guard let `user` = user else { return }

        UserDefaults.save(at: user.avatarNormal, forKey: Constants.Keys.avatarSrc)
        UserDefaults.save(at: user.username, forKey: Constants.Keys.username)
    }
    
    public func save() {
        UserModel.store(self)
    }
    
    public static func delete() {
        UserDefaults.remove(forKey: Constants.Keys.avatarSrc)
        UserDefaults.remove(forKey: Constants.Keys.username)
    }
}
