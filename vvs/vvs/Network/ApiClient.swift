//
//  ApiClient.swift
//  vvs
//
//  Created by Alaa Maher on 16/05/2021.
//

import Foundation
import Alamofire

class APIClient {

	@discardableResult
	private static func performRequest<T:Decodable>(route: URLRequestConvertible, decoder: JSONDecoder = JSONDecoder(), completion: @escaping (Result<T, AFError>)->Void) -> DataRequest {
		return AF.request(route).responseDecodable (decoder: decoder) { (response: DataResponse<T, AFError>) in
			if response.response?.statusCode == 204 {
				completion(.success(true as! T))
				return
			}
//				switch response.response?.statusCode {
//				case 404: break
//				case 401: break
//				case 500...599: break
//				default: completion(response.result)
//				}
				completion(response.result)
		}
	}

//	static func getProjects(page: Int, completion: @escaping (Result<ProjectsResponse, AFError>)->Void) {
//		performRequest(route: APIRouter.allProjects(page: page), decoder: JSONDecoder(), completion: completion)
//	}
//
//	static func getCategories(completion: @escaping (Result<GetAllCategoriesResponse, AFError>)->Void) {
//		performRequest(route: APIRouter.allCategories, decoder: JSONDecoder(), completion: completion)
//	}
//
//	static func getDonationsItems(completion: @escaping (Result<DonationResponse, AFError>)->Void) {
//		performRequest(route: APIRouter.donations, decoder: JSONDecoder(), completion: completion)
//	}
//
//	static func getContactUsDetails(completion: @escaping (Result<ContactUsDetailsResponse, AFError>)->Void) {
//		performRequest(route: APIRouter.contactUs, completion: completion)
//	}
//
//	static func getRiseUpDetails(completion: @escaping (Result<RiseUpResponse, AFError>)->Void) {
//		performRequest(route: APIRouter.riseUp, completion: completion)
//	}
//
//	static func getYoutubePlaylist(playlistId: String, completion: @escaping (Result<YoutubePlaylistResponse, AFError>)->Void) {
//		performRequest(route: YoutubeEndpoint.youtubePlaylistVideos(playlistId: playlistId), completion: completion)
//	}
//
//	static func getYoutubeVideoDetails(videoId: String, completion: @escaping (Result<YoutubeVideoListResponse, AFError>)->Void) {
//		performRequest(route: YoutubeEndpoint.youtubeVideoDetails(videoId: videoId), completion: completion)
//	}
//
//	static func getJoinUsDetails(completion: @escaping (Result<JoinUsResponse, AFError>)->Void) {
//		performRequest(route: APIRouter.joinUs, completion: completion)
//	}
//
//	static func getPositionsList(completion: @escaping (Result<PositionsListResponse, AFError>)->Void) {
//		performRequest(route: APIRouter.positionsList, completion: completion)
//	}
//
//	static func sendJoinUsRequest(joinUsRequestEntity: JoinUsRequestEntity, completion: @escaping (Result<Bool, AFError>)-> Void) {
//		performRequest(route: APIRouter.joinUsRequest(joinUsRequestEntity: joinUsRequestEntity), completion: completion)
//	}
//
//	static func sendComplaintRequest(complaintRequestEntity: ComplaintEntity, completion: @escaping (Result<Bool, AFError>)-> Void) {
//		performRequest(route: APIRouter.complaint(complaintEntity: complaintRequestEntity), completion: completion)
//	}
//
//	static func search(searchParameters: [String: Any], completion: @escaping (Result<SearchResponse, AFError>)-> Void) {
//		performRequest(route: APIRouter.search(searchParameters: searchParameters), completion: completion)
//	}
//
//	static func getPlaceDetails(placeId: String, completion: @escaping (Result<PlaceDetailsResponse, AFError>)-> Void) {
//		performRequest(route: APIRouter.placeDetails(placeId: placeId), completion: completion)
//	}
//
//	static func getGovernates(completion: @escaping (Result<GoverneratesResponse, AFError>)-> Void) {
//		performRequest(route: APIRouter.governerates, completion: completion)
//	}
//
//	static func getAboutUsDetails(completion: @escaping (Result<StaticDetailsHTMLEntity, AFError>)-> Void) {
//		performRequest(route: APIRouter.aboutUs, completion: completion)
//	}
//
//	static func getTermsDetails(completion: @escaping (Result<StaticDetailsHTMLEntity, AFError>)-> Void) {
//		performRequest(route: APIRouter.terms, completion: completion)
//	}
//
//	static func getPrivacyPolicyDetails(completion: @escaping (Result<StaticDetailsHTMLEntity, AFError>)-> Void) {
//		performRequest(route: APIRouter.privacy, completion: completion)
//	}
}
