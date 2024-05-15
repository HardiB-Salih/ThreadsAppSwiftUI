//
//  ThreadRepliesViewModel.swift
//  ThreadsAppSwiftUI
//
//  Created by HardiB.Salih on 5/14/24.
//

import Foundation
import Firebase

class ThreadRepliesViewModel: ObservableObject {
    
    func uploadThreadReply(_ replyText: String, thread:Thread) async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        let reply = ThreadReply(
            threadId: thread.id,
            replyText: replyText,
            threadReplyOwnerUid: uid,
            threadOwnerUid: thread.ownerUid,
            timestamp: Timestamp())
        
        try await ThreadReplyService.uploadThreadReply(reply, forThread: thread)
        
    }
}
