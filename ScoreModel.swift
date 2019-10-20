import Foundation
class ScoreModel {
	var totalScore = 0
	var scores = [Score]()
	init() {
		loadScores()
	}
	func documentDiretory() -> String {
		let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
		return paths[0]
	}
	func dataFilePath() -> String {
		return "\(documentDiretory())/ScoreModel.plist"
	}
	func saveScores() {
		let data = NSMutableData()
		let archiver = NSKeyedArchiver(forWritingWith: data)
		archiver.encode(totalScore, forKey: "TotalScore")
		archiver.encode(scores, forKey: "Scores")
		archiver.finishEncoding()
		data.write(toFile: dataFilePath(), atomically: true)
	}
	func loadScores() {
		let path = dataFilePath()
		if FileManager.default.fileExists(atPath: path) {
			if let data = try? Data(contentsOf: URL(fileURLWithPath: path)) {
				let unarchiver = NSKeyedUnarchiver(forReadingWith: data)
				totalScore = unarchiver.decodeInteger(forKey: "TotalScore")
				scores = unarchiver.decodeObject(forKey: "Scores") as! [Score]
				unarchiver.finishDecoding()
			}
		}
	}
}
