//
//  ContentActionButtonViewModel.swift
//  ThreadsAppSwiftUI
//
//  Created by HardiB.Salih on 5/14/24.
//

import Foundation

@MainActor
class ContentActionButtonViewModel : ObservableObject {
    @Published var thread: Thread
    
    init(thread: Thread) {
        self.thread = thread
        Task { try await cheackIfUserLikedThread() }
    }
    
    
    func likeThread() async throws {
        try await ThreadService.likeThread(thread)
        self.thread.didLike = true
        self.thread.likes += 1
    }
    func unLikeThread() async throws {
        try await ThreadService.unlikeThread(thread)
        self.thread.didLike = false
        self.thread.likes -= 1
    }
    
    func cheackIfUserLikedThread() async throws {
        let didLike =  try await ThreadService.cheackIfUserLikedThread(thread)
        
        // Only execute update if thread has been liked
        if didLike {
            self.thread.didLike = true
        }
    }
}
