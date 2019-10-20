import Foundation
public enum SupportProducts {
	fileprivate static let Prefix = "com.xiaoyao.PinyinComparison."
	public static let SupportOne = Prefix + "SupportOne"
	public static let SupportTwo          = Prefix + "SupportTwo"
	public static let SupportThree         = Prefix + "SupportThree"
	fileprivate static let productIdentifiers: Set<ProductIdentifier> = [
		SupportProducts.SupportOne,
		SupportProducts.SupportTwo,
		SupportProducts.SupportThree]
	public static let store = IAPHelper(productIdentifiers: SupportProducts.productIdentifiers)
}
func resourceNameForProductIdentifier(_ productIdentifier: String) -> String? {
	return productIdentifier.components(separatedBy: ".").last
}
