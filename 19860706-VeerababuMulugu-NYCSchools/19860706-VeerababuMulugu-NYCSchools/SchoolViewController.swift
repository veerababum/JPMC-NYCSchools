//
//  ViewController.swift
//  19860706-VeerababuMulugu-NYCSchools
//
//  Created by Mulugu, Veerababu on 08/10/23.
//

import UIKit

class SchoolViewController: UIViewController {

    // MARK: - Properties
    private var viewModel: SchoolViewModel!
    let cellSpacingHeight: CGFloat = 5

    // MARK: - Outlets
    @IBOutlet private var tableView: UITableView!
    @IBOutlet private var activityIndicator: UIActivityIndicatorView!

    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = SchoolViewModel(apiClient: APIClient())
        
        bindViewModel()
        
        setupUI()
        viewModel.fetchSchools()
    }
    
    // MARK: - ViewModel Binding
    private func bindViewModel() {
        viewModel.reloadDataClosure = { [weak self] in
            DispatchQueue.main.async {
                self?.activityIndicator.stopAnimating()
                self?.tableView.reloadData()
            }
        }
        
        viewModel.showAlertClosure = { [weak self] in
            if let errorMessage = self?.viewModel.errorMessage {
                self?.showAlert(message: errorMessage)
            }
        }
    }
    
    // ... (rest of your ViewController)
}

private extension SchoolViewController {

    func setupUI() {
        view.backgroundColor = UIColor.white.withAlphaComponent(0.7)
        tableView.backgroundView = nil
        tableView.register(UINib(nibName: "SchoolTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "SchoolTableViewCell")
    }

    func showAlert(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}
// Update your UITableViewDataSource and UITableViewDelegate accordingly.

// MARK: - UITableViewDataSource

extension SchoolViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.schools.count 
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SchoolTableViewCell") as? SchoolTableViewCell else {
            return UITableViewCell()
        }
        let currentSchool = viewModel.schools[indexPath.row]
        cell.setData(school: currentSchool)
        return cell
    }
    // Set the spacing between sections
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return cellSpacingHeight
    }
    
}

// MARK: - UITableViewDelegate

extension SchoolViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)

        if activityIndicator.isAnimating {
            return
        }

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let schoolDetailsVC = storyboard.instantiateViewController(identifier: "SchoolDetailsViewController") as? SchoolDetailsViewController {
            let selectedSchool = viewModel.schools[indexPath.row] // Assuming "schools" is the array you're using as your data source
            schoolDetailsVC.school = selectedSchool

            navigationController?.pushViewController(schoolDetailsVC, animated: true)
        }
    }
}
