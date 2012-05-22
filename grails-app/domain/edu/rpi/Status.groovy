package edu.rpi

class Status {
//    static hasMany = [ticket:Ticket]

    String description

    String toString() {
      return description
    }

	static mapping = {
		version false
	}
	
    static constraints = {
		description blank: false
    }
}