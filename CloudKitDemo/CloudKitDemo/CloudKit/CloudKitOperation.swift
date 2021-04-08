//
//  CloudKitOperation.swift
//  CloudKitDemo
//
//  Created by Daesik Choi on 4/8/21.
//

import Foundation
import CloudKit

class CloudKitOperation<T: Record> {
    static func save(model: T, completion: @escaping (T) -> Void) {
        let record = model.converToCKRecord()
        
        CloudKitManager.privateDB.save(record) { savedRecord, error in
            if let error = error {
                print("Save Error: \(error)")
            }
            
            if let record = savedRecord {
                DispatchQueue.main.async {
                    completion(T(record: record))
                }
            }
        }
    }
    
    static func query(type: String, completion: @escaping ([T]) -> Void) {
        let predicate = NSPredicate(value: true)
        let query = CKQuery(recordType: type, predicate: predicate)
        query.sortDescriptors = [NSSortDescriptor(key: CKConstant.Sort.CreationDate, ascending: true)]
        
        let operation = CKQueryOperation(query: query)
        
        var records: [T] = []
        operation.recordFetchedBlock = { record in
            records.append(T(record: record))
        }
        
        operation.queryCompletionBlock = { cursor, error in
            if let error = error {
                print("Query Error: \(error)")
            }
            
            DispatchQueue.main.async {
                completion(records)
            }
        }
        
        CloudKitManager.privateDB.add(operation)
    }
    
    static func update(model: T, completion: @escaping (T) -> Void) {
        let recordID = CKRecord.ID(recordName: model.uuid)
        
        CloudKitManager.privateDB.fetch(withRecordID: recordID) { fetchedRecord, error in
            guard let cloudRecord = fetchedRecord else { return }
            
            // The update operation needs to use 'recordChangeTag' from iCloud.
            // This is a get property, so we have to use the cloud one and merge with our value.
            let record = model.mergeWithCKRecord(cloudRecord)
            
            CloudKitManager.privateDB.save(record) { updatedRecord, error in
                if let error = error {
                    print("Update Error: \(error)")
                }
                
                if let record = updatedRecord {
                    DispatchQueue.main.async {
                        completion(T(record: record))
                    }
                }
            }
        }
    }
    
    static func delete(model: T, completion: @escaping (Bool) -> Void) {
        let recordID = CKRecord.ID(recordName: model.uuid)
        
        CloudKitManager.privateDB.delete(withRecordID: recordID) { id, error in
            if error != nil {
                print("Delete Error: \(error!)")
            }
            
            if id != nil {
                DispatchQueue.main.async {
                    completion(true)
                }
            }
        }
    }
}
