//
//  ThreadsTabView.swift
//  ThreadsAppSwiftUI
//
//  Created by HardiB.Salih on 5/12/24.
//

import SwiftUI

struct ThreadsTabView: View {
    @State private var selectedTab = 0
    @State private var showCreateThread = false
    @Namespace private var tabAnimation
    
    var body: some View {
        TabView(selection: $selectedTab) {
            FeedView()
                .tabItem { Image(systemName: selectedTab == 0 ? "house.fill" : "house")
                        .environment(\.symbolVariants, selectedTab == 0 ? .fill : .none)
                }
                .onAppear { selectedTab = 0 }
                .tag(0)
            
            ExploreView()
                .tabItem { Image(systemName: "magnifyingglass")}
                .onAppear { selectedTab = 1 }
                .tag(1)
            
            CreateThreadView(isPresented: $showCreateThread)
                .tabItem { Image(systemName: "plus")}
                .onAppear { selectedTab = 2 }
                .tag(2)
            
            ActivityView()
                .tabItem { Image(systemName: selectedTab == 3 ? "heart.fill" : "heart")
                        .environment(\.symbolVariants, selectedTab == 3 ? .fill : .none)
                }
                .onAppear { selectedTab = 3 }
                .tag(3)
            
            CurrentUserProfileView()
                .tabItem
            { Image(systemName: selectedTab == 4 ? "person.fill" : "person")
                    .environment(\.symbolVariants, selectedTab == 4 ? .fill : .none)
            }
            .onAppear { selectedTab = 4 }
            .tag(4)
            
        }
        .onChange(of: selectedTab, { oldValue, newValue in
            withAnimation(.smooth) {
                if newValue == 2 {
                    showCreateThread = true
                    selectedTab = 0
                }
            }
        })
        .sheet(isPresented: $showCreateThread) {
            CreateThreadView(isPresented: $showCreateThread)
        }
        .tint(.black)
    }
}

#Preview {
    ThreadsTabView()
}
