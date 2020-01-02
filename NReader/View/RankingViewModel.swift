import Foundation
import Combine

final class RankingViewModel: ObservableObject {
    @Published var novelInfoList = [NovelInfo]()
    private var subscriptions = Set<AnyCancellable>()

    init() {
        load(sortOption: .hyoka)
    }

    private func load(sortOption: NarouSortOption) {
        NarouAPI
            .novelListRequest(sortOption: sortOption, limit: 100)
            .sink(receiveCompletion: { _ in
            }, receiveValue: { response in
                self.novelInfoList = response.novelInfoList
            })
            .store(in: &subscriptions)
    }

}
