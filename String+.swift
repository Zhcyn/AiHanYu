import Foundation
extension String {
	var localized: String! {
		let localizedString = NSLocalizedString(self, comment: "")
		return localizedString
	}
	mutating func addPositiveMark() {
		self = "+" + self
	}
}