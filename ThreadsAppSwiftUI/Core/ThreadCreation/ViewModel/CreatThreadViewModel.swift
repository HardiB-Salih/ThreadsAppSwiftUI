//
//  CreatThreadViewModel.swift
//  ThreadsAppSwiftUI
//
//  Created by HardiB.Salih on 5/14/24.
//

import Foundation
import Firebase

class CreatThreadViewModel: ObservableObject {
    
    func uploadThread(caption: String) async throws {
        guard let ownerUid = Auth.auth().currentUser?.uid else { return }
        let thread = Thread(ownerUid: ownerUid, caption: caption, timestamp: Timestamp(), likes: 0, replyCount: 0)
        try await ThreadService.uploadThread(thread)
    }
}
