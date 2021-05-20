//
//  StationDetailsPresenter.swift
//  vvs
//
//  Created by Alaa Maher on 20/05/2021.
//

import Foundation
import UIKit

class StationDetailsPresenter {

	var station: StationEntity

	weak var view: StationDetailsView!

	init(station: StationEntity) {
		self.station = station
	}

	func attach(view: StationDetailsView) {
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
		self.view.display(latitude: station.location.latitude, longitude: station.location.longitude, icon: typeImage)
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

//	func numberOfCells() -> Int {
//		return dataSource.count
//	}
//
//	func configureStation(cell: StationTableViewCell, indexPath: IndexPath) {
//		let station = dataSource[indexPath.row]
//		var typeImage: UIImage = #imageLiteral(resourceName: "u_bahn")
//
//		switch station.type {
//		case .bus:
//			typeImage = #imageLiteral(resourceName: "bus")
//		case .sbahn:
//			typeImage = #imageLiteral(resourceName: "s_bahn")
//		case .ubahn:
//			typeImage = #imageLiteral(resourceName: "u_bahn")
//		}
//
//		cell.display(name: station.name, type: typeImage, city: station.city)
//	}
//
//
//	func didSelectStation(indexPath: IndexPath) {
//		let station = dataSource[indexPath.row]
//		let viewController = StationDetailsViewController()
//		self.view.navigateToStationDetails(viewController: viewController)
//	}
}

