import Foundation
struct Struct_F: Characters {
	var characters: [String]
	init(pinyin: String) {
		switch pinyin {
		case "fa":  characters = ["发", "罚", "筏", "伐", "乏", "阀", "法", "珐"]
		case "fan":  characters = ["藩", "帆", "翻", "樊", "矾", "钒", "凡", "烦", "反", "返", "范", "贩", "犯", "饭", "泛", "番", "繁"]
		case "fang":  characters = ["坊", "芳", "方", "肪", "房", "防", "妨", "仿", "访", "纺", "放"]
		case "fei":  characters = ["菲", "非", "啡", "飞", "肥", "匪", "诽", "吠", "肺", "废", "沸", "费"]
		case "fen":  characters = ["芬", "酚", "吩", "氛", "分", "纷", "坟", "焚", "汾", "粉", "奋", "份", "忿", "愤", "粪"]
		case "feng":  characters = ["丰", "封", "枫", "蜂", "峰", "锋", "风", "疯", "烽", "逢", "缝", "讽", "奉", "凤", "冯"]
		case "fo":  characters = ["佛"]
		case "fou":  characters = ["否"]
		case "fu":  characters = ["夫", "敷", "肤", "孵", "扶", "辐", "幅", "氟", "符", "伏", "俘", "服", "浮", "涪", "福", "袱", "弗", "甫", "抚", "辅", "俯", "釜", "斧", "腑", "府", "腐", "赴", "副", "覆", "赋", "复", "傅", "付", "阜", "父", "腹", "负", "富", "讣", "附", "妇", "缚", "咐", "佛", "拂", "脯"]
		default:  characters = [""]
		}
	}
}