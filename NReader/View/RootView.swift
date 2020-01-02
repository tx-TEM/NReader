import SwiftUI
import Combine

struct RootView: View {
    @State private var subscriptions = Set<AnyCancellable>()

    var body: some View {
        TabView {
            VStack {
                Text("Home Tab")
                Button(action: {
                    NarouAPI.novelListRequest(sortOption: .hyoka)
                    .sink(receiveCompletion: { completion in
                        switch completion {
                            case .finished:
                                print("finish")
                            case .failure(let error):
                                print(error)
                        }
                    }, receiveValue: { response in
                        print(response)
                    })
                    .store(in: &self.subscriptions)
                }, label: {
                    Text("Tap")
                })
            }
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
