import Foundation
struct Struct_T: Characters {
	var characters: [String]
	init(pinyin: String) {
		switch pinyin {
		case "ta":  characters = ["塌", "他", "它", "她", "獭", "挞", "蹋", "踏", "塔", "拓"]
		case "tai":  characters = ["胎", "苔", "抬", "台", "泰", "酞", "太", "态", "汰"]
		case "tan":  characters = ["坍", "摊", "贪", "瘫", "滩", "坛", "檀", "痰", "潭", "谭", "谈", "坦", "毯", "袒", "碳", "探", "叹", "炭", "弹"]
		case "tang":  characters = ["塘", "搪", "堂", "棠", "膛", "唐", "糖", "躺", "淌", "趟", "烫", "敞", "汤", "倘"]
		case "tao":  characters = ["掏", "涛", "滔", "绦", "萄", "桃", "逃", "淘", "讨", "套", "陶"]
		case "te":  characters = ["特"]
		case "teng":  characters = ["藤", "腾", "疼", "誊"]
		case "ti":  characters = ["梯", "剔", "踢", "锑", "题", "蹄", "啼", "体", "替", "嚏", "惕", "涕", "剃", "屉", "提"]
		case "tian":  characters = ["天", "添", "填", "田", "甜", "恬", "舔", "腆", "蚕"]
		case "tiao":  characters = ["挑", "条", "迢", "眺", "跳", "调"]
		case "tie":  characters = ["贴", "铁", "帖"]
		case "ting":  characters = ["厅", "烃", "汀", "廷", "停", "亭", "庭", "挺", "艇", "听"]
		case "tong":  characters = ["通", "桐", "酮", "瞳", "同", "铜", "彤", "童", "桶", "捅", "筒", "统", "痛", "侗", "恫"]
		case "tou":  characters = ["偷", "投", "头", "透"]
		case "tu":  characters = ["秃", "突", "图", "徒", "途", "涂", "屠", "土", "吐", "兔", "凸", "余"]
		case "tuan":  characters = ["湍", "团"]
		case "tui":  characters = ["推", "颓", "腿", "蜕", "退", "褪"]
		case "tun":  characters = ["吞", "屯", "臀", "囤"]
		case "tuo":  characters = ["拖", "托", "脱", "鸵", "陀", "驼", "椭", "妥", "唾", "驮", "拓"]
		default:  characters = [""]
		}
	}
}