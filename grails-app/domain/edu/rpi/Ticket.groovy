package edu.rpi

class Ticket {
   
    String shortDesc
    String longDesc
    Date dateCreated
    Date dateClosed
    Status status

    static constraints = {
		shortDesc blank: false
		longDesc  blank: false
		status 	  nullable : true
		dateCreated nullable :true
		dateClosed nullable : true
		status    blank: false
    }
	
	static mapping = {
		version : false
	}

}