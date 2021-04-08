//
//  RecordProtocol.swift
//  CloudKitDemo
//
//  Created by Daesik Choi on 4/8/21.
//

import Foundation
import CloudKit

protocol Record {
    var uuid: String { get }
    var createdAt: Date { get }
    var updatedAt: Date { get }

    init(record: CKRecord)
    func converToCKRecord() -> CKRecord
    func mergeWithCKRecord(_ record: CKRecord) -> CKRecord
}
