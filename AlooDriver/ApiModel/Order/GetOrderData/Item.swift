/* 
Copyright (c) 2021 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
import ObjectMapper

struct Item : Mappable {
	var id : Int?
	var price : String?
	var img : String?
    var name: String?
	var name_en : String?
	var brief_desc_en : String?
	var description_en : String?
	var name_ar : String?
	var brief_desc_ar : String?
	var description_ar : String?
	var amount : Int?
	var amount_type : String?
	var images : [String]?
	var optionals : [String]?
	var sizes : [String]?
	var extras : [String]?
	var drinks : [String]?

	init?(map: Map) {

	}

	mutating func mapping(map: Map) {

		id <- map["id"]
		price <- map["price"]
		img <- map["img"]
		name_en <- map["name_en"]
		brief_desc_en <- map["brief_desc_en"]
		description_en <- map["description_en"]
		name_ar <- map["name_ar"]
		brief_desc_ar <- map["brief_desc_ar"]
		description_ar <- map["description_ar"]
		amount <- map["amount"]
		amount_type <- map["amount_type"]
		images <- map["images"]
		optionals <- map["optionals"]
		sizes <- map["sizes"]
		extras <- map["extras"]
		drinks <- map["drinks"]
        name <- map["name"]
	}

}
