package edu.rpi



import org.junit.*
import grails.test.mixin.*

@TestFor(TicketController)
@Mock(Ticket)
class TicketControllerTests {


    def populateValidParams(params) {
      assert params != null
      params["shortDesc"] = 'something went wrong'
	  params["longDesc"] = 'something went horribly wrong'
	  params["status"] = new Status(description: "Open")
    }

    void testIndex() {
        controller.index()
        assert "/ticket/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.ticketInstanceList.size() == 0
        assert model.ticketInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.ticketInstance != null
    }

    void testSave() {
        controller.save()

        assert model.ticketInstance != null
        assert view == '/ticket/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/ticket/show/1'
        assert controller.flash.message != null
        assert Ticket.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/ticket/list'


        populateValidParams(params)
        def ticket = new Ticket(params)

        assert ticket.save() != null

        params.id = ticket.id

        def model = controller.show()

        assert model.ticketInstance == ticket
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/ticket/list'


        populateValidParams(params)
        def ticket = new Ticket(params)

        assert ticket.save() != null

        params.id = ticket.id

        def model = controller.edit()

        assert model.ticketInstance == ticket
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/ticket/list'

        response.reset()


        populateValidParams(params)
        def ticket = new Ticket(params)

        assert ticket.save() != null

        // test invalid parameters in update
        params.id = ticket.id
        params.shortDesc = null
		params.longDesc = null
		params.status = null

        controller.update()

        assert view == "/ticket/edit"
        assert model.ticketInstance != null

        ticket.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/ticket/show/$ticket.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        ticket.clearErrors()

        populateValidParams(params)
        params.id = ticket.id
        params.version = -1
        controller.update()

        assert view == "/ticket/edit"
        assert model.ticketInstance != null
        assert model.ticketInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/ticket/list'

        response.reset()

        populateValidParams(params)
        def ticket = new Ticket(params)

        assert ticket.save() != null
        assert Ticket.count() == 1

        params.id = ticket.id

        controller.delete()

        assert Ticket.count() == 0
        assert Ticket.get(ticket.id) == null
        assert response.redirectedUrl == '/ticket/list'
    }
}
