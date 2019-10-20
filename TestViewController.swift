import UIKit
import AVFoundation
protocol TestViewControllerDelegate: class {
    func sendBackScore(totalScore: Int, newScore: Score, chinese: Chinese)
}
class TestViewController: UIViewController {
	var chinese: Chinese!
	var totalScore: Int!
    weak var delegate: TestViewControllerDelegate?
	var blockViews = [BlockView]()
	var scrollView = UIScrollView()
	var headerView: HeaderView!
	var nextButton: NextButton!
	var finalView: FinalView!
	var sound = true
	var vibration = true
	let promptSound = PromptSound()
	var currentPage = 0
	var rightScore: Int!
	var wrongScore: Int!
	var freeStyle = true
	override var prefersStatusBarHidden : Bool {
		return true
	}
	override func viewDidLoad() {
		super.viewDidLoad()
		self.view.backgroundColor = UIColor.colorWithValues(MyColors.P_darkBlue)
		finalView = FinalView()
		finalView.delegate = self
		view.addSubview(finalView)
	}
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		self.navigationController?.setNavigationBarHidden(true, animated: true)
	}
	func setUpScrollView() {
		scrollView.contentSize = CGSize(width: scrollView.frame.width * 10, height: scrollView.frame.height)
		scrollView.backgroundColor = UIColor.colorWithValues(MyColors.P_darkBlue)
		scrollView.isPagingEnabled = true
		scrollView.isScrollEnabled = false
		view.addSubview(scrollView)
		view.bringSubview(toFront: headerView)
		view.bringSubview(toFront: nextButton)
	}
	func jumpToPage(_ page: Int) {
		let duration = Double(scrollView.frame.width / 640)
		UIView.animate(withDuration: duration, delay: 0.0, usingSpringWithDamping: 0.95, initialSpringVelocity: 0.5, options: [], animations: { () -> Void in
			self.scrollView.contentOffset = CGPoint(x: self.scrollView.bounds.size.width * CGFloat(page), y: 0.0) 
			}, completion: {(_) -> Void in
				self.removeContent()
		})
	}
	func removeContent() {
	}
	func confirmToQuit() {
		let _ = navigationController?.popViewController(animated: true)
	}
}
extension TestViewController: HeaderViewDelegate {
	func backButtonTapped() {
		if currentPage != 0 && currentPage != 10 {
			let notFinished = NSLocalizedString("Not Finish Yet", comment: "TestVC")
			let warning = NSLocalizedString("If you quit, current score will be lost.", comment: "TestVC")
			alertOfStayOrQuit(self, title: notFinished, message: warning, quit: { self.confirmToQuit() })
		} else {
			let _ = navigationController?.popToRootViewController(animated: true)
		}
	}
}
extension TestViewController: FinalViewDelegate {
	func finalViewButtonTapped(_ buttonType: FinalViewButtonType) {
		if buttonType == .again {
			headerView.startAllOver()
			let duration = Double(scrollView.frame.width / 640)
			UIView.animate(withDuration: duration, delay: 0.0, usingSpringWithDamping: 0.95, initialSpringVelocity: 0.5, options: [], animations: { () -> Void in
				self.scrollView.frame.origin.x -= self.view.frame.width
				}, completion: {(_) -> Void in
					self.removeContent()
			})
		} else {
			confirmToQuit()
		}
	}
}
