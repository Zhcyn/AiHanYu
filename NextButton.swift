import Foundation
import UIKit
protocol NextButtonDelegate: class {
	func nextButtonTapped(_ title: NextButtonTitle)
}
enum NextButtonTitle {
	case next, confirm, done
	var title: String? {
		switch self {
		case .next: return nil
		case .confirm: return Titles.confirm
		case .done: return Titles.done
		}
	}
}
class NextButton: UIButton {
	var customTitleLabel = UILabel()
	var dismissAfterTapped = true
	var showed = false
	var titleType: NextButtonTitle = .next
	weak var delegate: NextButtonDelegate?
	init() {
		super.init(frame: CGRect(x: 0, y: ScreenHeight, width: ScreenWidth, height: 60))
		backgroundColor = UIColor.white
		tintColor = UIColor.colorWithValues(MyColors.P_darkBlue)
		addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
		isExclusiveTouch = true
		isUserInteractionEnabled = false
	}
	@objc func nextButtonTapped() {
		isUserInteractionEnabled = false
		if dismissAfterTapped { hide() }
		delegate?.nextButtonTapped(titleType)
	}
	func show(_ title: NextButtonTitle, dismissAfterTapped: Bool) {
		titleType = title
		self.dismissAfterTapped = dismissAfterTapped
		removeSubview(animated: false)
		switch title {
		case .next:
			self.addImageView(ImageName.Next, tintColor: tintColor, animated: false)
		case .confirm, .done:
			self.addTextLabel(title.title!, textColor: tintColor, font: UIFont.buttonTitleFont(22), animated: false)
		}
		DispatchQueue.main.async {
			UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 0.2, options: [], animations: { () -> Void in
				self.frame.origin.y -= 60
				}, completion: {(success) -> Void in
					self.showed = true
					self.isUserInteractionEnabled = true
			})
		}
	}
	func changeTitle(_ toTitle: NextButtonTitle, dismissAfterTapped: Bool) {
		self.dismissAfterTapped = dismissAfterTapped
		titleType = toTitle
		self.removeSubview(animated: true)
		switch toTitle {
		case .next:
			self.addImageView(ImageName.Next, tintColor: tintColor, animated: true)
		case .confirm, .done:
			self.addTextLabel(toTitle.title!, textColor: tintColor, font: UIFont.buttonTitleFont(22), animated: true)
		}
		isUserInteractionEnabled = true
	}
	func hide() {
		titleType = .next
		UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 0.2, options: [], animations: { () -> Void in
			self.frame.origin.y += 60
			}, completion: {(_) -> Void in
				self.showed = false
				self.isUserInteractionEnabled = false
		})
	}
	required init?(coder aDecoder: NSCoder) {
	    fatalError("init(coder:) has not been implemented")
	}
}
