import Foundation
import UIKit
typealias finished = (UIImage) -> Void
extension UIImage {
    class func imageWithColor(_ color: UIColor, rect: CGRect) -> UIImage {
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(color.cgColor)
        context!.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
    class func imageWithURL(_ url: URL, done: @escaping finished) {
        let session = URLSession.shared
        session.downloadTask(with: url, completionHandler: { url, response, error in
            if error == nil && url != nil {
                if let data = try? Data(contentsOf: url!) {
                    if let image = UIImage(data: data) {
                        DispatchQueue.main.async {
                            done(image)
                        }
                    }
                }
            }
            })
    }
}
