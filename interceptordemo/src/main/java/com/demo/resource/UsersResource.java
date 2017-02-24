package com.demo.resource;

import com.demo.model.User;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.stereotype.Service;

import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@Service
@Path("/users")
public class UsersResource {
    static Map<Integer, User> users = new HashMap<Integer, User>() {
        {
            put(1, new User(1, "User one"));
            put(2, new User(2, "User two"));
            put(3, new User(3, "User three"));
        }
    };

    @GET
    @Path("/{id}")
    @Produces(MediaType.APPLICATION_JSON)
    public Response getUser(@PathParam("id") int id) throws IOException {
        //System.out.println("DEBUG: v3, line 36, GET /user/get/" + id);
        User aUser = users.get(id);
        ObjectMapper mapper = new ObjectMapper();
        String jsonResult = mapper.writeValueAsString(aUser);
        return Response.status(200).entity(jsonResult + "\n").build();
    }

    @POST
    @Path("/")
    @Consumes(MediaType.APPLICATION_JSON)
    public Response createUser(User user) {
        //System.out.println("DEBUG: line 47, POST /user/post: " + user);
        users.put(user.getId(), user);
        return Response.status(200).entity("OK\n").build();
    }
}