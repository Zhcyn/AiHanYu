import Foundation
struct Struct_G: Characters {
	var characters: [String]
	init(pinyin: String) {
		switch pinyin {
		case "ga":  characters = ["噶", "嘎", "夹", "咖"]
		case "gai":  characters = ["该", "改", "概", "钙", "溉", "盖", "芥"]
		case "gan":  characters = ["干", "甘", "杆", "柑", "竿", "肝", "赶", "感", "秆", "敢", "赣", "乾"]
		case "gang":  characters = ["冈", "刚", "钢", "缸", "肛", "纲", "岗", "港", "杠", "扛"]
		case "gao":  characters = ["篙", "皋", "高", "膏", "羔", "糕", "搞", "稿", "镐", "告"]
		case "ge":  characters = ["哥", "歌", "搁", "戈", "鸽", "疙", "割", "葛", "格", "阁", "隔", "铬", "个", "各", "胳", "革", "蛤", "咯"]
		case "gei":  characters = ["给"]
		case "gen":  characters = ["根", "跟"]
		case "geng":  characters = ["耕", "更", "庚", "羹", "埂", "耿", "梗", "粳", "颈"]
		case "gong":  characters = ["工", "攻", "功", "恭", "龚", "供", "躬", "公", "宫", "弓", "巩", "拱", "贡", "共", "汞"]
		case "gou":  characters = ["钩", "勾", "沟", "苟", "狗", "垢", "构", "购", "够"]
		case "gu":  characters = ["辜", "菇", "咕", "箍", "估", "沽", "孤", "姑", "古", "蛊", "骨", "股", "故", "顾", "固", "雇", "鼓", "谷", "贾"]
		case "gua":  characters = ["刮", "瓜", "剐", "寡", "挂", "褂"]
		case "guai":  characters = ["乖", "拐", "怪"]
		case "guan":  characters = ["棺", "关", "官", "冠", "观", "管", "馆", "罐", "惯", "灌", "贯", "纶"]
		case "guang":  characters = ["光", "逛", "广"]
		case "gui":  characters = ["瑰", "规", "圭", "归", "闺", "轨", "鬼", "诡", "癸", "桂", "柜", "跪", "贵", "刽", "硅", "傀", "炔", "龟"]
		case "gun":  characters = ["辊", "滚", "棍"]
		case "guo":  characters = ["锅", "郭", "国", "果", "裹", "过", "涡"]
		default:  characters = [""]
		}
	}
}