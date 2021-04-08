//
//  CloudKitManager.swift
//  CloudKitDemo
//
//  Created by Daesik Choi on 4/8/21.
//

import Foundation
import CloudKit

class CloudKitManager {
    static let privateDB = CKContainer.default().privateCloudDatabase
    static let sharedDB = CKContainer.default().sharedCloudDatabase
}
