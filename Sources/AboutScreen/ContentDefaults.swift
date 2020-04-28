import UIKit

extension Item {

    public static func ratings(appStoreId: Int) -> Item {
        let item = Item(imageName: "star.lefthalf.fill", title: "Leave a Review") {
            let appStoreUrl = URL(string: "itms-apps://itunes.apple.com/app/id\(appStoreId)?action=write-review")
            if let appStoreUrl = appStoreUrl {
                UIApplication.shared.open(appStoreUrl, options: [
                    UIApplication.OpenExternalURLOptionsKey.universalLinksOnly: NSNumber(value: false)
                ], completionHandler: nil)
            }
        }
        return item
    }

    public static func moreAppsByLewis() -> UrlItem {
        return UrlItem(imageName: "app.badge", title: "More Apps by Lewis", url: URL(string: "https://apps.apple.com/us/developer/lasmit-tlb-ltd/id535281397")!)
    }
}
