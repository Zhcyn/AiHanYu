import Foundation
import UIKit
struct MyColors {
	static let P_blue: [CGFloat] = [26, 100, 42, 1.0]
	static let P_darkBlue: [CGFloat] = [61, 67, 82, 1.0]
	static let P_gold: [CGFloat] = [221, 183, 116, 1.0]
	static let P_lightGray: [CGFloat] = [240, 240, 240, 1.0]
	static let P_rightGreen: [CGFloat] = [40, 197, 101, 1.0]
	static let P_wrongRed: [CGFloat] = [226, 67, 54, 1.0]
}
extension UIColor {
	class func colorWithValues(_ values: [CGFloat]) -> UIColor {
		return UIColor(red: values[0]/255, green: values[1]/255, blue: values[2]/255, alpha: values[3])
	}
}
