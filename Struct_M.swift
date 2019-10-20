import Foundation
struct Struct_M: Characters {
	var characters: [String]
	init(pinyin: String) {
		switch pinyin {
		case "ma":  characters = ["妈", "麻", "玛", "码", "蚂", "马", "骂", "嘛", "吗", "摩", "抹", "么"]
		case "mai":  characters = ["买", "麦", "卖", "迈", "埋", "脉"]
		case "man":  characters = ["瞒", "馒", "蛮", "满", "曼", "慢", "漫", "谩", "埋", "蔓"]
		case "mang":  characters = ["茫", "盲", "氓", "忙", "莽", "芒"]
		case "mao":  characters = ["猫", "茅", "锚", "毛", "矛", "铆", "卯", "茂", "帽", "貌", "贸", "冒"]
		case "me":  characters = ["么"]
		case "mei":  characters = ["玫", "枚", "梅", "酶", "霉", "煤", "眉", "媒", "镁", "每", "美", "昧", "寐", "妹", "媚", "没", "糜"]
		case "men":  characters = ["门", "闷", "们"]
		case "meng":  characters = ["萌", "蒙", "檬", "锰", "猛", "梦", "孟", "盟"]
		case "mi":  characters = ["眯", "醚", "靡", "迷", "弥", "米", "觅", "蜜", "密", "幂", "糜", "谜", "泌", "秘"]
		case "mian":  characters = ["棉", "眠", "绵", "冕", "免", "勉", "缅", "面", "娩"]
		case "miao":  characters = ["苗", "描", "瞄", "藐", "秒", "渺", "庙", "妙"]
		case "mie":  characters = ["蔑", "灭"]
		case "min":  characters = ["民", "抿", "皿", "敏", "悯", "闽"]
		case "ming":  characters = ["明", "螟", "鸣", "铭", "名", "命"]
		case "miu":  characters = ["谬"]
		case "mo":  characters = ["摸", "摹", "蘑", "膜", "磨", "魔", "末", "莫", "墨", "默", "沫", "漠", "寞", "陌", "脉", "没", "模", "摩", "抹"]
		case "mou":  characters = ["谋", "某", "牟"]
		case "mu":  characters = ["拇", "牡", "亩", "姆", "母", "墓", "暮", "幕", "募", "慕", "木", "目", "睦", "牧", "穆", "姥", "模", "牟"]
		default:  characters = [""]
		}
	}
}