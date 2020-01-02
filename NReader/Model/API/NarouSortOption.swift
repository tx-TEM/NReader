import Foundation

enum NarouSortOption: String {
        /// 新着更新順
        case new = "new"
        /// ブックマーク数の多い順
        case favnovelcnt = "favnovelcnt"
        /// レビュー数の多い順
        case reviewcnt = "reviewcnt"
        /// 総合ポイントの高い順
        case hyoka = "hyoka"
        /// 総合ポイントの低い順
        case hyokaasc = "hyokaasc"
        /// 日間ポイントの高い順
        case dailypoint = "dailypoint"
        /// 週間ポイントの高い順
        case weeklypoint = "weeklypoint"
        /// 月間ポイントの高い順
        case monthlypoint = "monthlypoint"
        /// 四半期ポイントの高い順
        case quarterpoint = "quarterpoint"
        /// 年間ポイントの高い順
        case yearlypoint = "yearlypoint"
        /// 感想の多い順
        case impressioncnt = "impressioncnt"
        /// 評価者数の多い順
        case hyokacnt = "hyokacnt"
        /// 評価者数の少ない順
        case hyokacntasc = "hyokacntasc"
        /// 週間ユニークユーザの多い順 (毎週火曜日早朝リセット)
        case weekly = "weekly"
        /// 小説本文の文字数が多い順
        case lengthdesc = "lengthdesc"
        /// 小説本文の文字数が少ない順
        case lengthasc = "lengthasc"
        /// 新着投稿順
        case ncodedesc = "ncodedesc"
        /// 更新が古い順
        case old = "old"
}
