package scrumplanner20



import org.junit.*
import grails.test.mixin.*
import javax.servlet.http.HttpServletResponse

@TestFor(SprintMemberController)
@Mock(SprintMember)
class SprintMemberControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/sprintMember/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.sprintMemberInstanceList.size() == 0
        assert model.sprintMemberInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.sprintMemberInstance != null
    }

    void testSave() {
        controller.save()
        assert response.status == HttpServletResponse.SC_METHOD_NOT_ALLOWED

        response.reset()
        request.method = 'POST'
        controller.save()

        assert model.sprintMemberInstance != null
        assert view == '/sprintMember/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/sprintMember/show/1'
        assert controller.flash.message != null
        assert SprintMember.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/sprintMember/list'


        populateValidParams(params)
        def sprintMember = new SprintMember(params)

        assert sprintMember.save() != null

        params.id = sprintMember.id

        def model = controller.show()

        assert model.sprintMemberInstance == sprintMember
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/sprintMember/list'


        populateValidParams(params)
        def sprintMember = new SprintMember(params)

        assert sprintMember.save() != null

        params.id = sprintMember.id

        def model = controller.edit()

        assert model.sprintMemberInstance == sprintMember
    }

    void testUpdate() {

        controller.update()
        assert response.status == HttpServletResponse.SC_METHOD_NOT_ALLOWED

        response.reset()
        request.method = 'POST'
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/sprintMember/list'

        response.reset()


        populateValidParams(params)
        def sprintMember = new SprintMember(params)

        assert sprintMember.save() != null

        // test invalid parameters in update
        params.id = sprintMember.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/sprintMember/edit"
        assert model.sprintMemberInstance != null

        sprintMember.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/sprintMember/show/$sprintMember.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        sprintMember.clearErrors()

        populateValidParams(params)
        params.id = sprintMember.id
        params.version = -1
        controller.update()

        assert view == "/sprintMember/edit"
        assert model.sprintMemberInstance != null
        assert model.sprintMemberInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert response.status == HttpServletResponse.SC_METHOD_NOT_ALLOWED

        response.reset()
        request.method = 'POST'
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/sprintMember/list'

        response.reset()

        populateValidParams(params)
        def sprintMember = new SprintMember(params)

        assert sprintMember.save() != null
        assert SprintMember.count() == 1

        params.id = sprintMember.id

        controller.delete()

        assert SprintMember.count() == 0
        assert SprintMember.get(sprintMember.id) == null
        assert response.redirectedUrl == '/sprintMember/list'
    }
}
