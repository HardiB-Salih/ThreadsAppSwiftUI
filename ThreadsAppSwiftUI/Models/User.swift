//
//  User.swift
//  ThreadsAppSwiftUI
//
//  Created by HardiB.Salih on 5/13/24.
//

import Foundation

struct User: Identifiable, Codable, Hashable {
    let id: String
    let email: String
    let fullname: String
    let username: String
    var profileImageUrl: String?
    var bio: String?
}
