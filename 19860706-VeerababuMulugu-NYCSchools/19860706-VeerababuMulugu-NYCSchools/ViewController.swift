//
//  ViewController.swift
//  19860706-VeerababuMulugu-NYCSchools
//
//  Created by Mulugu, Veerababu on 08/10/23.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Properties

    private var school: [School] = []
    private let schoolServiceURL = "https://data.cityofnewyork.us/resource/s3k6-pzi2.json"
    private var apiClient: APIClient!
    let cellSpacingHeight: CGFloat = 5

    // MARK: - Outlets

    @IBOutlet private var tableView: UITableView!
    @IBOutlet private var activityIndicator: UIActivityIndicatorView!

    // MARK: - Lifecycle Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        fetchSchoolData()
    }

    // MARK: - Initialization

    init(apiClient: APIClient) {
        super.init(nibName: nil, bundle: nil)
        self.apiClient = apiClient
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.apiClient = APIClient() // default client
    }
}

// MARK: - UI Setup

private extension ViewController {

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

// MARK: - Data Fetching

private extension ViewController {

    func fetchSchoolData() {
        guard let url = URL(string: schoolServiceURL) else {
            print("Invalid URL")
            return
        }

        apiClient.fetch(url) { [weak self] (result: Result<[School], APIError>) in
            switch result {
            case .success(let schools):
                DispatchQueue.main.async {
                    self?.activityIndicator.stopAnimating()
                    self?.school = schools
                    self?.tableView.reloadData()
                }
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
}

// MARK: - UITableViewDataSource

extension ViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return school.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SchoolTableViewCell") as? SchoolTableViewCell else {
            return UITableViewCell()
        }
        let currentSchool = school[indexPath.row]
        cell.setData(school: currentSchool)
        return cell
    }
    // Set the spacing between sections
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return cellSpacingHeight
    }
    
}

// MARK: - UITableViewDelegate

extension ViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)

        if activityIndicator.isAnimating {
            return
        }

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let schoolDetailsVC = storyboard.instantiateViewController(identifier: "SchoolDetailsViewController") as? SchoolDetailsViewController {
            navigationController?.pushViewController(schoolDetailsVC, animated: true)
        }
    }
}
