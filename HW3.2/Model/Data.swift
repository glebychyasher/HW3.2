//
//  Generation.swift
//  HW3.2
//
//  Created by Глеб Зобнин on 13.11.2023.
//

import Foundation

struct Data: Decodable {
    let data: [generationShares]?
}

struct generationShares: Decodable {
    let from: String?
    let to: String?
    let generationmix: [typeAndPercentage]?
}

struct typeAndPercentage: Decodable {
    let fuel: String?
    let perc: Double?
}
