//
//  ApiManager.swift
//  ApiManager
//
//  Created by Shujat Ali on 31/10/2023.
//
import Foundation

public protocol ApiManager {
    func data(from url: URL) async throws -> (Data, URLResponse)
    func data(from url: URL, delegate: URLSessionTaskDelegate?) async throws -> (Data, URLResponse)
}

extension URLSession: ApiManager {
}
