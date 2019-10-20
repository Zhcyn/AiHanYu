import Foundation
struct Struct_O: Characters {
	var characters: [String]
	init(pinyin: String) {
		switch pinyin {
		case "o":  characters = ["哦"]
		case "ou":  characters = ["欧", "鸥", "殴", "藕", "呕", "偶", "沤", "区"]
		default:  characters = [""]
		}
	}
}