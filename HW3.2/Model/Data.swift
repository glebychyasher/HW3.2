//
//  Generation.swift
//  HW3.2
//
//  Created by Глеб Зобнин on 13.11.2023.
//

import Foundation

struct InitialValue: Decodable {
    let data: Data
}
struct Data: Decodable {
    let from: String?
    let to: String?
    let generationmix: [TypeAndPercentage]?
}

struct TypeAndPercentage: Decodable {
    let fuel: String?
    let perc: Double?
}
