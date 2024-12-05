//
//  SearchModel.swift
//  week06_study
//
//  Created by nelime on 11/16/24.
//

struct SearchModel: Codable {
    let documents: [DetailDocument]
}

struct DetailDocument: Codable {
    let contents: String
    let datetime: String
    let title: String
    let url: String
}
