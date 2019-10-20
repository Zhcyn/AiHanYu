import Foundation
struct Struct_P: Characters {
	var characters: [String]
	init(pinyin: String) {
		switch pinyin {
		case "pa":  characters = ["啪", "趴", "爬", "帕", "怕", "扒", "耙", "琶"]
		case "pai":  characters = ["拍", "排", "牌", "徘", "湃", "派", "迫"]
		case "pan":  characters = ["攀", "潘", "盘", "磐", "盼", "畔", "判", "叛", "番", "胖", "般"]
		case "pang":  characters = ["乓", "庞", "耪", "膀", "磅", "旁", "胖"]
		case "pao":  characters = ["抛", "咆", "袍", "跑", "泡", "刨", "炮"]
		case "pei":  characters = ["呸", "胚", "培", "裴", "赔", "陪", "配", "佩", "沛", "坏"]
		case "pen":  characters = ["喷", "盆"]
		case "peng":  characters = ["砰", "抨", "烹", "澎", "彭", "蓬", "棚", "硼", "篷", "膨", "朋", "鹏", "捧", "碰"]
		case "pi":  characters = ["坯", "砒", "霹", "批", "披", "劈", "琵", "毗", "啤", "脾", "疲", "皮", "痞", "僻", "屁", "譬", "辟", "否", "匹", "坏"]
		case "pian":  characters = ["篇", "偏", "片", "骗", "扁", "便"]
		case "piao":  characters = ["飘", "漂", "瓢", "票", "朴"]
		case "pie":  characters = ["撇", "瞥"]
		case "pin":  characters = ["拼", "频", "贫", "品", "聘"]
		case "ping":  characters = ["乒", "坪", "萍", "平", "凭", "瓶", "评", "苹", "屏"]
		case "po":  characters = ["坡", "泼", "颇", "婆", "破", "粕", "泊", "迫", "魄", "朴"]
		case "pou":  characters = ["剖"]
		case "pu":  characters = ["扑", "铺", "仆", "莆", "葡", "菩", "蒲", "圃", "普", "浦", "谱", "脯", "埔", "曝", "瀑", "堡", "朴"]
		default:  characters = [""]
		}
	}
}