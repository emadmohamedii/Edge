//
//  RealmHelper.swift
//
//
//  Created by Emad Habib on 15/07/2024.

import RealmSwift
import NetworkKit

public final class RealmHelper {
    
    let realm: Realm?
    
    public init() {
        do {
            realm = try Realm()
        } catch {
            realm = nil
            print("Failed to initialize Realm: \(error.localizedDescription)")
        }
    }
    
    public func addUniversities(_ universities: [UniversityResponse]) {
        guard let realm = realm else {
            print("Realm is not initialized")
            return
        }
        
        let universityObjects = universities.map { University(from: $0) }
        
        do {
            try realm.write {
                realm.add(universityObjects)
            }
        } catch {
            print("Failed to add universities: \(error.localizedDescription)")
        }
    }
    
    public func getAllUniversities() -> [UniversityResponse] {
        guard let realm = realm else {
            print("Realm is not initialized")
            return []
        }
        
        let universities = realm.objects(University.self)
        return universities.map { $0.toResponse() }
    }
    
    public func deleteAllUniversities() {
        guard let realm = realm else {
            print("Realm is not initialized")
            return
        }
        
        do {
            try realm.write {
                let universities = realm.objects(University.self)
                realm.delete(universities)
            }
        } catch {
            print("Failed to delete universities: \(error.localizedDescription)")
        }
    }
}
