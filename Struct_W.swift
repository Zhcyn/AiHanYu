import Foundation
struct Struct_W: Characters {
	var characters: [String]
	init(pinyin: String) {
		switch pinyin {
		case "wa":  characters = ["挖", "哇", "蛙", "洼", "娃", "瓦", "袜"]
		case "wai":  characters = ["歪", "外"]
		case "wan":  characters = ["豌", "弯", "湾", "玩", "顽", "丸", "烷", "完", "碗", "挽", "晚", "惋", "婉", "腕", "蔓", "皖", "宛", "万"]
		case "wang":  characters = ["汪", "王", "枉", "网", "往", "旺", "望", "忘", "妄", "亡"]
		case "wei":  characters = ["威", "巍", "微", "危", "韦", "违", "桅", "围", "唯", "惟", "为", "潍", "维", "苇", "萎", "委", "伟", "伪", "纬", "未", "味", "畏", "胃", "喂", "魏", "位", "渭", "谓", "慰", "卫", "尾", "蔚", "尉"]
		case "wen":  characters = ["瘟", "温", "蚊", "文", "闻", "纹", "吻", "稳", "紊", "问"]
		case "weng":  characters = ["嗡", "翁", "瓮"]
		case "wo":  characters = ["挝", "蜗", "窝", "我", "斡", "卧", "握", "沃", "涡"]
		case "wu":  characters = ["巫", "呜", "钨", "乌", "污", "诬", "屋", "芜", "梧", "吾", "吴", "毋", "武", "五", "捂", "午", "舞", "伍", "侮", "坞", "戊", "雾", "晤", "物", "勿", "务", "悟", "误", "恶", "无"]
		default:  characters = [""]
		}
	}
}
