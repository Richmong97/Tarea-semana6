import Express  from "express";
const users = Express();
import { createUser } from "../controllers/usersControllers.js";

users.post('', createUser);


export {

    users

}