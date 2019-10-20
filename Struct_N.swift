import Foundation
struct Struct_N: Characters {
	var characters: [String]
	init(pinyin: String) {
		switch pinyin {
		case "na":  characters = ["拿", "钠", "纳", "呐", "那", "娜", "哪"]
		case "nai":  characters = ["氖", "乃", "奶", "耐", "奈", "哪"]
		case "nan":  characters = ["南", "男", "难"]
		case "nang":  characters = ["囊"]
		case "nao":  characters = ["挠", "脑", "恼", "闹", "淖"]
		case "ne":  characters = ["呢", "哪"]
		case "nei":  characters = ["馁", "内", "那", "哪"]
		case "nen":  characters = ["嫩"]
		case "neng":  characters = ["能"]
		case "ni":  characters = ["妮", "霓", "倪", "泥", "尼", "拟", "你", "匿", "腻", "逆", "溺", "呢"]
		case "nian":  characters = ["蔫", "拈", "年", "碾", "撵", "捻", "念", "粘"]
		case "niang":  characters = ["娘", "酿"]
		case "niao":  characters = ["鸟", "尿"]
		case "nie":  characters = ["捏", "聂", "孽", "啮", "镊", "镍", "涅"]
		case "nin":  characters = ["您"]
		case "ning":  characters = ["柠", "狞", "凝", "宁", "拧", "泞"]
		case "niu":  characters = ["牛", "扭", "钮", "纽"]
		case "nong":  characters = ["脓", "浓", "农", "弄"]
		case "nu":  characters = ["奴", "怒", "努"]
		case "nv":  characters = ["女"]
		case "nve":  characters = ["虐", "疟"]
		case "nuan":  characters = ["暖"]
		case "nuo":  characters = ["挪", "懦", "糯", "诺", "娜"]
		default:  characters = [""]
		}
	}
}