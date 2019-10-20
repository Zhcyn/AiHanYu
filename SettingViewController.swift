import UIKit
import MessageUI
import StoreKit
class SettingViewController: UIViewController {
	var tableView: UITableView!
	var switchControl_S: UISwitch!
	var switchControl_V: UISwitch!
	var C_amount = 3
	var spellStyle = "Q&A"
	let titles = [
		[
			NSLocalizedString("Sound", comment: "SettingVC"),
			NSLocalizedString("Vibration", comment: "SettingVC")
		],
		[
			NSLocalizedString("Spell style", comment: "SettingVC"),
			NSLocalizedString("Number of wheels to spell with", comment: "SettingVC")],
		[
			NSLocalizedString("Rate this app", comment: "SettingVC"),
			NSLocalizedString("Share", comment: "SettingVC")
		],
		[NSLocalizedString("Feedback", comment: "SettingVC")]
	]
	let userDefaults = UserDefaults.standard
	override func viewDidLoad() {
		super.viewDidLoad()
		self.title = NSLocalizedString("Settings", comment: "SettingVC")
		let quitButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissVC))
		navigationItem.rightBarButtonItem = quitButton
		tableView = UITableView(frame: view.bounds, style: .grouped)
		tableView.backgroundColor = UIColor.colorWithValues(MyColors.P_lightGray)
		tableView.dataSource = self
		tableView.delegate = self
		view = tableView
		switchControl_S = initialSwitchControl()
		switchControl_V = initialSwitchControl()
		getSettings()
	}
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		tableView.reloadData()
	}
	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
		userDefaults.synchronize()
	}
	func initialSwitchControl() -> UISwitch {
		let switchControl = UISwitch(frame: CGRect(origin: CGPoint(x: view.frame.width - 60, y: 7), size: CGSize.zero))
		switchControl.onTintColor = UIColor.colorWithValues(MyColors.P_rightGreen)
		switchControl.addTarget(self, action: #selector(switched(_:)), for: UIControlEvents.valueChanged)
		return switchControl
	}
	func getSettings() {
		let sound = userDefaults.bool(forKey: Defaults.sound)
		switchControl_S.setOn(sound, animated: false)
		let vibration = userDefaults.bool(forKey: Defaults.vibration)
		switchControl_V.setOn(vibration, animated: false)
		if let amount = userDefaults.value(forKey: Defaults.C_amount) as? Int {
			C_amount = amount
		} else {
			userDefaults.set(C_amount, forKey: Defaults.C_amount)
		}
		if let style = userDefaults.value(forKey: Defaults.SpellStyle) as? String {
			spellStyle = style
		} else {
			userDefaults.set(spellStyle, forKey: Defaults.SpellStyle)
		}
	}
	@objc func switched(_ sender: UISwitch) {
		let key = sender == switchControl_S ? Defaults.sound : Defaults.vibration
		userDefaults.set(sender.isOn, forKey: key)
	}
	func shareContent() {
		let text: String = NSLocalizedString("App Store: Pinyin Comparison", comment: "SettingVC")
		let link = URL(string: AppStoreLink)!
		let arr: [AnyObject] = [text as AnyObject, link as AnyObject]
		present(UIActivityViewController(activityItems: arr, applicationActivities: []), animated: true, completion: nil)
	}
	func menuViewControllerSendSupportEmail() {
		let appInfoDict = Bundle.main.infoDictionary
		let appName = appInfoDict!["CFBundleName"] as! String
		let appVersion = appInfoDict!["CFBundleShortVersionString"] as! String
		let deviceName = UIDevice.current.model
		let iOSVersion = UIDevice.current.systemVersion
		let messageBody = "\n\n\n" + appName + "_" + appVersion + "\n" + deviceName + "_" + iOSVersion
		if MFMailComposeViewController.canSendMail() {
			let controller = MFMailComposeViewController()
			controller.navigationBar.tintColor = UIColor.colorWithValues(MyColors.P_blue)
			controller.mailComposeDelegate = self
			controller.setSubject(NSLocalizedString("Feedback", comment: "SettingVC"))
			controller.setToRecipients(["pmlcfwcs@foxmail.com"])
			controller.setMessageBody(messageBody, isHTML: false)
			present(controller, animated: true, completion: nil)
		}
	}
	@objc func dismissVC() {
		self.dismiss(animated: true, completion: nil)
	}
	func connectToStore() {
		let indicator = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
		indicator.frame = CGRect(x: 0, y: -128, width: ScreenWidth, height: ScreenHeight + 128)
		indicator.startAnimating()
		UIView.animate(withDuration: 0.3, animations: { indicator.backgroundColor = UIColor(red: 45/255, green: 47/255, blue: 56/255, alpha: 0.45) })
		tableView.addSubview(indicator)
		tableView.isUserInteractionEnabled = false
		SupportProducts.store.requestProductsWithCompletionHandler({ (success, products) -> () in
			indicator.removeFromSuperview()
			self.tableView.isUserInteractionEnabled = true
			if success {
				priceFormatter.locale = products[0].priceLocale
				let alertSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
				let action_0 = UIAlertAction(title: priceFormatter.string(from: products[0].price), style: .default, handler: { (_) -> () in self.purchaseProduct(products[0]) })
				let action_1 = UIAlertAction(title: priceFormatter.string(from: products[1].price), style: .default, handler: { (_) -> () in self.purchaseProduct(products[1]) })
				let action_2 = UIAlertAction(title: priceFormatter.string(from: products[2].price), style: .default, handler: { (_) -> () in self.purchaseProduct(products[2]) })
				let action_cancel = UIAlertAction(title: NSLocalizedString("Cancel", comment: "SettingVC"), style: .cancel, handler: nil)
				alertSheet.addAction(action_0)
				alertSheet.addAction(action_2)
				alertSheet.addAction(action_1)
				alertSheet.addAction(action_cancel)
				self.present(alertSheet, animated: true, completion: nil)
			} else {
				let title = NSLocalizedString("Failed To Connect", comment: "SettingVC")
				let message = NSLocalizedString("Please check your settings and try again.", comment: "SettingVC")
				let ok = NSLocalizedString("OK", comment: "SettingVC")
				let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
				let action = UIAlertAction(title: ok, style: .default, handler: nil)
				alertController.addAction(action)
				self.present(alertController, animated: true, completion: nil)
			}
		})
	}
	func purchaseProduct(_ product: SKProduct) {
		SupportProducts.store.purchaseProduct(product)
		let hudView = HudView.hudInView(self.view, animated: true)
		hudView.text = NSLocalizedString("Thank you!", comment: "SettingVC")
	}
	@objc func productPurchased(_ notification: Notification) {
		_ = notification.object as! String
	}
}
extension SettingViewController: UITableViewDataSource, UITableViewDelegate {
	func numberOfSections(in tableView: UITableView) -> Int {
		return IAPHelper.canMakePayments() ? 4 : 3
	}
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return titles[section].count
	}
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		var cell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
		cell.textLabel?.text = titles[(indexPath as NSIndexPath).section][(indexPath as NSIndexPath).row]
		switch (indexPath as NSIndexPath).section {
		case 0:
			let switchControl = (indexPath as NSIndexPath).row == 0 ? switchControl_S : switchControl_V
			cell.addSubview(switchControl!)
		case 1:
			cell = UITableViewCell(style: .value1, reuseIdentifier: "Cell_1")
			cell.textLabel?.text = titles[(indexPath as NSIndexPath).section][(indexPath as NSIndexPath).row]
			cell.detailTextLabel?.text = (indexPath as NSIndexPath).row == 0 ? NSLocalizedString(spellStyle, comment: "SettingVC") : String(C_amount)
			cell.accessoryType = .disclosureIndicator
		case 2, 3:
			cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 15)
			cell.textLabel?.textAlignment = .center
		default:
			break
		}
		return cell
	}
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		switch (indexPath as NSIndexPath).section {
		case 0:
			let switchControl = (indexPath as NSIndexPath).row == 0 ? switchControl_S : switchControl_V
			let defaults = (indexPath as NSIndexPath).row == 0 ? Defaults.sound : Defaults.vibration
			(switchControl?.isOn)! ? switchControl?.setOn(false, animated: true) : switchControl?.setOn(true, animated: true)
			userDefaults.set(switchControl?.isOn, forKey: defaults)
		case 1:
			let settingVC_1 = SettingVC_1()
			settingVC_1.type = (indexPath as NSIndexPath).row
			switch (indexPath as NSIndexPath).row {
			case 0:
				settingVC_1.selectedOne = NSLocalizedString(spellStyle, comment: "SettingVC")
				settingVC_1.sendBack = { [weak self] selected -> Void in
					self!.spellStyle = selected == 3 ? "Q&A" : "Free"
					self!.userDefaults.set(self?.spellStyle, forKey: Defaults.SpellStyle)
				}
			case 1:
				settingVC_1.selectedOne = String(C_amount)
				settingVC_1.sendBack = { [weak self] selected -> Void in
					self!.C_amount = selected
					self!.userDefaults.set(self!.C_amount, forKey: Defaults.C_amount)
				}
			default:
				break
			}
			navigationController?.pushViewController(settingVC_1, animated: true)
		case 2:
			switch (indexPath as NSIndexPath).row {
			case 0: UIApplication.shared.openURL(URL(string: iTunesViewLink)!)
			case 1: shareContent()
			default: break
			}
		case 3:
			menuViewControllerSendSupportEmail()
		default:
			break
		}
		tableView.deselectRow(at: indexPath, animated: true)
	}
}
extension SettingViewController: MFMailComposeViewControllerDelegate {
	func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
		controller.dismiss(animated: true, completion: nil)
	}
}
