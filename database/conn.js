import pg from "pg-promise";
const pgp = pg();
import dotenv from "dotenv";
dotenv.config();

const user = process.env.USER;
const pass = process.env.PASS;
const host = process.env.HOST;
const database = process.env.DB;

const encodedPass = encodeURIComponent(pass);
const connectionString = `postgres://${user}:${encodedPass}@${host}:5432/${database}?ssl=true`;
const conn = pgp(connectionString);

conn.connect()
  .then(() => {
    console.log("Conexión exitosa");
  })
  .catch((err) => {
    console.log(`Error de conexión: ${err}`);
  });

  export { conn };