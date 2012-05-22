package edu.rpi



import grails.test.mixin.*
import org.junit.*

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(Status)
class StatusTests {

    void testSave() {
       Status open = new Status(description: 'Open').save(flush : true)
	   assert Status.count() == 1 	  
    }
}
