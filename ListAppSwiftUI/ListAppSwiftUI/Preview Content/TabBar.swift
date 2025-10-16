//
//  TabBar.swift
//  ListAppSwiftUI
//
//  Created by Rion on 16.10.25.
//

import SwiftUI


struct CustomTabBar: View {
    @Binding var selectedTab: Tab
    
    enum Tab: String, CaseIterable {
        case home = "house"
        case news = "newspaper"
        case hidden = "eye.slash"
    }
    
    var body: some View {
        HStack {
            ForEach(Tab.allCases, id: \.self) { tab in
                Button {
                    selectedTab = tab
                } label: {
                    Image(systemName: tab.rawValue)
                        .font(.system(size: 22, weight: .semibold))
                        .foregroundColor(selectedTab == tab ? .blue : .gray)
                        .frame(maxWidth: .infinity)
                }
            }
        }
        .padding(.horizontal, 25)
        .padding(.vertical, 20)
        .background(
            RoundedRectangle(cornerRadius: 35, style: .continuous)
                .fill(.white)
                .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 5)
        )
        .padding(.horizontal, 40)
        .padding(.bottom, 10)
    }
}

struct ContentVieww: View {
    @State private var selectedTab: CustomTabBar.Tab = .home
    
    var body: some View {
        ZStack(alignment: .bottom) {
            // Your main content
            VStack {
                Text("News Section")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.top, 50)
                
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(.systemGroupedBackground))
            .ignoresSafeArea()
            
            // Custom Tab Bar
            CustomTabBar(selectedTab: $selectedTab)
        }
    }
}

#Preview {
    ContentVieww()
}


