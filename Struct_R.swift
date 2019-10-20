import Foundation
struct Struct_R: Characters {
	var characters: [String]
	init(pinyin: String) {
		switch pinyin {
		case "ran":  characters = ["然", "燃", "冉", "染"]
		case "rang":  characters = ["瓤", "壤", "攘", "嚷", "让"]
		case "rao":  characters = ["饶", "扰", "绕"]
		case "re":  characters = ["惹", "热"]
		case "ren":  characters = ["壬", "仁", "人", "忍", "韧", "任", "认", "刃", "妊", "纫"]
		case "reng":  characters = ["扔", "仍"]
		case "ri":  characters = ["日"]
		case "rong":  characters = ["戎", "茸", "蓉", "荣", "融", "熔", "溶", "容", "绒", "冗"]
		case "rou":  characters = ["揉", "柔", "肉"]
		case "ru":  characters = ["茹", "儒", "孺", "如", "辱", "乳", "汝", "入", "褥", "蠕"]
		case "ruan":  characters = ["软", "阮"]
		case "rui":  characters = ["蕊", "瑞", "锐"]
		case "run":  characters = ["闰", "润"]
		case "ruo":  characters = ["弱", "若"]
		default:  characters = [""]
		}
	}
}