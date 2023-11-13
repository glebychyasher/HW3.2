//
//  ViewController.swift
//  HW3.2
//
//  Created by Глеб Зобнин on 12.11.2023.
//

import UIKit

final class MainViewController: UIViewController {
    
    private let url: String = "https://api.carbonintensity.org.uk/generation"

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func getInfoButtonPressed() {
        getInfoButtonPressed()
    }
}

//MARK: Working with JSON
extension MainViewController {
    private func getInfoAboutGeneration() {
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            let jsonDecoder = JSONDecoder()
            do {
                let courses = try jsonDecoder.decode(Data.self, from: data) //передаём тип
                self.showAlert(withStatus: .success)
            } catch {
                print(error.localizedDescription)
                self.showAlert(withStatus: .failed)
            }
        }.resume()
        
    }
    }
}

