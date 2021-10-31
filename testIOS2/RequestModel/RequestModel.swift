//
//  RequestModel.swift
//  testIOS2
//
//  Created by MaurZac on 30/10/21.
//

import Foundation


struct RequestModel: Codable {
   let colors: [String]
   let questions: [questions]
}

struct questions: Codable {
    let total: Int?
    let text: String?
    let chartData: [chartData]
}

struct chartData: Codable {
    let text: String
}
