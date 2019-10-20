import Foundation
import UIKit
import AVFoundation
fileprivate func < <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l < r
  case (nil, _?):
    return true
  default:
    return false
  }
}
class SelectTheSameViewController: TestViewController {
	var rightAnswer = String()
	var answerShowed = false
	var selectedBlocks = [[String]]()
	var selectedCharacterIndexes = [Int]()
	var lianLianKan: LianLianKan!
	override func viewDidLoad() {
		super.viewDidLoad()
		rightScore = 3
		wrongScore = -3
		headerView = HeaderView(index: ScreenHeight == 480 ? 10 : 11, totalScore: totalScore)
		headerView.delegate = self
		view.addSubview(headerView)
		if ScreenHeight == 480 {
			nextButton = NextButton()
			nextButton.delegate = self
			view.addSubview(nextButton)
			prepareScrollView(firstTime: true)
		} else {
			lianLianKan = LianLianKan(content: chinese.selectTheSame60Characters, VC: self)
			lianLianKan.buttons.forEach({ view.addSubview($0) })
		}
	}
	func prepareScrollView(firstTime: Bool) {
		scrollView = UIScrollView(frame: view.bounds)
		scrollView.frame.origin.x += firstTime ? 0 : view.frame.width
		setUpScrollView()
		currentPage = 0
		addContent(page: currentPage, firstTime: firstTime)
	}
	func addContent(page: Int, firstTime: Bool) {
		if !firstTime { chinese.getSixForSelectTheSame() }
		rightAnswer = chinese.forSelectTheSame[0][0]
		let positionInPage = scrollView.frame.width * CGFloat(page)
		let indexes = getRandomNumbers(6, lessThan: 6)
		blockViews += indexes.map({
			let i = indexes.index(of: $0)!
			let margin = (ScreenWidth - BlockWidth.selectTheSame * 2) / 3
			let x = positionInPage + margin + (BlockWidth.selectTheSame + margin) * CGFloat(i % 2)
			let y = blockY(i)
			let blockView = BlockView(type: .selectTheSame, origin: CGPoint(x: x, y: y), text: chinese.forSelectTheSame[indexes[i]])
			blockView.delegate = self
			scrollView.addSubview(blockView)
			return blockView
		})
	}
	func blockY(_ number: Int) -> CGFloat {
		let initalY: CGFloat = ScreenHeight == 480 ? 50 : 90
		let margin: CGFloat = ScreenHeight == 480 ? 10 : 30
		switch number {
		case 0, 1:
			return initalY
		case 2, 3:
			return initalY + BlockWidth.selectTheSame + margin
		case 4, 5:
			return initalY + (BlockWidth.selectTheSame + margin) * 2
		default:
			return initalY
		}
	}
	override func removeContent() {
		if ScreenHeight == 480 {
			blockViews.forEach({ if blockViews.index(of: $0) < 6 { $0.removeFromSuperview() } })
		} else {
			lianLianKan = LianLianKan(content: chinese.selectTheSame60Characters, VC: self)
			lianLianKan.buttons.forEach({ (button) in
				button.alpha = 0.0
				view.addSubview(button)
				let delayTime = 0.01 * Double(lianLianKan.buttons.index(of: button)!)
				UIView.animateKeyframes(withDuration: 0.2, delay: delayTime, options: [], animations: { 
					button.alpha = 1.0
					}, completion: nil)
			})
			delay(seconds: 0.3, completion: { self.headerView.centerLabel.removeFromSuperview() })
			delay(seconds: 1.0, completion: {
				self.headerView.centerLabel.text = ""
				self.headerView.centerLabel.alpha = 1.0
				self.headerView.addSubview(self.headerView.centerLabel)
			})
		}
	}
	func showRightOrWrong() {
		let allTheSame = selectedBlocks.filter({ $0[0] == rightAnswer })
		let right = allTheSame.count == 3 && selectedBlocks.count == 3
		let color: UIColor = right ? UIColor.colorWithValues(MyColors.P_rightGreen) : UIColor.colorWithValues(MyColors.P_wrongRed)
		let score = right ? rightScore : wrongScore
		headerView.showAndAddScore(score!)
		if sound { right ? promptSound.play(true, sound: promptSound.right_sound) : promptSound.play(true, sound: promptSound.wrong_sound) }
		if vibration && !right { AudioServicesPlaySystemSound(UInt32(kSystemSoundID_Vibrate)) }
		blockViews.forEach({
			$0.setSelectable(false)
			$0.allChangeColor(color)
			if $0.text[0] == self.rightAnswer { $0.showGreenBorder() }
		})
		selectedBlocks.removeAll()
	}
}
extension SelectTheSameViewController: LittleTouchDownAndUp {
	func touchDown(_ sender: UIButton) {
		sender.backgroundColor = UIColor.white
		sender.tintColor = UIColor.colorWithValues(MyColors.P_darkBlue)
	}
	func touchUpOutside(_ sender: UIButton) {
		sender.backgroundColor = UIColor.colorWithValues(MyColors.P_blue)
		sender.tintColor = UIColor.white
	}
	func touchUpInside(_ sender: UIButton) {
		selectedCharacterIndexes.append(sender.tag - 200)
		if selectedCharacterIndexes.count == 2 {
			if chinese.selectTheSame60Pinyins[selectedCharacterIndexes[0]] == chinese.selectTheSame60Pinyins[selectedCharacterIndexes[1]] && selectedCharacterIndexes[0] != selectedCharacterIndexes[1] {
				headerView.changeCenterLabelTitle(chinese.selectTheSame60Pinyins[selectedCharacterIndexes[1]], backToNil: true)
				lianLianKan.buttons[selectedCharacterIndexes[0]].removeFromSuperview()
				lianLianKan.buttons[selectedCharacterIndexes[1]].removeFromSuperview()
				headerView.showAndAddScore(rightScore)
				if sound { promptSound.play(true, sound: promptSound.right_sound) }
				self.checkTestCompleteOrNot()
			} else {
				lianLianKan.buttons[selectedCharacterIndexes[0]].backgroundColor = UIColor.colorWithValues(MyColors.P_blue)
				lianLianKan.buttons[selectedCharacterIndexes[0]].tintColor = UIColor.white
				lianLianKan.buttons[selectedCharacterIndexes[1]].backgroundColor = UIColor.colorWithValues(MyColors.P_blue)
				lianLianKan.buttons[selectedCharacterIndexes[1]].tintColor = UIColor.white
				headerView.showAndAddScore(wrongScore)
				if sound { promptSound.play(true, sound: promptSound.wrong_sound) }
				if vibration { AudioServicesPlaySystemSound(UInt32(kSystemSoundID_Vibrate)) }
			}
			selectedCharacterIndexes.removeAll()
		}
	}
	func checkTestCompleteOrNot() {
		if view.subviews.count == 2 {
			delay(seconds: 0.8, completion: { 
				self.chinese.get60CharactersForSelectTheSame()
				self.view.bringSubview(toFront: self.finalView)
				self.finalView.show(self.headerView.currentScore, delay: 0.5)
				let score = Score(score: self.headerView.currentScore, time: Date())
				self.delegate?.sendBackScore(totalScore: self.headerView.totalScore, newScore: score, chinese: self.chinese)
			})
		}
	}
}
extension SelectTheSameViewController: BlockViewDelegate {
	func blockViewSelected(_ selected: Bool, blockText: [String]) {
		selectedBlocks = selected ? selectedBlocks + [blockText] : selectedBlocks.filter({ $0[1] != blockText[1] })
		if selectedBlocks.count > 2 && nextButton.titleType != .confirm {
			nextButton.show(.confirm, dismissAfterTapped: false)
		}
		if selectedBlocks.count < 3 && nextButton.titleType == .confirm {
			nextButton.hide()
		}
	}
	func answerShowedByQuestionMark() {
	}
}
extension SelectTheSameViewController: NextButtonDelegate {
	func nextButtonTapped(_ title: NextButtonTitle) {
		if currentPage < 10 {
			if title == .confirm {
				showRightOrWrong()
				delay(seconds: 0.8, completion: {
					let nextTitle: NextButtonTitle = self.currentPage == 9 ? .done : .next
					self.nextButton.changeTitle(nextTitle, dismissAfterTapped: true)
				})
				delay(seconds: 0.85, completion: {
					self.currentPage += 1
					self.addContent(page: self.currentPage, firstTime: false)
				})
			}
			if title == .next {
				delay(seconds: Time.toNextPageWaitingTime, completion: {
					self.headerView.changeNumber(toNumber: self.currentPage + 1)
					self.jumpToPage(self.currentPage)
				})
			}
		} else {
			UIView.animate(withDuration: 0.3, animations: { () -> Void in
				self.scrollView.alpha = 0.0
				}, completion: { (_) -> Void in
					self.headerView.showAllNumbers()
					self.scrollView.removeFromSuperview()
					self.view.bringSubview(toFront: self.finalView)
					self.finalView.show(self.headerView.currentScore, delay: 0.5)
					self.prepareScrollView(firstTime: false)
					let score = Score(score: self.headerView.currentScore, time: Date())
					self.delegate?.sendBackScore(totalScore: self.headerView.totalScore, newScore: score, chinese: self.chinese)
			})
		}
	}
}
