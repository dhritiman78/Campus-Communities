const express = require("express");
const dotenv = require("dotenv");
const cors = require("cors");
const cookieParser = require("cookie-parser");
const bodyParser = require("body-parser");
const authRouter = require("./routes/auth.route");
const instituteRouter = require("./routes/institute.routes");
const bannerRouter = require('./routes/banner.routes');

dotenv.config();
const app = express();

const corsOptions = {
    // origin: (origin, callback) => {
    //     const allowedOrigins = [
    //         "http://localhost:5173",
    //         "http://localhost:63728"
    //     ];

    //     if (!origin || allowedOrigins.includes(origin)) {
    //         callback(null, origin);
    //     } else {
    //         callback(new Error("Not allowed by CORS"));
    //     }
    origin:true,
    // },
    methods: "GET, POST, PUT, DELETE, PATCH, HEAD",
    credentials: true,
};

app.set('trust proxy', 1);
app.use(cookieParser());
app.use(bodyParser.urlencoded({ limit: "50mb", extended: true }));
app.use(express.json({ limit: "50mb" }));
app.use(cors(corsOptions));
app.use(express.urlencoded({extended:false}));

app.use('/api/auth', authRouter);
app.use('/api/institute', instituteRouter);
app.use('/api/banner',bannerRouter);

module.exports = app;

