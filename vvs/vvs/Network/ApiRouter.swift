//
//  ApiRouter.swift
//  vvs
//
//  Created by Alaa Maher on 16/05/2021.
//

import Alamofire
import  Foundation

enum APIRouter: URLRequestConvertible {
	case departures(ref: String, timestamp: String)
	case lines(ref: String)


	// MARK: - HTTPMethod
	private var method: HTTPMethod {
		switch self {
		case .departures:
			return .post
		case .lines:
			return .get
		}
	}

	// MARK: - Path
	private var path: String {
		switch self {
		case .departures:
			return "http://efastatic.vvs.de/zigzag/trias"
		case .lines(let ref):
			return "https://www2.vvs.de/smarths/XML_GEOOBJECT_REQUEST?SpEncId=0&coordOutputFormat=EPSG:4326&line=\(ref)&outputFormat=rapidJSON&serverInfo=1&spTZO=1&stFaZon=1&vSL=0&version=10.2.10.139"
		}

	}

	private var body: Data {
		switch self {
	//	case .departures(let ref, let timestamp)(let joinUsRequestEntity):
//			return try! JSONEncoder().encode(joinUsRequestEntity)
//		case .complaint(let complaintEntity):
//			return try! JSONEncoder().encode(complaintEntity)
		default:
			return Data()
		}
	}

	// MARK: - URLRequestConvertible
	func asURLRequest() throws -> URLRequest {
		let url = URLComponents(string: Constants.ProductionServer.baseURL + path)

		var urlRequest = URLRequest(url: (try url?.asURL())!)

		// HTTP Method
		urlRequest.httpMethod = method.rawValue
		// Common Headers
		urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
		urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
		urlRequest.setValue(Constants.ProductionServer.authorizationKey, forHTTPHeaderField: HTTPHeaderField.authentication.rawValue)
		urlRequest.httpBody = (method == .post) ? body : nil
		return urlRequest
		//return try! Alamofire.URLEncoding.default.encode(urlRequest, with: parameters)
	}

}
