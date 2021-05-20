//
//  StationTableViewCell.swift
//  vvs
//
//  Created by Alaa Maher on 18/05/2021.
//

import UIKit

class StationTableViewCell: UITableViewCell {
	@IBOutlet weak private var nameLabel: UILabel!
	@IBOutlet weak private var cityLabel: UILabel!
	@IBOutlet weak private var typeIcon: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

	func display(name: String, type: UIImage, city: String) {
		self.nameLabel.text = name
		self.cityLabel.text = city
		self.typeIcon.image = type
	}
}
