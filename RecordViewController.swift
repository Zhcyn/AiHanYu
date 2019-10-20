import UIKit
class RecordViewController: UIViewController {
	var totalScore: Int!
	var dailyScores = [DailyScore]()
	var maxDailyNumber: UInt!
	var tableView: UITableView!
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = UIColor.colorWithValues(MyColors.P_darkBlue)
        title = NSLocalizedString("Total score:", comment: "RecordVC") + " \(totalScore!)"
		let quitButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissVC))
		navigationItem.rightBarButtonItem = quitButton
		tableView = UITableView(frame: view.bounds, style: .plain)
		tableView.frame.size.height -= 64
		tableView.backgroundColor = UIColor.colorWithValues(MyColors.P_lightGray)
		tableView.separatorStyle = .none
		tableView.allowsSelection = false
		tableView.dataSource = self
		tableView.delegate = self
		view.addSubview(tableView)
		let footer = UIView(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: 5))
		footer.backgroundColor = UIColor.clear
		tableView.tableFooterView = footer
	}
	@objc func dismissVC() {
		self.dismiss(animated: true, completion: nil)
	}
}
extension RecordViewController: UITableViewDataSource, UITableViewDelegate {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return dailyScores.count == 0 ? 1 : dailyScores.count
	}
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 60
	}
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = DailyScoreCell(style: .default, reuseIdentifier: "DailyScoreCell")
		if dailyScores.count == 0 {
			cell.showNoData()
		} else {
			cell.configureForCell(dailyScores[(indexPath as NSIndexPath).row], max: maxDailyNumber)
		}
		return cell
	}
}
