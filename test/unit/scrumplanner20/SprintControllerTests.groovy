package scrumplanner20



import org.junit.*
import grails.test.mixin.*
import javax.servlet.http.HttpServletResponse

@TestFor(SprintController)
@Mock(Sprint)
class SprintControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/sprint/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.sprintInstanceList.size() == 0
        assert model.sprintInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.sprintInstance != null
    }

    void testSave() {
        controller.save()
        assert response.status == HttpServletResponse.SC_METHOD_NOT_ALLOWED

        response.reset()
        request.method = 'POST'
        controller.save()

        assert model.sprintInstance != null
        assert view == '/sprint/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/sprint/show/1'
        assert controller.flash.message != null
        assert Sprint.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/sprint/list'


        populateValidParams(params)
        def sprint = new Sprint(params)

        assert sprint.save() != null

        params.id = sprint.id

        def model = controller.show()

        assert model.sprintInstance == sprint
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/sprint/list'


        populateValidParams(params)
        def sprint = new Sprint(params)

        assert sprint.save() != null

        params.id = sprint.id

        def model = controller.edit()

        assert model.sprintInstance == sprint
    }

    void testUpdate() {

        controller.update()
        assert response.status == HttpServletResponse.SC_METHOD_NOT_ALLOWED

        response.reset()
        request.method = 'POST'
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/sprint/list'

        response.reset()


        populateValidParams(params)
        def sprint = new Sprint(params)

        assert sprint.save() != null

        // test invalid parameters in update
        params.id = sprint.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/sprint/edit"
        assert model.sprintInstance != null

        sprint.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/sprint/show/$sprint.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        sprint.clearErrors()

        populateValidParams(params)
        params.id = sprint.id
        params.version = -1
        controller.update()

        assert view == "/sprint/edit"
        assert model.sprintInstance != null
        assert model.sprintInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert response.status == HttpServletResponse.SC_METHOD_NOT_ALLOWED

        response.reset()
        request.method = 'POST'
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/sprint/list'

        response.reset()

        populateValidParams(params)
        def sprint = new Sprint(params)

        assert sprint.save() != null
        assert Sprint.count() == 1

        params.id = sprint.id

        controller.delete()

        assert Sprint.count() == 0
        assert Sprint.get(sprint.id) == null
        assert response.redirectedUrl == '/sprint/list'
    }
}
