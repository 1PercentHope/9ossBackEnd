const nodemailer = require('nodemailer');

// mail transporter infos

const transporter = nodemailer.createTransport({
    service: 'hotmail',
    auth: {
        user: 'onePercent-9oss@hotmail.com',
        pass: '9ossya3oss'
    }
})

const sendEmail = (name,email) =>{
    const mailOptions = {
        from: 'onePercent-9oss@hotmail.com',
        to: `${email}`,
        subject: 'welcome to 9ossNet',
        text: `Mr/Mrs ${name}, we are pleased to have you in our platform, we want to tell you, feel free to contact us if you encounter any issue.Yours 9ossNet team.`
    };
    
    transporter.sendMail(mailOptions,(err,info)=>{
        if(err){
            console.log(err)
        }else{
            console.log(`Email is sent: ${info}`)
        }
    });
};
const sendCode = (code,email) =>{
    const mailOptions = {
        from: 'onePercent-9ossf@hotmail.com',
        to: `${email}`,
        subject: 'Purchase code',
        text: `this is your purchase code: ${code}, please save it and keep it safe.`,
        html: `<h1> </h1>`
    };
    
    transporter.sendMail(mailOptions,(err,info)=>{
        if(err){
            console.log(err)
        }else{
            console.log(`Email is sent: ${info}`)
        }
    });
}
module.exports = {
    sendEmail,
    sendCode
}
