import Foundation
import SwiftData

@Model
class User {
    
    @Attribute(.unique) var UserID: String
    var name: String
    var tokenAmount: Int
    
    init(UserID: String, name: String, tokenAmount: Int) {
        self.UserID = UserID
        self.name = name
        self.tokenAmount = tokenAmount
    }
}
