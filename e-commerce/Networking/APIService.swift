//
//  APIService.swift
//  e-commerce
//
//  Created by KhaleD HuSsien on 18/03/2024.
//


import Foundation
import Alamofire
enum APIError: Error {
    case urlSessionError(String)
    case offlineInternet(String = "The Internet connection appears to be offline.")
    case serverError(String = "Invalid API Key")
    case invalidResponse(String = "Invalid response from server.")
    case decodingError(String = "Error parsing server response.")
}
class APIService {
    // MARK: - ALAMOFIRE
    static let shared = APIService()
    private init(){}
    
    // MARK: - Functions :-
    // Login User
    func userLogin(phone: String,completion: @escaping (LoginData?,LoginError?,Error?)-> Void) {
        let parameters: [String: Any] = [
            "phone": phone
        ]
        AF.request("https://" + Constants.baseURL + "/api/login",
                   method: .post,
                   parameters: parameters,
                   encoding: JSONEncoding.default,
                   headers: nil)
        .validate(statusCode: 200..<300)
        .responseJSON { (response) in
            switch response.result {
                // success result Handel (loginData & loginError)
            case .success(_):
                guard let data = response.data else{return}
                do {
                    let loginData = try JSONDecoder().decode(LoginData.self, from: data)
                    completion(loginData, nil, nil)
                } catch let error{
                    print(error)
                    completion(nil, nil, error)
                }
                // failure error when get > 300 like url
            case .failure(let error):
                let status = response.response?.statusCode  ?? 0
                if status > 300{
                    do {
                        guard let data = response.data else{return}
                        let loginError = try JSONDecoder().decode(LoginError.self, from: data)
                        completion(nil, loginError, nil)
                    } catch let error{
                        print(error)
                    }
                }else{
                    completion(nil,nil,error)
                }
            }
        }
    }
    // Login Admin
    func adminLogin(phone: String,password: String,completion: @escaping (LoginData?,LoginError?,Error?)-> Void) {
        let parameters: [String: Any] = [
            "phone" : phone,
            "password" : password
        ]
        AF.request("https://" + Constants.baseURL + "/api/login",method: .post,parameters: parameters,encoding: JSONEncoding.default,headers: nil)
        .validate(statusCode: 200..<300)
        .responseJSON { (response) in
            switch response.result {
                // success result Handel (loginData & loginError)
            case .success(_):
                guard let data = response.data else{return}
                do {
                    let loginData = try JSONDecoder().decode(LoginData.self, from: data)
                    completion(loginData, nil, nil)
                } catch let error{
                    print(error)
                    completion(nil, nil, error)
                }
                // failure error when get > 300 like url
            case .failure(let error):
                let status = response.response?.statusCode  ?? 0
                if status > 300{
                    do {
                        guard let data = response.data else{return}
                        let loginError = try JSONDecoder().decode(LoginError.self, from: data)
                        completion(nil, loginError, nil)
                    } catch let error{
                        print(error)
                    }
                }else{
                    completion(nil,nil,error)
                }
            }
        }
    }
    // Genaric
    func fetchData<T: Decodable>(url: String,completion: @escaping (T?,Error?)-> Void){
        let headers: HTTPHeaders = [
            HTTP.Headers.Key.contentType.rawValue : HTTP.Headers.Value.applicationJson.rawValue,
            "Authorization":"\(Constants.TokenBearer) eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL2Zhc3RvcmRlcjEuY29tL2FwaS9sb2dpbiIsImlhdCI6MTcxMDc3Mjk5NCwiZXhwIjoxNzQyMzA4OTk0LCJuYmYiOjE3MTA3NzI5OTQsImp0aSI6IlMwVnY3OUZJeFhhWm5IQ2oiLCJzdWIiOiIxIiwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.1JVjHQ-6JQFCUv833eE7FnTK6or9T1IHrzkOWFaOtJs",
            
        ]
        AF.request(url,method: .get,encoding: JSONEncoding.default,headers: headers).responseJSON { (response) in
            
            guard let data = response.data else{return}
            switch response.result {
            case .success(_):
                do {
                    let result = try JSONDecoder().decode(T.self, from: data)
                    completion(result,nil)
                } catch let jsonError {
                    print(jsonError)
                    completion(nil,jsonError)
                }
            case .failure(let error):
                completion(nil,error)
            }
        }
    }
    
    // MARK: - Func for Codable
    func makeRequest<T: Codable>(with request: URLRequest,respModel: T.Type,completion: @escaping (T?, APIError?) -> Void) {
        URLSession.shared.dataTask(with: request) { data, resp, error in
            if let error = error {
                completion(nil, .urlSessionError(error.localizedDescription))
                return
            }
            
            if let resp = resp as? HTTPURLResponse, resp.statusCode != 200 || resp.statusCode != 201 {
                completion(nil, .serverError())
                return
            }
            
            guard let data = data else {
                completion(nil, .invalidResponse())
                return
            }
            
            do {
                let result = try JSONDecoder().decode(T.self, from: data)
                completion(result, nil)
                
            } catch let err {
                print(err)
                completion(nil, .decodingError())
                return
            }
            
        }.resume()
    }
    
}
