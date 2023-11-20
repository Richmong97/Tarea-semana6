import Express from "express";
const app = Express();
import { auth } from "./routes/auth.js";

app.use(Express.json());

app.use('/api/auth',auth);

app.listen(3000, ()=> {
    console.log("servidor en puerto 4000");
})