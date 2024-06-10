const passport = require('passport');
const GoogleStrategy = require('passport-google-oauth20').Strategy;

passport.use(new GoogleStrategy({
    clientID: '451492416431-96thehfbr114ghjrhujmk5d12g5s14s7.apps.googleusercontent.com',
    clientSecret: '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',
    callbackURL: 'http://localhost:3000/auth/google/callback'
  },
  function(accessToken, refreshToken, profile, cb) {
    // Kullanıcıyı veritabanında arayabilir veya kaydedebilirsiniz
    return cb(null, profile);
  }
));