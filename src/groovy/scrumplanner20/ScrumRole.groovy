package scrumplanner20

public enum ScrumRole {
    MEMBER("Member"), PRODUCT_OWNER("Product Owner"), SCRUM_MASTER("Scrum Master")
    String role
    ScrumRole(String role){
        this.role = role
    }
    public static ScrumRole generateScrumRole(String role)
    {
        for(ScrumRole sr : ScrumRole.values())
        {
            if(sr.role.equals(role))
            {
                return sr
            }
        }
    }
}