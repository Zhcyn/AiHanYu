import Foundation
struct Struct_D: Characters {
	var characters: [String]
	init(pinyin: String) {
		switch pinyin {
		case "da":  characters = ["搭", "达", "答", "瘩", "打", "大"]
		case "dai":  characters = ["歹", "傣", "戴", "带", "殆", "代", "贷", "袋", "待", "逮", "怠", "大", "呆"]
		case "dan":  characters = ["耽", "担", "丹", "郸", "胆", "旦", "氮", "但", "惮", "淡", "诞", "蛋", "掸", "弹", "石", "单"]
		case "dang":  characters = ["当", "挡", "党", "荡", "档"]
		case "dao":  characters = ["刀", "捣", "蹈", "倒", "岛", "祷", "导", "到", "稻", "悼", "道", "盗"]
		case "de":  characters = ["德", "得", "的", "地"]
		case "deng":  characters = ["蹬", "灯", "登", "等", "瞪", "凳", "邓", "澄"]
		case "di":  characters = ["低", "滴", "迪", "敌", "笛", "狄", "涤", "嫡", "抵", "蒂", "第", "帝", "弟", "递", "缔", "的", "堤", "翟", "底", "地", "提"]
		case "dian":  characters = ["颠", "掂", "滇", "碘", "点", "典", "靛", "垫", "电", "甸", "店", "惦", "奠", "淀", "殿", "佃"]
		case "diao":  characters = ["碉", "叼", "雕", "凋", "刁", "掉", "吊", "钓", "调"]
		case "die":  characters = ["跌", "爹", "碟", "蝶", "迭", "谍", "叠"]
		case "ding":  characters = ["盯", "叮", "钉", "顶", "鼎", "锭", "定", "订", "丁"]
		case "diu":  characters = ["丢"]
		case "dong":  characters = ["东", "冬", "董", "懂", "动", "栋", "冻", "洞", "侗", "恫"]
		case "dou":  characters = ["兜", "抖", "斗", "陡", "豆", "逗", "痘", "都"]
		case "du":  characters = ["督", "毒", "犊", "独", "堵", "睹", "赌", "杜", "镀", "肚", "渡", "妒", "都", "读", "度"]
		case "duan":  characters = ["端", "短", "锻", "段", "断", "缎"]
		case "dui":  characters = ["兑", "队", "对", "堆"]
		case "dun":  characters = ["墩", "吨", "钝", "遁", "蹲", "敦", "顿", "囤", "盾"]
		case "duo":  characters = ["掇", "哆", "多", "夺", "垛", "躲", "朵", "跺", "剁", "惰", "度", "舵", "堕"]
		default:  characters = [""]
		}
	}
}