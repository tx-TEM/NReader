import SwiftUI

struct RankingView: View {
    @ObservedObject var viewModel: RankingViewModel

    init() {
        viewModel = RankingViewModel()
    }

    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 0) {
                ScrollView {
                    VStack(alignment: .leading, spacing: 0) {
                        ForEach(viewModel.novelInfoList, id: \.ncode) { novelInfo in
                            NovelCell(rank: self.rank(item: novelInfo), novelInfo: novelInfo)
                        }
                    }
                    .frame(maxWidth: .infinity)
                }
            }.navigationBarTitle("ランキング", displayMode: .inline)
        }
    }

    private func rank(item: NovelInfo) -> Int {
        return viewModel.novelInfoList.firstIndex(of: item) ?? 0
    }
}

private struct NovelCell: View {
    let rank: Int
    @State var novelInfo: NovelInfo

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(alignment: .center, spacing: 0) {
                Text("\(rank)")

                Spacer().frame(width: 16)

                Text(novelInfo.title)
            }
        }.padding(.all, 16)
    }
}

struct RankingView_Previews: PreviewProvider {
    static var previews: some View {
        RankingView()
    }
}
