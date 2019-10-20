import Foundation
struct Struct_H: Characters {
	var characters: [String]
	init(pinyin: String) {
		switch pinyin {
		case "ha":  characters = ["蛤", "哈"]
		case "hai":  characters = ["骸", "孩", "海", "氦", "亥", "害", "骇", "还", "咳"]
		case "han":  characters = ["酣", "憨", "邯", "韩", "含", "涵", "寒", "函", "喊", "罕", "翰", "撼", "捍", "旱", "憾", "悍", "焊", "汗", "汉"]
		case "hang":  characters = ["杭", "航", "夯", "吭", "巷", "行"]
		case "hao":  characters = ["壕", "嚎", "豪", "毫", "郝", "好", "耗", "号", "浩", "镐", "貉"]
		case "he":  characters = ["喝", "荷", "菏", "禾", "何", "盒", "阂", "河", "赫", "褐", "鹤", "贺", "核", "合", "涸", "吓", "呵", "貉", "和"]
		case "hei":  characters = ["黑", "嘿"]
		case "hen":  characters = ["痕", "很", "狠", "恨"]
		case "heng":  characters = ["亨", "横", "衡", "恒", "哼", "行"]
		case "hong":  characters = ["轰", "哄", "烘", "虹", "鸿", "洪", "宏", "弘", "红"]
		case "hou":  characters = ["喉", "侯", "猴", "吼", "厚", "候", "后"]
		case "hu":  characters = ["呼", "乎", "忽", "瑚", "壶", "葫", "胡", "蝴", "狐", "糊", "湖", "弧", "虎", "护", "互", "沪", "户", "唬", "和"]
		case "hua":  characters = ["花", "华", "猾", "画", "化", "话", "哗", "滑", "划"]
		case "huai":  characters = ["槐", "怀", "淮", "徊", "坏"]
		case "huan":  characters = ["欢", "环", "桓", "缓", "换", "患", "唤", "痪", "豢", "焕", "涣", "宦", "幻", "还"]
		case "huang":  characters = ["荒", "慌", "黄", "磺", "蝗", "簧", "皇", "凰", "惶", "煌", "晃", "幌", "恍", "谎"]
		case "hui":  characters = ["灰", "挥", "辉", "徽", "恢", "蛔", "回", "毁", "悔", "慧", "卉", "惠", "晦", "贿", "秽", "烩", "汇", "讳", "诲", "绘", "会"]
		case "hun":  characters = ["昏", "婚", "魂", "浑", "混", "荤"]
		case "huo":  characters = ["活", "伙", "火", "获", "或", "惑", "霍", "货", "祸", "豁", "和"]
		default:  characters = [""]
		}
	}
}
