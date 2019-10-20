import Foundation
import UIKit
extension UIButton {
	func addTextLabel(_ text: String, textColor: UIColor, font: UIFont, animated: Bool) {
		let label = UILabel(frame: self.bounds)
		label.text = text
		label.textColor = textColor
		label.font = font
		label.textAlignment = .center
		addSubview(label)
		if animated { label.viewAddAnimation(.becomeVisble, delay: 0.0, distance: 0.0) }
	}
	func addImageView(_ imageName: String, tintColor: UIColor?, animated: Bool) {
		let imageView = UIImageView()
		imageView.frame.size = CGSize(width: 22, height: 22)
		imageView.image = UIImage(named: imageName)
		if tintColor != nil { imageView.tintColor = tintColor }
		let center = CGPoint(x: bounds.midX, y: bounds.midY)
		imageView.center = center
		addSubview(imageView)
		if animated { imageView.viewAddAnimation(.becomeVisble, delay: 0.0, distance: 0.0) }
	}
	func removeSubview(animated: Bool) {
		subviews.forEach({ view in
			if animated {
				UIView.animate(withDuration: 0.5, animations: { () -> Void in
					view.alpha = 0.0
					}, completion: { (_) -> Void in
						view.removeFromSuperview()
				})
			} else {
				view.removeFromSuperview()
			}
		})
	}
	func changeColorWhenTouchDown(_ borderColor: UIColor) {
		let selector = borderColor == UIColor.white ? "changeColorBack" : "changeColorBack_D"
		addTarget(self, action: #selector(changeColor), for: .touchDown)
		addTarget(self, action: Selector(selector), for: .touchUpOutside)
		addTarget(self, action: Selector(selector), for: .touchUpInside)
	}
	func addAnimation(_ animationType: AnimationType, delay: Double, distance: CGFloat) {
		switch animationType {
		case .becomeVisble:
			self.alpha = 0.0
			UIView.animate(withDuration: 0.5, animations: { () -> Void in
				self.alpha = 1.0
			})
		case .appear:
			self.alpha = 0.0
			self.frame.origin.y += distance
			UIView.animate(withDuration: 0.5, delay: delay, usingSpringWithDamping: 0.9, initialSpringVelocity: 10.0, options: [], animations: { () -> Void in
				self.alpha = 1.0
				self.frame.origin.y -= distance
				}, completion: nil)
		case .disappear:
			UIView.animate(withDuration: 0.4, animations: { () -> Void in
				self.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
				self.alpha = 0.0
				}, completion: { (_) -> Void in
					self.isHidden = true
					self.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
					self.alpha = 1.0
			})
		case .touched:
			UIView.animate(withDuration: 0.4, animations: { () -> Void in
				self.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
				self.alpha = 0.0
				}, completion: { (what) -> Void in
					self.isHidden = true
					self.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
					self.alpha = 1.0
			})
		case .isRightAnswer:
			UIView.animate(withDuration: 0.4, delay: delay, usingSpringWithDamping: 1.0, initialSpringVelocity: 10.0, options: [], animations: { () -> Void in
				self.transform = CGAffineTransform(scaleX: 1.06, y: 1.06)
				}, completion: nil)
		case .bigger:
			self.alpha = 0.0
			self.transform = CGAffineTransform(scaleX: 0.0, y: 0.0)
			UIView.animate(withDuration: 0.5, delay: delay, usingSpringWithDamping: 1.0, initialSpringVelocity: 5.0, options: [], animations: { () -> Void in
				self.alpha = 1.0
				self.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
				}, completion: nil)
		default:
			break
		}
	}
	func changeToColor(_ color: UIColor) {
		self.backgroundColor = color
		self.layer.borderColor = UIColor.white.cgColor
	}
	@objc func changeColor() {
		self.backgroundColor = UIColor.colorWithValues(MyColors.P_gold)
		self.layer.borderColor = UIColor.colorWithValues(MyColors.P_gold).cgColor
	}
	func changeColorBack() {
		self.backgroundColor = UIColor.clear
		self.layer.borderColor = UIColor.white.cgColor
	}
	func changeColorBack_D() {
		self.backgroundColor = UIColor.clear
		self.layer.borderColor = UIColor.colorWithValues(MyColors.P_darkBlue).cgColor
	}
}
