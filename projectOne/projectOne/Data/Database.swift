//
//  Database.swift
//
//  Created by Bruno Gonçalves on 31/03/18.
//

import RealmSwift

class Database<T: Object> {
    var realm: Realm?
    
    init() {
        do {
            realm = try Realm()
            print(realm?.configuration.fileURL ?? "No Database found")
        } catch {
            //empty
        }
    }
    
    func save(obj: T) {
        if let rm = realm {
            do {
                try rm.write() {
                    rm.add(obj)
                }
            } catch {
                //empty
            }
        }
        print(realm?.configuration.fileURL ?? "No Database Found")
    }
    
    func update(obj: T) {
        if let rm = realm {
            do {
                try rm.write() {
                    rm.add(obj, update: true)
                }
            } catch {
                //empty
            }
        }
    }
    
    func delete(obj: T) {
        if let rm = realm {
            do {
                try rm.write() {
                    rm.delete(obj)
                }
            } catch {
                //empty
            }
        }
    }
    
    func deleteAll() {
        if let rm = realm {
            do {
                try rm.write() {
                    rm.deleteAll()
                }
            } catch {
                //empty
            }
        }
    }
    
    func getFirstOrDefault() -> T? {
        if let rm = realm {
            return rm.objects(T.self).first
        }
        return nil
    }
    
    func getLastOrDefault() -> T? {
        if let rm = realm {
            return rm.objects(T.self).last
        }
        return nil
    }
    
    func getAll() -> [T?] {
        var objs = [T?]()
        if let rm = realm {
            let items = rm.objects(T.self)
            for item in items {
                objs.append(item)
            }
        }
        return objs
    }
}

