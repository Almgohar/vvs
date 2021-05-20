//
//  StationDetailsViewController.swift
//  vvs
//
//  Created by Alaa Maher on 19/05/2021.
//

import UIKit
import MapKit

protocol StationDetailsView: AnyObject {
	func display(latitude: Float, longitude: Float, icon: UIImage)
}

class StationDetailsViewController: UIViewController {

	@IBOutlet weak private var mapView: MKMapView!

	var presenter: StationDetailsPresenter!
	var locationManager:CLLocationManager!

    override func viewDidLoad() {
        super.viewDidLoad()
		presenter.attach(view: self)
    }

	override func viewWillAppear(_ animated: Bool) {
		setupNavigationBar()
	}

	override func viewDidAppear(_ animated: Bool) {
		addBottomSheetView()
	}

	override func viewWillDisappear(_ animated: Bool) {
		self.navigationController?.navigationBar.setBackgroundImage(nil, for: .default)
		self.navigationController?.navigationBar.shadowImage = nil
		self.navigationController?.navigationBar.isTranslucent = false
		self.navigationController?.view.backgroundColor = #colorLiteral(red: 0.9994869828, green: 0.4758369923, blue: 0.1487264633, alpha: 1)
	}

	func setupNavigationBar() {
		if let navigationBar = self.navigationController?.navigationBar {
			navigationBar.setBackgroundImage(UIImage(), for: .default) //UIImage.init(named: "transparent.png")
			navigationBar.shadowImage = UIImage()
			navigationBar.isTranslucent = true
			self.navigationController?.view.backgroundColor = .clear
			self.navigationController?.setStatusBar(backgroundColor: .clear)

			let imageView = navigationBar.subviews.first(where: {$0 .isKind(of: UIImageView.self)})
			imageView?.removeFromSuperview()
			let backButton = UIBarButtonItem(image: #imageLiteral(resourceName: "back"), style: .plain, target: self, action: #selector(backButtonTapped))

			backButton.tintColor = .white
			self.navigationItem.hidesBackButton = true
			self.navigationItem.leftBarButtonItem = backButton
			let view = UIView(frame: CGRect(x: navigationBar.frame.maxX - 96, y: 3, width: 72, height: 40))
			view.cornerRadius = 4
			view.layer.masksToBounds = false
			view.layer.shadowOffset = CGSize(width: 0, height: 2)
			view.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.09599617459)
			view.layer.shadowRadius = 2
			view.layer.shadowOpacity = 1
			let label = UILabel(frame: CGRect(x: 12, y: 0, width: 24, height: view.frame.height))
			label.font = .textStyle2
			label.text = "17º"
			let icon = UIImageView(frame: CGRect(x: 36, y: 0, width: view.frame.height, height: view.frame.height))
			icon.image = #imageLiteral(resourceName: "weather")
			view.addSubview(label)
			view.addSubview(icon)
			view.tintColor = #colorLiteral(red: 0.9882352941, green: 0.3882352941, blue: 0.1176470588, alpha: 1)
			view.backgroundColor = .white
			navigationBar.addSubview(view)
		}
	}

	@objc func backButtonTapped() {
		self.navigationController?.popViewController(animated: true)
	}

	func addBottomSheetView() {
		// 1- Init bottomSheetVC
		let bottomSheetVC = BottomSheetViewController()
		let presenter = BottomSheetPresenter(station: presenter.station)

		bottomSheetVC.presenter = presenter

		// 2- Add bottomSheetVC as a child view
		self.addChild(bottomSheetVC)
		self.view.addSubview(bottomSheetVC.view)
		bottomSheetVC.didMove(toParent: self)
		// 3- Adjust bottomSheet frame and initial position.
		let height = view.frame.height
		let width  = view.frame.width
		bottomSheetVC.view.frame = CGRect(x: 0, y: 0, width: width, height: height)
	}

}


extension StationDetailsViewController: StationDetailsView {
	func display(latitude: Float, longitude: Float, icon: UIImage) {
		let annotation = MKPointAnnotation()
		annotation.coordinate = CLLocationCoordinate2D(latitude: CLLocationDegrees(latitude), longitude: CLLocationDegrees(longitude))

		let annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "pin")
		annotationView.image = icon
		mapView.addAnnotation(annotationView.annotation!)
		mapView.setRegion(MKCoordinateRegion(center: annotation.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)), animated: true)
	}
}

extension StationDetailsViewController: MKMapViewDelegate, CLLocationManagerDelegate {
	func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
		if let location = locations.last {
		}
	}

	//MARK:- Intance Methods
	func mapView(_ mapView: MKMapView,
				 viewFor annotation: MKAnnotation) -> MKAnnotationView? {

		let reuseIdentifier = "pin"
		var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseIdentifier)

		if annotationView == nil {
			annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: reuseIdentifier)
			annotationView?.canShowCallout = true
		} else {
			annotationView?.annotation = annotation
		}

		annotationView?.image = presenter.getIcon()

		return annotationView
	}

	func determineCurrentLocation() {
		locationManager = CLLocationManager()
		locationManager.delegate = self
		locationManager.desiredAccuracy = kCLLocationAccuracyBest
		locationManager.requestAlwaysAuthorization()

		if CLLocationManager.locationServicesEnabled() {
			locationManager.startUpdatingLocation()
		}
	}
}

