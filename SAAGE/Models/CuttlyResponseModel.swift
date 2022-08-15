//
//  CuttlyResponseModel.swift
//  SAAGE
//
//  Created by manraj thind on 2022-03-08.
//

import Foundation

struct UrlShortResponseModel: Codable {
    var url: URLModel
}

struct URLModel: Codable {
    var status: Int
    var fullLink: String
    var shortLink: String
    var title: String
}
