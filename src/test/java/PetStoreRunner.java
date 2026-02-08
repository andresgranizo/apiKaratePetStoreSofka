import com.intuit.karate.junit5.Karate;

public class PetStoreRunner {

    @Karate.Test
    public Karate testPetCrud() {
        return Karate.run("petstore/pet-crud").relativeTo(getClass());
    }
}
