import Foundation
struct Struct_Q: Characters {
	var characters: [String]
	init(pinyin: String) {
		switch pinyin {
		case "qi":  characters = ["欺", "戚", "妻", "七", "凄", "柒", "沏", "棋", "歧", "崎", "脐", "旗", "祈", "祁", "骑", "起", "岂", "乞", "企", "启", "器", "气", "迄", "弃", "汽", "讫", "稽", "缉", "期", "栖", "其", "奇", "畦", "齐", "砌", "泣", "漆", "契"]
		case "qia":  characters = ["掐", "卡", "洽"]
		case "qian":  characters = ["牵", "扦", "钎", "千", "迁", "签", "仟", "谦", "黔", "钱", "钳", "前", "潜", "遣", "谴", "堑", "欠", "歉", "铅", "乾", "浅", "嵌", "纤"]
		case "qiang":  characters = ["枪", "呛", "腔", "羌", "墙", "蔷", "抢", "强"]
		case "qiao":  characters = ["锹", "敲", "悄", "桥", "乔", "侨", "巧", "撬", "翘", "峭", "俏", "窍", "壳", "橇", "瞧", "鞘", "雀"]
		case "qie":  characters = ["切", "窃", "砌", "茄", "且", "怯"]
		case "qin":  characters = ["钦", "侵", "秦", "琴", "勤", "芹", "擒", "禽", "寝", "亲", "沁"]
		case "qing":  characters = ["青", "轻", "氢", "倾", "卿", "清", "擎", "晴", "氰", "情", "顷", "请", "庆", "亲"]
		case "qiong":  characters = ["琼", "穷"]
		case "qiu":  characters = ["秋", "丘", "邱", "球", "求", "囚", "酋", "泅"]
		case "qu":  characters = ["趋", "曲", "躯", "屈", "驱", "渠", "取", "娶", "龋", "去", "区", "蛆", "趣"]
		case "quan":  characters = ["颧", "权", "醛", "泉", "全", "痊", "拳", "犬", "券", "劝", "卷", "圈"]
		case "que":  characters = ["缺", "瘸", "却", "鹊", "榷", "确", "炔", "雀"]
		case "qun":  characters = ["裙", "群"]
		default:  characters = [""]
		}
	}
}