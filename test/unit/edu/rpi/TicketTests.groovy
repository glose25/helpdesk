package edu.rpi



import grails.test.mixin.*
import org.junit.*

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(Ticket)
class TicketTests {

    void testSave() {
		def openStatus = new Status(description: "Open")
		def ticket = new Ticket(shortDesc: "Jar sign issue",
			longDesc: "We need to resign the banicons.jar file as banner.rpi.edu", 
			status : openStatus)		
		assertEquals 'Jar sign issue', ticket.shortDesc
		ticket.save(flush:true)
		assert Ticket.count() == 1
       
    }
}
