//
//  BottomSheetPresenter.swift
//  vvs
//
//  Created by Alaa Maher on 20/05/2021.
//

import Foundation
import UIKit

class BottomSheetPresenter {

	var station: StationEntity

	var numberOfItems: Int {
		return dataSource.count
	}

	weak var view: BottomSheetView!

	var dataSource: [StationEntity] = [StationEntity(name: "Bad Cannstatt",
													 city: "Stuttgart",
													 type: .sbahn,
													 stopPointRef: "de:08111:6333",
													 location: Location(longitude: 9.21747,
																		latitude: 48.80128)),
									   StationEntity(name: "Uff-Kirchhof",
													 city: "Stuttgart",
													 type: .ubahn,
													 stopPointRef: "de:08111:32",
													 location: Location(longitude: 9.22588,
																		latitude: 9.22588))]

	init(station: StationEntity) {
		self.station = station
	}

	func attach(view: BottomSheetView) {
		self.view = view
		viewDidAttach()
	}

	func viewDidAttach() {
		var typeImage: UIImage = #imageLiteral(resourceName: "u_bahn")

		switch station.type {
		case .bus:
			typeImage = #imageLiteral(resourceName: "bus")
		case .sbahn:
			typeImage = #imageLiteral(resourceName: "s_bahn")
		case .ubahn:
			typeImage = #imageLiteral(resourceName: "u_bahn")
		}
		self.view.display(name: station.name, type: typeImage)
	}

	func getIcon() -> UIImage {
		var typeImage: UIImage = #imageLiteral(resourceName: "u_bahn")

		switch station.type {
		case .bus:
			typeImage = #imageLiteral(resourceName: "bus")
		case .sbahn:
			typeImage = #imageLiteral(resourceName: "s_bahn")
		case .ubahn:
			typeImage = #imageLiteral(resourceName: "u_bahn")
		}

		return typeImage
	}
}
