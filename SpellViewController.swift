import UIKit
import AVFoundation
class SpellViewController: TestViewController {
	var picker: UIPickerView!
	var pickerinitialRows = [Int]()
	var component_allTitles = [[String]]()
	var selectedPinyin = String()
	var selectedIndex = 0
	var showed = false
	var amount: Int!
	var selectedCharacters = [String]()
	var freeLabel: FreeLabel!
	fileprivate let component_titles_0 = ["", "b", "c", "ch", "d", "f", "g", "h", "j", "k", "l", "m", "n", "p", "q", "r", "s", "sh", "t", "w", "x", "y", "z", "zh", ""]
	fileprivate let component_titles_1 = ["", "a", "e", "i", "o", "u", "v", ""]
	fileprivate let component_titles_2_0 = ["", "a", "ai", "an", "ang", "ao", "e", "ei", "en", "eng", "i", "n", "ng", "o", "ong", "ou", "r", "u", ""]
	fileprivate let component_titles_2 = ["", "a", "e", "i", "n", "o", "r", "u", ""]
	fileprivate let component_titles_3 = ["", "g", "i", "n", "ng", "o", "u", ""]
	override func viewDidLoad() {
		super.viewDidLoad()
		headerView = HeaderView(index: freeStyle ? 21 : 20, totalScore: totalScore)
		headerView.delegate = self
		view.addSubview(headerView)
		if freeStyle {
			freeLabel = FreeLabel()
			view.addSubview(freeLabel)
			freeLabel.showCharacters(chinese.charactersFromPinyin("pin"))
		} else {
			rightScore = 2
			wrongScore = -2
			nextButton = NextButton()
			nextButton.delegate = self
			view.addSubview(nextButton)
			prepareScrollView(firstTime: true)
		}
		let userDefaults = UserDefaults.standard
		if let defaultsAmount = userDefaults.value(forKey: Defaults.C_amount) as? Int {
			amount = defaultsAmount
		} else {
			amount = 3
			userDefaults.set(amount, forKey: Defaults.C_amount)
		}
		pickerinitialRows = amount == 3 ? [13, 3, 11] : [13, 3, 8, 3]
		component_allTitles = amount == 3 ? [component_titles_0, component_titles_1, component_titles_2_0] : [component_titles_0, component_titles_1, component_titles_2, component_titles_3]
		selectedCharacters = amount == 3 ? ["p", "i", "n"] : ["p", "i", "", "n"]
	}
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		picker = UIPickerView(frame: CGRect(x: 30, y: ScreenHeight / 2 - 10, width: ScreenWidth - 60, height: ScreenHeight / 2 - 60))
		picker.dataSource = self
		picker.delegate = self
		picker.alpha = 0.0
		view.addSubview(picker)
		var i = 0
		repeat {
			picker.selectRow(pickerinitialRows[i], inComponent: i, animated: false)
			i += 1
		} while i < pickerinitialRows.count
		picker.viewAddAnimation(.becomeVisble, delay: 0.1, distance: 0.0)
	}
	func prepareScrollView(firstTime: Bool) {
		let x = firstTime ? 0 : view.frame.width
		scrollView = UIScrollView(frame: CGRect(x: x, y: 0, width: ScreenWidth, height: ScreenHeight / 2))
		setUpScrollView()
		currentPage = 0
		addContent(currentPage, firstTime: firstTime)
	}
	func addContent(_ page: Int, firstTime: Bool) {
		if !firstTime { chinese.getOneForSpell() }
		selectedIndex = 0
		showed = false
		let positionInPage = scrollView.frame.width * CGFloat(page)
		let point = CGPoint(x: positionInPage + (ScreenWidth - BlockWidth.spell) / 2, y: 60)
		let blockView = BlockView(type: .spell, origin: point, text: chinese.forSpell)
		blockView.changeColorAtIndex(selectedIndex, color: UIColor.white, backToBlue: false)
		blockView.delegate = self
		blockViews.append(blockView)
		scrollView.addSubview(blockViews[blockViews.count - 1])
	}
	override func removeContent() {
		blockViews[0].removeFromSuperview()
	}
	func changeStateBaseOnSelectedPinyin(_ selectedPinyin: String) {
		let blockView = blockViews.last!
		let pinyins = blockView.text[0].components(separatedBy: " ")
		if pinyins[selectedIndex] == selectedPinyin && !showed {
			showed = true
			if sound { promptSound.play(true, sound: promptSound.right_sound) }
			blockView.changeColorAtIndex(selectedIndex, color: UIColor.colorWithValues(MyColors.P_rightGreen), backToBlue: true)
			delay(seconds: 0.5, completion: { () -> () in
				blockView.showPinyinAtIndex(self.selectedIndex)
			})
			if selectedIndex < blockView.colorfulViews.count - 1 {
				delay(seconds: 0.8, completion: { () -> () in
					self.showed = false
					self.selectedIndex += 1
					blockView.changeColorAtIndex(self.selectedIndex, color: UIColor.white, backToBlue: false)
				})
			} else {
				blockView.setSelectable(false)
				headerView.showAndAddScore(rightScore)
				delay(seconds: 0.8, completion: { () -> () in
					let title: NextButtonTitle = self.currentPage == 9 ? .done : .next
					self.nextButton.show(title, dismissAfterTapped: true)
				})
				delay(seconds: 0.85, completion: { () -> () in
					self.currentPage += 1
					self.addContent(self.currentPage, firstTime: false)
				})
			}
		}
	}
}
extension SpellViewController: BlockViewDelegate {
	func blockViewSelected(_ selected: Bool, blockText: [String]) {
	}
	func answerShowedByQuestionMark() {
		headerView.showAndAddScore(wrongScore)
		if sound { promptSound.play(true, sound: promptSound.wrong_sound) }
		if vibration { AudioServicesPlaySystemSound(UInt32(kSystemSoundID_Vibrate)) }
		delay(seconds: 0.8, completion: { () -> () in
			let title: NextButtonTitle = self.currentPage == 9 ? .done : .next
			self.nextButton.show(title, dismissAfterTapped: true)
		})
		delay(seconds: 0.85, completion: { () -> () in
			self.currentPage += 1
			self.addContent(self.currentPage, firstTime: false)
		})
	}
}
extension SpellViewController: NextButtonDelegate {
	func nextButtonTapped(_ title: NextButtonTitle) {
		if self.currentPage < 10 {
			delay(seconds: Time.toNextPageWaitingTime, completion: {
				self.headerView.changeNumber(toNumber: self.currentPage + 1)
				self.jumpToPage(self.currentPage)
			})
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
extension SpellViewController: UIPickerViewDataSource, UIPickerViewDelegate {
	func numberOfComponents(in pickerView: UIPickerView) -> Int {
		return amount
	}
	func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
		let rows = amount == 3 ? [25, 8, 19] : [25, 8, 9, 8]
		return rows[component]
	}
	func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
		return 40
	}
	func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
		let view = UIView(frame: CGRect(x: 0, y: 0, width: picker.frame.width / CGFloat(picker.numberOfComponents), height: 40))
		view.backgroundColor = UIColor.colorWithValues(MyColors.P_gold)
		let label = UILabel(frame: view.bounds)
		label.text = component_allTitles[component][row]
		label.textAlignment = .center
		label.textColor = UIColor.colorWithValues(MyColors.P_darkBlue)
		label.font = UIFont.pickerFont(25)
		view.addSubview(label)
		return view
	}
	func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
		selectedCharacters[component] = component_allTitles[component][row]
		let result = selectedCharacters.reduce("", { $0 + $1 })
		if freeStyle {
			freeLabel.showCharacters(chinese.charactersFromPinyin(result))
			headerView.changeCenterLabelTitle(result, backToNil: false)
		} else {
			changeStateBaseOnSelectedPinyin(result)
		}
	}
}
