//
//  UITableView+Extensions.swift
//  vvs
//
//  Created by Alaa Maher on 19/05/2021.
//

import UIKit

extension NSObject {
	static var className: String {
		return String(describing: self)
	}
}

extension UITableView {

	func register<T: UITableViewCell>(cellType: T.Type) {
		let nib = UINib(nibName: cellType.className, bundle: nil)
		self.register(nib, forCellReuseIdentifier: cellType.className)
	}

	func dequeueReusableCell<T: UITableViewCell>() -> T? {
		let cell = self.dequeueReusableCell(withIdentifier: T.className)
		return cell as? T
	}

	func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T {
		let cell = self.dequeueReusableCell(withIdentifier: T.className, for: indexPath)
		return cell as! T
	}
}
