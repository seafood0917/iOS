//
//  Idea.swift
//  CloudKitDemo
//
//  Created by Daesik Choi on 4/8/21.
//

import Foundation
import CloudKit

struct Idea {
    let uuid: String
    let createdAt: Date
    let updatedAt: Date
    
    let title: String
}

extension Idea: Record {
    init(title: String) {
        self.uuid = UUID().uuidString
        self.createdAt = Date()
        self.updatedAt = Date()
        
        self.title = title
    }
    
    init(record: CKRecord) {
        self.uuid = record.recordID.recordName
        self.createdAt = record.creationDate!
        self.updatedAt = record.modificationDate!
        self.title = record.object(forKey: CKConstant.Field.title) as! String
    }
    
    func converToCKRecord() -> CKRecord {
        let recordID = CKRecord.ID(recordName: uuid) // Why not use self.uuid?
        let record = CKRecord(recordType: CKConstant.RecordType.Ideas, recordID: recordID)
        record.setValue(title, forKey: CKConstant.Field.title)
        return record
    }
    
    func mergeWithCKRecord(_ record: CKRecord) -> CKRecord {
        record.setValue(title, forKey: CKConstant.Field.title)
        return record
    }
    
    
}
