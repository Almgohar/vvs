//
//  Constants.swift
//  vvs
//
//  Created by Alaa Maher on 16/05/2021.
//

import Foundation

struct 	Constants {
	struct ProductionServer {
		static let baseURL = "http://alhassan.staging.robustastudio.com/api/v1"
		static let imageBaseUrl = "http://alhassan.staging.robustastudio.com/"
		static let authorizationKey = "ddca9058373ee56aa29d80bdc918cb180f28f935cd1640c4eea1e16fd17b5b7251388bb51b2a476914ebab947401914597199ce7dc18516ba325e7de221bc96d"
	}
}

enum HTTPHeaderField: String {
	case authentication = "Authentication"
	case contentType = "Content-Type"
	case acceptType = "Accept"
	case acceptEncoding = "Accept-Encoding"
}

enum ContentType: String {
	case json = "application/json"
}

