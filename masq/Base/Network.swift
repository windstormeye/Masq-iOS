//
//  Network.swift
//  masq
//
//  Created by PJHubs on 2019/7/4.
//  Copyright © 2019 PJHubs. All rights reserved.
//

//import Foundation
//import Alamofire
//import SwiftyJSON
//
//class MASNetwork {
//    static let shared = MASNetwork()
//
//    //    let hostName = "http://127.0.0.1:8000/"
//    let hostName = "http://pigpen.pjhubs.com/"
//
//
//    func get(path: String,
//             parameters: inout [String: String],
//             complement: @escaping ([String: JSON]) -> Void,
//             failed: @escaping (String) -> Void) {
//
//        parameters["nick_name"] = MASUser.shared.model.nickname
//        parameters["uid"] = MASUser.shared.model.uidString()
//
//        let params = parametersHandler(parameters: parameters)
//        let headerParameters: HTTPHeaders = [
//            "usertoken": MASUser.shared.model.token,
//            "timestamp": String.timestampe(),
//        ]
//
//        debugOnly {
//            print("提交的参数：")
//            print(params)
//        }
//
//
//        AF.request(hostName + path,
//                          method: .get,
//                          parameters: params,
//                          encoding: URLEncoding.default,
//                          headers: headerParameters).responseJSON { (response) in
//                            switch response.result {
//                            case .success(_):
//                                complement(self.handleSuccess(response.data))
//                            case .failure(_):
//                                let errorString = response.error?.asAFError?.localizedDescription ?? "error"
//                                debugOnly {
//                                    print("请求错误内容：")
//                                    print(errorString)
//                                }
//                                failed(errorString)
//                            }
//        }
//    }
//
//
//    func post(path: String,
//              parameters: inout [String: String],
//              complement: @escaping ([String: JSON]) -> Void,
//              failed: @escaping (String) -> Void) {
//
//        parameters["nick_name"] = MASUser.shared.model.nickname
//        parameters["uid"] = MASUser.shared.model.uidString()
//
//        let params = parametersHandler(parameters: parameters)
//        let headerParameters: HTTPHeaders = [
//            "usertoken": MASUser.shared.model.token,
//            "timestamp": String.timestampe(),
//        ]
//
//        debugOnly {
//            print("提交的参数：")
//            print(params)
//        }
//
//        AF.request(hostName + path,
//                          method: .post,
//                          parameters: params,
//                          encoding: URLEncoding.default,
//                          headers: headerParameters).responseJSON { (response) in
//                            switch response.result {
//                            case .success(_):
//                                complement(self.handleSuccess(response.data))
//                            case .failure(_):
//                                let errorString = response.error?.asAFError?.localizedDescription ?? "error"
//                                debugOnly {
//                                    print("请求错误内容：")
//                                    print(errorString)
//                                }
//                                failed(errorString)
//                            }
//        }
//    }
//
//
//    private func handleSuccess(_ data: Data?) -> [String: JSON] {
//        if let data = data {
//            if let jsonData = try? JSON(data: data).dictionary {
//                handleNetworkError(dict: jsonData)
//                debugOnly {
//                    print("解析的返回结果为：")
//                    print(jsonData)
//                }
//                return jsonData
//            }
//        }
//        return [:]
//    }
//
//
//    private func parametersHandler(parameters: [String: Any]) -> Parameters {
//        var pa = Parameters()
//        for (k ,v) in parameters {
//            pa[k] = v
//        }
//        return pa
//    }
//
//    private func handleNetworkError(dict: [String: JSON]) {
//        switch dict["msgCode"] {
//        case 2333: break
//        case 1001: break
////            if !MASUser.shared.isLogin {
////                NotificationCenter.default.post(name: .gotoLogin(), object: nil)
////                MASUser.shared.isLogin = !MASUser.shared.isLogin
////            }
//        case 1002: break
//        case 2001: break
//        default: break
//        }
//    }
//
//}
//
//extension MASNetwork {
//
//    enum NetworkError {
//        case token
//        case timeout
//        case parameters
//        case methon
//    }
//
//}
//
