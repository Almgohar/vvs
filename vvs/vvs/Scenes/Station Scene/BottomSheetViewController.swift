//
//  BottomSheetViewController.swift
//  vvs
//
//  Created by Alaa Maher on 20/05/2021.
//

import UIKit

protocol BottomSheetView: AnyObject {
	func display(name: String, type: UIImage)
}

class BottomSheetViewController: UIViewController {

	@IBOutlet weak private var tableView: UITableView!
	@IBOutlet weak private var panButton: UIButton!
	@IBOutlet weak private var bottomSheetView: UIView!
	@IBOutlet weak private var nameLabel: UILabel!
	@IBOutlet weak private var typeIcon: UIImageView!

	var presenter: BottomSheetPresenter!

    override func viewDidLoad() {
        super.viewDidLoad()
		presenter.attach(view: self)
		setupTableview()
		let gesture = UIPanGestureRecognizer.init(target: self, action: #selector(BottomSheetViewController.panGesture))
			panButton.addGestureRecognizer(gesture)
        // Do any additional setup after loading the view.
    }

	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)

		UIView.animate(withDuration: 0.8) { [weak self] in
			let frame = self?.view.frame
			let yComponent = (self?.bottomSheetView.bounds.maxY)! - 400
			self?.view.frame = CGRect(x: 0, y: yComponent, width: frame!.width, height: frame!.height)
		}
	}

	override func viewWillAppear(_ animated: Bool) {
		prepareBackgroundView()
	}

	@objc func panGesture(recognizer: UIPanGestureRecognizer) {
		let translation = recognizer.translation(in: self.view)
		let y = self.view.frame.minY
		let translationY = (y + translation.y) < 0 ? 0 : (y + translation.y)
		self.view.frame = CGRect(x: 0, y: translationY, width: view.frame.width, height: view.frame.height)
		recognizer.setTranslation(.zero, in: self.view)
	}

	func setupTableview() {
		tableView.register(cellType: TripTableViewCell.self)
		tableView.dataSource = self
		tableView.delegate = self
	}

	func prepareBackgroundView(){
//		let blurEffect = UIBlurEffect.init(style: .)
//		let visualEffect = UIVisualEffectView.init(effect: blurEffect)
//		let bluredView = UIVisualEffectView.init(effect: blurEffect)
//		bluredView.contentView.addSubview(visualEffect)
//
//		visualEffect.frame = UIScreen.main.bounds
//		bluredView.frame = UIScreen.main.bounds
//
//		view.insertSubview(bluredView, at: 0)
	}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension BottomSheetViewController: UITableViewDelegate, UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 12
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell: TripTableViewCell = tableView.dequeueReusableCell(for: indexPath)
		let selectedView = UIView()
		selectedView.backgroundColor = (indexPath.row%2 == 0) ? .white : #colorLiteral(red: 0.9647058824, green: 0.9647058824, blue: 0.9647058824, alpha: 1)
		cell.backgroundView = selectedView
	///	presenter.configureStation(cell: cell, indexPath: indexPath)
		return cell
	}

	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		//self.presenter.didSelectStation(indexPath: indexPath)
	}
}

extension BottomSheetViewController: BottomSheetView {
	func display(name: String, type: UIImage) {
		self.nameLabel.text = name
		self.typeIcon.image = type
	}
}
