import Foundation
import UIKit
class Score: NSObject, NSCoding {
	var score: Int!
	var time: Date!
	override init() {
		self.score = 0
		self.time = Date()
	}
	init(score: Int, time: Date) {
		self.score = score
		self.time = time
	}
	func encode(with aCoder: NSCoder) {
		aCoder.encode(score, forKey: "Score")
		aCoder.encode(time, forKey: "Time")
	}
	required init?(coder aDecoder: NSCoder) {
		score = aDecoder.decodeObject(forKey: "Score") as! Int
		time = aDecoder.decodeObject(forKey: "Time") as! Date
		super.init()
	}
}
