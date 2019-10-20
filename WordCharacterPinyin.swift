import Foundation
import UIKit
import CoreData

protocol WordCharacterPinyin {
    func wordsFromPinyin(_ pinyin: String) -> [String]
    func wordPinyinFromIndex(_ index: Double) -> String
    func charactersFromPinyin(_ pinyin: String) -> [String]
    func pinyinsWithSeveralCharacters(_ numberOfCharacters: Int, index: Int) -> [String]
}

extension WordCharacterPinyin {

    
    func wordsFromPinyin(_ pinyin: String) -> [String] {
        var words = [String]()

        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext

        let fetchRequest = NSFetchRequest<Term>(entityName: "Term")
        fetchRequest.predicate = NSPredicate(format:"pinyin == %@", pinyin + " ")

        do {
            let fetchedResults = try managedContext.fetch(fetchRequest)
            words = fetchedResults.map({ $0.word! })

        } catch let error as NSError {
            print("Counld not fetch \(error), \(error.userInfo)")
        }

        return words
    }

    
    func wordPinyinFromIndex(_ index: Double) -> String {
        var pinyin = ""

        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext

        let fetchRequest = NSFetchRequest<Term>(entityName: "Term")
        fetchRequest.predicate = NSPredicate(format:"index == %f", index)

        do {
            let fetchedResults = try managedContext.fetch(fetchRequest)

            if fetchedResults[0].pinyin != nil {
                pinyin = String(fetchedResults[0].pinyin!.characters.dropLast())
            }

        } catch let error as NSError {
            print("Counld not fetch \(error), \(error.userInfo)")
        }
        
        return pinyin
    }

    
    func charactersFromPinyin(_ pinyin: String) -> [String] {
        if pinyin == "" { return [""] }
        let index = pinyin.characters.index(pinyin.startIndex, offsetBy: 0)
        let letter = String(pinyin[index])

        var result: Characters

        switch letter {
        case "a": result = Struct_A(pinyin: pinyin)
        case "b": result = Struct_B(pinyin: pinyin)
        case "c": result = Struct_C(pinyin: pinyin)
        case "d": result = Struct_D(pinyin: pinyin)
        case "e": result = Struct_E(pinyin: pinyin)
        case "f": result = Struct_F(pinyin: pinyin)
        case "g": result = Struct_G(pinyin: pinyin)
        case "h": result = Struct_H(pinyin: pinyin)
        case "j": result = Struct_J(pinyin: pinyin)
        case "k": result = Struct_K(pinyin: pinyin)
        case "l": result = Struct_L(pinyin: pinyin)
        case "m": result = Struct_M(pinyin: pinyin)
        case "n": result = Struct_N(pinyin: pinyin)
        case "o": result = Struct_O(pinyin: pinyin)
        case "p": result = Struct_P(pinyin: pinyin)
        case "q": result = Struct_Q(pinyin: pinyin)
        case "r": result = Struct_R(pinyin: pinyin)
        case "s": result = Struct_S(pinyin: pinyin)
        case "t": result = Struct_T(pinyin: pinyin)
        case "w": result = Struct_W(pinyin: pinyin)
        case "x": result = Struct_X(pinyin: pinyin)
        case "y": result = Struct_Y(pinyin: pinyin)
        case "z": result = Struct_Z(pinyin: pinyin)
        default: return [""]
        }

        return result.characters
    }

    
    func pinyinsWithSeveralCharacters(_ numberOfCharacters: Int, index: Int) -> [String] {
        switch numberOfCharacters {
        case 2:
            return ["a", "ai", "an", "ang", "ao", "ba", "bai", "ban", "bang", "bao", "bei", "ben", "beng", "bi", "bian", "biao", "bie", "bin", "bing", "bo", "bu", "cai", "can", "cang", "cao", "ce", "ceng", "cha", "chai", "chan", "chang", "chao", "che", "chen", "cheng", "chi", "chong", "chou", "chu", "chuan", "chuang", "chui", "chun", "chuo", "ci", "cong", "cu", "cuan", "cui", "cun", "cuo", "da", "dai", "dan", "dang", "dao", "de", "deng", "di", "dian", "diao", "die", "ding", "dong", "dou", "du", "duan", "dui", "dun", "duo", "e", "er", "fa", "fan", "fang", "fei", "fen", "feng", "fu", "ga", "gai", "gan", "gang", "gao", "ge", "gen", "geng", "gong", "gou", "gu", "gua", "guai", "guan", "guang", "gui", "gun", "guo", "ha", "hai", "han", "hang", "hao", "he", "hei", "hen", "heng", "hong", "hou", "hu", "hua", "huai", "huan", "huang", "hui", "hun", "huo", "ji", "jia", "jian", "jiang", "jiao", "jie", "jin", "jing", "jiong", "jiu", "ju", "juan", "jue", "jun", "ka", "kai", "kan", "kang", "kao", "ke", "ken", "keng", "kong", "kou", "ku", "kua", "kuai", "kuan", "kuang", "kui", "kun", "kuo", "la", "lai", "lan", "lang", "lao", "le", "lei", "leng", "li", "lian", "liang", "liao", "lie", "lin", "ling", "liu", "long", "lou", "lu", "lv", "lve", "luan", "lun", "luo", "ma", "mai", "man", "mang", "mao", "mei", "men", "meng", "mi", "mian", "miao", "mie", "min", "ming", "mo", "mou", "mu", "na", "nai", "nan", "nao", "ne", "nei", "ni", "nian", "niang", "niao", "nie", "ning", "niu", "nong", "nu", "nve", "nuo", "ou", "pa", "pai", "pan", "pang", "pao", "pei", "pen", "peng", "pi", "pian", "piao", "pie", "pin", "ping", "po", "pu", "qi", "qia", "qian", "qiang", "qiao", "qie", "qin", "qing", "qiong", "qiu", "qu", "quan", "que", "qun", "ran", "rang", "rao", "re", "ren", "reng", "rong", "rou", "ru", "ruan", "rui", "run", "ruo", "sa", "sai", "san", "sang", "sao", "se", "sha", "shai", "shan", "shang", "shao", "she", "shen", "sheng", "shi", "shou", "shu", "shua", "shuai", "shuan", "shuang", "shui", "shun", "shuo", "si", "song", "sou", "su", "suan", "sui", "sun", "suo", "ta", "tai", "tan", "tang", "tao", "teng", "ti", "tian", "tiao", "tie", "ting", "tong", "tou", "tu", "tuan", "tui", "tun", "tuo", "wa", "wai", "wan", "wang", "wei", "wen", "weng", "wo", "wu", "xi", "xia", "xian", "xiang", "xiao", "xie", "xin", "xing", "xiong", "xiu", "xu", "xuan", "xue", "xun", "ya", "yan", "yang", "yao", "ye", "yi", "yin", "ying", "yong", "you", "yu", "yuan", "yue", "yun", "za", "zai", "zan", "zang", "zao", "ze", "zeng", "zha", "zhai", "zhan", "zhang", "zhao", "zhe", "zhen", "zheng", "zhi", "zhong", "zhou", "zhu", "zhua", "zhuan", "zhuang", "zhui", "zhun", "zhuo", "zi", "zong", "zou", "zu", "zuan", "zui", "zun", "zuo"]
        case 3:
            switch index {
            case 0:
                return ["a", "ai", "an", "ang", "ao"]
            case 1:
                return ["ba", "bai", "ban", "bang", "bao", "bei", "ben", "beng", "bi", "bian", "biao", "bie", "bin", "bing", "bo", "bu"]
            case 2:
                return ["cai", "can", "cang", "cao", "ce", "ceng", "cha", "chai", "chan", "chang", "chao", "che", "chen", "cheng", "chi", "chong", "chou", "chu", "chuan", "chuang", "chui", "chun", "ci", "cong", "cu", "cuan", "cui", "cun", "cuo"]
            case 3:
                return ["da", "dai", "dan", "dang", "dao", "de", "deng", "di", "dian", "diao", "die", "ding", "dong", "dou", "du", "duan", "dui", "dun", "duo"]
            case 4:
                return ["cai", "can", "cang", "cao", "ce", "ceng", "cha", "chai", "chan", "chang", "chao", "che", "chen", "cheng", "chi", "chong", "chou", "chu", "chuan", "chuang", "chui", "chun", "ci", "cong", "cu", "cuan", "cui", "cun", "cuo"]
            case 5:
                return ["fa", "fan", "fang", "fei", "fen", "feng", "fu"]
            case 6:
                return ["ga", "gai", "gan", "gang", "gao", "ge", "geng", "gong", "gou", "gu", "gua", "guai", "guan", "guang", "gui", "gun", "guo"]
            case 7:
                return ["hai", "han", "hang", "hao", "he", "hen", "heng", "hong", "hou", "hu", "hua", "huai", "huan", "huang", "hui", "hun", "huo"]
            case 8:
                return ["ji", "jia", "jian", "jiang", "jiao", "jie", "jin", "jing", "jiu", "ju", "juan", "jue", "jun"]
            case 9:
                return ["ka", "kai", "kan", "kang", "kao", "ke", "ken", "kong", "kou", "ku", "kua", "kuai", "kuang", "kui", "kun", "kuo"]
            case 10:
                return ["la", "lai", "lan", "lang", "lao", "le", "lei", "leng", "li", "lian", "liang", "liao", "lie", "lin", "ling", "liu", "long", "lou", "lu", "lv", "luan", "lun", "luo"]
            case 11:
                return ["ma", "mai", "man", "mang", "mao", "mei", "men", "meng", "mi", "mian", "miao", "min", "ming", "mo", "mou", "mu"]
            case 12:
                return ["na", "nai", "nan", "nao", "nei", "ni", "nian", "nie", "ning", "niu", "nong", "nu", "nuo"]
            case 13:
                return ["la", "lai", "lan", "lang", "lao", "le", "lei", "leng", "li", "lian", "liang", "liao", "lie", "lin", "ling", "liu", "long", "lou", "lu", "lv", "luan", "lun", "luo"]
            case 14:
                return ["pa", "pai", "pan", "pang", "pao", "pei", "peng", "pi", "pian", "piao", "pin", "ping", "po", "pu"]
            case 15:
                return ["qi", "qia", "qian", "qiang", "qiao", "qie", "qin", "qing", "qiu", "qu", "quan", "que"]
            case 16:
                return ["ran", "rang", "rao", "ren", "rong", "rou", "ru", "rui"]
            case 17:
                return ["sa", "sai", "san", "sang", "sao", "se", "sha", "shai", "shan", "shang", "shao", "she", "shen", "sheng", "shi", "shou", "shu", "shuai", "shuang", "shui", "shun", "shuo", "si", "song", "sou", "su", "suan", "sui", "sun", "suo"]
            case 18:
                return ["ta", "tai", "tan", "tang", "tao", "teng", "ti", "tian", "tiao", "tie", "ting", "tong", "tou", "tu", "tui", "tun", "tuo"]
            case 19:
                return ["wa", "wan", "wang", "wei", "wen", "weng", "wo", "wu"]
            case 20:
                return ["xi", "xia", "xian", "xiang", "xiao", "xie", "xin", "xing", "xiong", "xiu", "xu", "xuan", "xue", "xun"]
            case 21:
                return ["ya", "yan", "yang", "yao", "ye", "yi", "yin", "ying", "yong", "you", "yu", "yuan", "yue", "yun"]
            case 22:
                return ["za", "zai", "zan", "zang", "zao", "ze", "zeng", "zha", "zhai", "zhan", "zhang", "zhao", "zhe", "zhen", "zheng", "zhi", "zhong", "zhou", "zhu", "zhuan", "zhuang", "zhui", "zhuo", "zi", "zong", "zou", "zu", "zui", "zuo"]
            default:
                return ["za", "zai", "zan", "zang", "zao", "ze", "zeng", "zha", "zhai", "zhan", "zhang", "zhao", "zhe", "zhen", "zheng", "zhi", "zhong", "zhou", "zhu", "zhuan", "zhuang", "zhui", "zhuo", "zi", "zong", "zou", "zu", "zui", "zuo"]
            }
        default:
            return ["za", "zai", "zan", "zang", "zao", "ze", "zeng", "zha", "zhai", "zhan", "zhang", "zhao", "zhe", "zhen", "zheng", "zhi", "zhong", "zhou", "zhu", "zhuan", "zhuang", "zhui", "zhuo", "zi", "zong", "zou", "zu", "zui", "zuo"]
        }
    }
    
}
