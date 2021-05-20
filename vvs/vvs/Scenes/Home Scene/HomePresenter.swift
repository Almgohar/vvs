//
//  HomePresenter.swift
//  vvs
//
//  Created by Alaa Maher on 19/05/2021.
//

import Foundation
import UIKit

class HomePresenter {

	var numberOfItems: Int {
		return dataSource.count
	}

	weak var view: HomeView!
	var loaded: Bool = false
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

	func attach(view: HomeView) {
		self.view = view
	}

	func numberOfCells() -> Int {
		return dataSource.count
	}

	func configureStation(cell: StationTableViewCell, indexPath: IndexPath) {
		let station = dataSource[indexPath.row]
		var typeImage: UIImage = #imageLiteral(resourceName: "u_bahn")

		switch station.type {
		case .bus:
			typeImage = #imageLiteral(resourceName: "bus")
		case .sbahn:
			typeImage = #imageLiteral(resourceName: "s_bahn")
		case .ubahn:
			typeImage = #imageLiteral(resourceName: "u_bahn")
		}

		cell.display(name: station.name, type: typeImage, city: station.city)
	}


	func didSelectStation(indexPath: IndexPath) {
		let station = dataSource[indexPath.row]
		let viewController = StationDetailsViewController()
		let presenter  = StationDetailsPresenter(station: station)
		viewController.presenter = presenter
		self.view.navigateToStationDetails(viewController: viewController)
	}
}


