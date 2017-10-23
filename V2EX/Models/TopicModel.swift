import Foundation
import UIKit

public struct TopicModel {
    var member: MemberModel?
    var node: NodeModel?

    var title: String
    var content: String = ""
    var href: String
    var lastReplyTime: String?
    var replyCount: String

    var publicTime: String = ""

    var once: String?
    var token: String?
    var isFavorite: Bool = false
    var isThank: Bool = false
    
    /// 主题 ID
    var topicID: String? {
        let isTopic = href.hasPrefix("/t/")
        guard isTopic,
            let topicID = href.replacingOccurrences(of: "/t/", with: "").components(separatedBy: "#").first else {
                return nil
        }
        return topicID
    }

    init(member: MemberModel?, node: NodeModel?, title: String, href: String, lastReplyTime: String? = "", replyCount: String = "0") {
        self.member = member
        self.node = node
        self.title = title
        self.href = href
        self.lastReplyTime = lastReplyTime
        self.replyCount = replyCount
    }
    
    
    /// 计算高度 ps: 偷懒做法, 有时间再优化 👻
    var cellHeight: CGFloat {
        return 40 + 45 + title.toHeight(width: UIScreen.screenWidth - 30, fontSize: 17)
    }
}
