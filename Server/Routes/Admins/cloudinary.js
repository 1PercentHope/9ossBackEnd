require('dotenv').config();
const cloudinary = require('cloudinary').v2;
cloudinary.config({
    cloud_name: process.env.CLOUDINARY_NAME || 'dscb1xrcp',
    api_key: process.env.CLOUDINARY_API_KEY || '143185813923486',
    api_secret: process.env.CLOUDINARY_API_SECRET || 'Z4qg2d5vmaSn0jOez4VcGBfUIZ8',
});

module.exports = { cloudinary };