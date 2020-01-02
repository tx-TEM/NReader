import SwiftUI

struct RootView: View {
    var body: some View {
        TabView {
            Text("Home Tab")
                .tabItem {
                    Image(systemName: "1.square.fill")
                    Text("Home")
                }
            Text("Ranking Tab")
                .tabItem {
                    Image(systemName: "2.square.fill")
                    Text("Ranking")
                }
            Text("History Tab")
                .tabItem {
                    Image(systemName: "3.square.fill")
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
