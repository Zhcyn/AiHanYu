import UIKit
class SettingVC_1: UITableViewController {
	var type: Int!
	var titles = ["3", "4"]
	var selectedOne = String()
	var sendBack: ((Int) -> Void)?
	override func viewDidLoad() {
		super.viewDidLoad()
		tableView = UITableView(frame: view.bounds, style: .grouped)
		tableView.backgroundColor = UIColor.colorWithValues(MyColors.P_lightGray)
		titles = type == 0 ? [NSLocalizedString("Q&A", comment: "SettingVC"), NSLocalizedString("Free", comment: "SettingVC")] : ["3", "4"]
	}
	override func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 2
	}
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
		cell.textLabel?.text = titles[(indexPath as NSIndexPath).row]
		if cell.textLabel?.text == selectedOne { cell.accessoryType = .checkmark }
		return cell
	}
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let cell = tableView.cellForRow(at: indexPath)
		cell?.accessoryType = .checkmark
		sendBack!((indexPath as NSIndexPath).row + 3)
		let row = (indexPath as NSIndexPath).row == 0 ? 1 : 0
		let otherIndexPath = IndexPath(row: row, section: 0)
		let otherCell = tableView.cellForRow(at: otherIndexPath)
		otherCell?.accessoryType = .none
		tableView.deselectRow(at: indexPath, animated: true)
		let _ = navigationController?.popToRootViewController(animated: true)
	}
}
