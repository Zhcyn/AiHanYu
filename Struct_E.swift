import Foundation
struct Struct_E: Characters {
	var characters: [String]
	init(pinyin: String) {
		switch pinyin {
		case "e":  characters = ["峨", "鹅", "俄", "额", "讹", "娥", "厄", "扼", "遏", "鄂", "饿", "阿", "蛾", "恶", "哦"]
		case "en":  characters = ["恩"]
		case "er":  characters = ["而", "耳", "尔", "饵", "洱", "二", "贰", "儿"]
		default:  characters = [""]
		}
	}
}