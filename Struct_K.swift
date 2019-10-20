import Foundation
struct Struct_K: Characters {
	var characters: [String]
	init(pinyin: String) {
		switch pinyin {
		case "ka":  characters = ["喀", "咖", "卡", "咯"]
		case "kai":  characters = ["开", "揩", "凯", "慨", "楷"]
		case "kan":  characters = ["刊", "堪", "勘", "坎", "砍", "看", "槛", "嵌"]
		case "kang":  characters = ["康", "慷", "糠", "抗", "亢", "炕", "扛"]
		case "kao":  characters = ["考", "拷", "烤", "靠"]
		case "ke":  characters = ["坷", "苛", "柯", "棵", "磕", "颗", "科", "可", "渴", "克", "刻", "客", "课", "壳", "呵", "咳"]
		case "ken":  characters = ["肯", "啃", "垦", "恳"]
		case "keng":  characters = ["坑", "吭"]
		case "kong":  characters = ["空", "恐", "孔", "控"]
		case "kou":  characters = ["抠", "口", "扣", "寇"]
		case "ku":  characters = ["枯", "哭", "窟", "苦", "酷", "库", "裤"]
		case "kua":  characters = ["夸", "垮", "挎", "跨", "胯"]
		case "kuai":  characters = ["块", "筷", "侩", "快", "会"]
		case "kuan":  characters = ["宽", "款"]
		case "kuang":  characters = ["匡", "筐", "狂", "框", "矿", "眶", "旷", "况"]
		case "kui":  characters = ["亏", "盔", "岿", "窥", "葵", "奎", "魁", "馈", "愧", "傀", "溃"]
		case "kun":  characters = ["坤", "昆", "捆", "困"]
		case "kuo":  characters = ["扩", "廓", "阔", "括"]
		default:  characters = [""]
		}
	}
}
