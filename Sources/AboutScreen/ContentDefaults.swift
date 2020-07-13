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

}
