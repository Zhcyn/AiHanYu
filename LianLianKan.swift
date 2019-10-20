import UIKit
@objc protocol LittleTouchDownAndUp {
	func touchDown(_ sender: UIButton)
	func touchUpOutside(_ sender: UIButton)
	func touchUpInside(_ sender: UIButton)
}
struct LianLianKan {
	var buttons = [UIButton]()
	init(content: [String], VC: SelectTheSameViewController) {
		buttons = buttonFrames().map({
			let index = buttonFrames().index(of: $0)!
			let button = UIButton(type: .system)
			button.frame = $0
			button.backgroundColor = UIColor.colorWithValues(MyColors.P_blue)
			button.tintColor = UIColor.white
			button.setTitle(content[index], for: UIControlState())
			button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
			button.addTarget(VC, action: #selector(LittleTouchDownAndUp.touchDown(_:)), for: .touchDown)
			button.addTarget(VC, action: #selector(LittleTouchDownAndUp.touchUpOutside(_:)), for: .touchUpOutside)
			button.addTarget(VC, action: #selector(LittleTouchDownAndUp.touchUpInside(_:)), for: .touchUpInside)
			button.tag = index + 200
			return button
		})
	}
	func buttonFrames() -> [CGRect] {
		var frames = [CGRect]()
		let gap: CGFloat = 1
		let length = (ScreenWidth - 40 - (gap * 5)) / 6
		var i: CGFloat = 0
		repeat {
			let x = 20 + (length + gap) * (i.truncatingRemainder(dividingBy: 6))
			let y = 60 + (length + gap) * floor(i / 6)
			let frame = CGRect(x: x, y: y, width: length, height: length)
			frames.append(frame)
			i += 1
		} while i < 60
		return frames
	}
}
