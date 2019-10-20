import Foundation
struct Struct_L: Characters {
	var characters: [String]
	init(pinyin: String) {
		switch pinyin {
		case "la":  characters = ["垃", "拉", "喇", "辣", "啦", "蜡", "腊", "落"]
		case "lai":  characters = ["莱", "来", "赖"]
		case "lan":  characters = ["婪", "栏", "拦", "篮", "阑", "兰", "澜", "谰", "揽", "览", "懒", "缆", "烂", "滥", "蓝"]
		case "lang":  characters = ["琅", "榔", "狼", "廊", "郎", "朗", "浪"]
		case "lao":  characters = ["捞", "劳", "牢", "老", "佬", "涝", "姥", "酪", "烙", "潦", "落"]
		case "le":  characters = ["勒", "乐", "肋", "了"]
		case "lei":  characters = ["雷", "镭", "蕾", "磊", "累", "儡", "垒", "擂", "类", "泪", "勒", "肋"]
		case "leng":  characters = ["楞", "冷", "棱"]
		case "li":  characters = ["厘", "梨", "犁", "黎", "篱", "狸", "离", "漓", "理", "李", "里", "鲤", "礼", "莉", "荔", "吏", "栗", "丽", "厉", "励", "砾", "历", "利", "例", "俐", "痢", "立", "粒", "沥", "隶", "力", "璃", "哩"]
		case "lian":  characters = ["联", "莲", "连", "镰", "廉", "涟", "帘", "敛", "脸", "链", "恋", "炼", "练", "怜"]
		case "liang":  characters = ["粮", "凉", "梁", "粱", "良", "两", "辆", "量", "晾", "亮", "谅", "俩"]
		case "liao":  characters = ["撩", "聊", "僚", "疗", "燎", "寥", "辽", "撂", "镣", "廖", "料", "潦", "了"]
		case "lie":  characters = ["列", "裂", "烈", "劣", "猎"]
		case "lin":  characters = ["琳", "林", "磷", "霖", "临", "邻", "鳞", "淋", "凛", "赁", "吝", "拎"]
		case "ling":  characters = ["玲", "菱", "零", "龄", "铃", "伶", "羚", "凌", "灵", "陵", "岭", "领", "另", "令", "棱", "怜"]
		case "liu":  characters = ["溜", "琉", "榴", "硫", "馏", "留", "刘", "瘤", "流", "柳", "六", "陆"]
		case "long":  characters = ["龙", "聋", "咙", "笼", "窿", "隆", "垄", "拢", "陇", "弄"]
		case "lou":  characters = ["楼", "娄", "搂", "篓", "漏", "陋", "露"]
		case "lu":  characters = ["芦", "卢", "颅", "庐", "炉", "掳", "卤", "虏", "鲁", "麓", "路", "赂", "鹿", "潞", "禄", "录", "戮", "吕", "六", "碌", "露", "陆", "绿"]
		case "lv":  characters = ["驴", "铝", "侣", "旅", "履", "屡", "缕", "虑", "氯", "律", "滤", "绿", "率"]
		case "lve":  characters = ["掠", "略"]
		case "luan":  characters = ["峦", "挛", "孪", "滦", "卵", "乱"]
		case "lun":  characters = ["抡", "轮", "伦", "仑", "沦", "论", "纶"]
		case "luo":  characters = ["萝", "螺", "罗", "逻", "锣", "箩", "骡", "裸", "洛", "骆", "烙", "络", "落", "咯"]
		default:  characters = [""]
		}
	}
}