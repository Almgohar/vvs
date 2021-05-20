//
//  HomeViewController.swift
//  vvs
//
//  Created by Alaa Maher on 17/05/2021.
//

import UIKit

protocol HomeView: AnyObject {
	func setLoader(loader: Bool)
	func showErrorAlert(message: String)
	func navigateToStationDetails(viewController: UIViewController)
}

class HomeViewController: UIViewController {

	@IBOutlet weak private var nearbyButton: UIButton!
	@IBOutlet weak private var nearbyButtonSelector: UIView!
	@IBOutlet weak private var recentButton: UIButton!
	@IBOutlet weak private var recentButtonSelector: UIView!
	@IBOutlet weak private var tableView: UITableView!

	var presenter: HomePresenter = HomePresenter()

    override func viewDidLoad() {
        super.viewDidLoad()
		presenter.attach(view: self)
	}

	override func viewWillAppear(_ animated: Bool) {
		setupNavigationBar()
		setupTableview()
	}

	func setupNavigationBar() {
		if let navigationBar = self.navigationController?.navigationBar {
			self.navigationController?.setStatusBar(backgroundColor: #colorLiteral(red: 0.9882352941, green: 0.3882352941, blue: 0.1176470588, alpha: 1))
			let view = UIImageView(frame: CGRect(x: navigationBar.frame.maxX - 72, y: 24, width: 48, height: 48))
			view.cornerRadius = 4
			view.layer.masksToBounds = false
			view.layer.shadowOffset = CGSize(width: 0, height: 2)
			view.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.09599617459)
			view.layer.shadowRadius = 2
			view.layer.shadowOpacity = 1

			view.image = UIImage(systemName: "scribble")
			view.tintColor = #colorLiteral(red: 0.9882352941, green: 0.3882352941, blue: 0.1176470588, alpha: 1)
			view.backgroundColor = .white
		navigationBar.addSubview(view)
		}

		let infoButton = UIBarButtonItem(image: #imageLiteral(resourceName: "info"), style: .plain, target: self, action: #selector(infoButtonTapped))
		infoButton.tintColor = .white
		self.navigationItem.setLeftBarButton(infoButton, animated: true)
	}

	func setupTableview() {
		tableView.register(cellType: StationTableViewCell.self)
		tableView.dataSource = self
		tableView.delegate = self
	}

	@IBAction func selectNearby() {
		self.nearbyButton.titleLabel?.font = .textStyle
		self.nearbyButtonSelector.isHidden = false
		self.recentButton.titleLabel?.font = .textStyle2
		self.recentButtonSelector.isHidden = true
	}

	@IBAction func selectRecent() {
		self.nearbyButton.titleLabel?.font = .textStyle2
		self.nearbyButtonSelector.isHidden = true
		self.recentButton.titleLabel?.font = .textStyle
		self.recentButtonSelector.isHidden = false
	}

	@objc func infoButtonTapped() {

	}
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return presenter.numberOfCells()
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell: StationTableViewCell = tableView.dequeueReusableCell(for: indexPath)
		let selectedView = UIView()
		selectedView.backgroundColor = #colorLiteral(red: 0.9647058824, green: 0.9647058824, blue: 0.9647058824, alpha: 1)
		cell.selectedBackgroundView = selectedView
		presenter.configureStation(cell: cell, indexPath: indexPath)
		return cell
	}

	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		self.presenter.didSelectStation(indexPath: indexPath)
	}
}

extension HomeViewController: HomeView {
	func setLoader(loader: Bool) {

	}

	func showErrorAlert(message: String) {

	}

	func navigateToStationDetails(viewController: UIViewController) {
		self.navigationController?.pushViewController(viewController, animated: true)
	}


}
