//
//  ViewController.swift
//  HW3.2
//
//  Created by Глеб Зобнин on 12.11.2023.
//

import UIKit

enum Alert {
    case success
    case failed
    
    var title: String {
        switch self {
        case .success:
            return "Success"
        case .failed:
            return "Failed"
        }
    }
    
    var message: String {
        switch self {
        case .success:
            return "You can see the results in the Debug area"
        case .failed:
            return "You can see error in the Debug area"
        }
    }
}

final class MainViewController: UIViewController {
    
    private let urlAddress: URL! = URL(string: "https://api.carbonintensity.org.uk/generation")

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func getInfoButtonPressed() {
        getInfoAboutGeneration()
    }
    
    private func showAlert(withStatus status: Alert) {
        let alert = UIAlertController(title: status.title, message: status.message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        DispatchQueue.main.async { [unowned self] in
            present(alert, animated: true)
        }
    }
}

//MARK: Working with JSON
extension MainViewController {
    private func getInfoAboutGeneration() {
        URLSession.shared.dataTask(with: urlAddress) { data, _, error in 
            guard let data = data else {
                self.showAlert(withStatus: .failed)
                print(error?.localizedDescription ?? "No error description")
                return
            }
            let jsonDecoder = JSONDecoder()
            do {
                let info = try jsonDecoder.decode(InitialValue.self, from: data) //передаём тип
                self.showAlert(withStatus: .success)
                print(info)
            } catch {
                self.showAlert(withStatus: .failed)
                print(error.localizedDescription)
            }
        }.resume()
    }
}


