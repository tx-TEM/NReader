import SwiftUI
import Combine

struct RootView: View {
    var body: some View {
        TabView {
            Text("Home Tab")
            .tabItem {
                Image(systemName: "house")
                Text("Home")
            }
            RankingView()
                .tabItem {
                    Image(systemName: "list.number")
                    Text("Ranking")
                }
            Text("History Tab")
                .tabItem {
                    Image(systemName: "clock")
                    Text("History")
                }
        }
        .font(.headline)
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
