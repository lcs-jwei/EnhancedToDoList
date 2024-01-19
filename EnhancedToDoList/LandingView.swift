//
//  LandingView.swift
//  EnhancedToDoList
//
//  Created by Justin Zack Wei on 2024-01-19.
//

import SwiftUI

struct LandingView: View {
    var body: some View {
        TabView {
            TodoListView()
                .tabItem {
                    Text("Tasks")
                    Image(systemName: "checklist")
                }
            
            StatisticsView()
                .tabItem {
                    Text("Stats")
                    Image(systemName: "chart.line.uptrend.xyaxis")
                }
        }
    }
}

#Preview {
    LandingView()
}


