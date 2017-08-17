import Vapor

extension Droplet {
    
    func getJSON() -> [String: Int] {
        var rndJSON = [String: Int]()
        
        for i in 1...1000 {
            let randomNumber = Int(arc4random_uniform(UInt32(10)))
            rndJSON["Index \(i)"] = randomNumber
        }
        return rndJSON
    }
    
    func setupRoutes() throws {
       
        //json route
        get("json") { req in
            var json = JSON()
            for (element, number) in self.getJSON() {
                try json.set(element, number)
            }
            return json
        }
        
        // response to requests to /info domain
        // with a description of the request
        get("info") { req in
            return req.description
        }

        get("description") { req in return req.description }
        
        try resource("posts", PostController.self)
    }
}
