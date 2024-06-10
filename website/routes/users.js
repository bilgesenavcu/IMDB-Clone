const express = require("express");
const router = express.Router();
const db = require("../data/db");
const passport = require('passport');
const cookieParser = require('cookie-parser');
router.use(cookieParser());



// Google authentication routes
router.get('/auth/google',
    passport.authenticate('google', { scope: ['profile', 'email'] }));

router.get('/auth/google/callback', 
    passport.authenticate('google', { failureRedirect: '/login' }),
    (req, res) => {
        const user = req.user; // Google ile giriş yapan kullanıcı bilgisi
        if (user && user.displayName) {
            // Google hesabındaki adı kullanarak oturum açma işlemi
            req.session.loggedInUser = {
                regName: user.displayName
            };
        }
        const redirectTo = req.session.redirectTo || '/';
        delete req.session.redirectTo; // Redirect ayarını kaldır
        res.redirect(redirectTo);
    }
);

router.get("/login", (req, res) => {
    res.render("login"); // login.ejs render et
});

// Register sayfasını render et
router.get("/register", (req, res) => {
    res.render("register"); // register.ejs render et
});

router.post('/register', (req, res) => {
    const { regName, regSurname, email, password, country, city } = req.body;
    const newUser = {
        regName,
        regSurname,
        regEmail: email,
        regPassword: password,
        regCountry: country,
        regCity: city
    };

    // Register tablosuna kullanıcıyı ekle
    db.query('INSERT INTO register SET ?', newUser, (err, result) => {
        if (err) {
            console.error('Kullanıcı kaydetme hatası:', err);
            return res.status(500).json({ error: 'Kullanıcı kaydetme hatası' });
        }

        console.log('Yeni kullanıcı eklendi:', result);
        // Başarılı kayıt işleminden sonra login sayfasına yönlendir
        res.redirect('/login');
    });
});

router.post("/login", async (req, res) => {
    const { email, password } = req.body;

    try {
        const [user] = await db.execute("SELECT * FROM register WHERE regEmail = ? AND regPassword = ?", [email, password]);

        if (user.length > 0) {
            // Başarılı giriş
            req.session.loggedInUser = {
                regName: user[0].regName,
                regSurname: user[0].regSurname,
                regEmail: user[0].regEmail
            };
            res.redirect("/"); // Girişten sonra anasayfaya yönlendir
        } else {
            // Başarısız giriş
            res.status(401).send("Geçersiz email veya şifre");
        }
    } catch (err) {
        console.log(err);
        res.status(500).send("Sunucu Hatası");
    }
});




router.get('/check-session', (req, res) => {
    if (req.session && req.session.loggedInUser) {
        const { regName, regSurname } = req.session.loggedInUser;
        console.log(`Session User: ${regName}`); // Debug için ekleyin
        res.json({
            isLoggedIn: true,
            user: {
                name: `${regName}`
            }
        });
    } else {
        res.json({
            isLoggedIn: false
        });
    }
});


router.get("/products/:id", async (req, res) => {
    try {
        const [product] = await db.execute("SELECT * FROM products WHERE id=?", [req.params.id]);
        console.log("Product URL: ", product[0].imageUrl);
        res.render("product-details", {
            urun: product[0]
        });
    } catch (err) {
        console.log(err);
        res.status(500).send("Sunucu Hatası");
    }
});

router.get("/products", async (req, res) => {
    try {
        const [products] = await db.execute("SELECT * FROM products");
        products.forEach(product => console.log("Product URL: ", product.imageUrl));
        res.render("products", {
            urunler: products
        });
    } catch (err) {
        console.log(err);
        res.status(500).send("Sunucu Hatası");
    }
});

// Check authentication route
router.get("/check-auth", (req, res) => {
    if (req.isAuthenticated()) {
        // User is authenticated
        res.json({ authenticated: true });
    } else {
        // User is not authenticated
        res.json({ authenticated: false });
    }
});



// Login route
router.get("/login", (req, res) => {
    // Check if the user is already authenticated
    if (req.isAuthenticated()) {
        // If the user is already logged in, redirect them to another page (e.g., the home page)
        res.redirect("/");
    } else {
        // If the user is not logged in, render the login page
        res.render("login");
    }
});




router.get("/search", async (req, res) => {
    const query = req.query.query || "";
    const category = req.query.category || "All";

    try {
        let results = [];

        if (category === "Titles") {
            const [products] = await db.execute("SELECT id, name, year, actor, imageUrl FROM products WHERE name LIKE ?", [`%${query}%`]);
            products.forEach(product => console.log("Product URL: ", product.imageUrl));
            results = products.map(product => ({ ...product, type: 'product' }));
        } else if (category === "Celebs") {
            const [people] = await db.execute("SELECT actorId, actorName, nickname, actorUrl FROM people WHERE actorName LIKE ? OR nickname LIKE ?", [`%${query}%`, `%${query}%`]);
            people.forEach(person => console.log("Actor URL: ", person.actorUrl));
            results = people.map(person => ({ ...person, type: 'person' }));
        } else if (category === "Summaries") {
            const [products] = await db.execute("SELECT id, name, description FROM products WHERE description LIKE ?", [`%${query}%`]);
            products.forEach(product => console.log("Product URL: ", product.imageUrl));
            results = products.map(product => ({ ...product, type: 'product' }));
        } else if (category === "All") {
            const [products] = await db.execute("SELECT id, name, year, actor, imageUrl FROM products WHERE name LIKE ?", [`%${query}%`]);
            const [people] = await db.execute("SELECT actorId, actorName, nickname, actorUrl FROM people WHERE actorName LIKE ? OR nickname LIKE ?", [`%${query}%`, `%${query}%`]);
            products.forEach(product => console.log("Product URL: ", product.imageUrl));
            people.forEach(person => console.log("Actor URL: ", person.actorUrl));
            results = [
                ...products.map(product => ({ ...product, type: 'product' })),
                ...people.map(person => ({ ...person, type: 'person' }))
            ];
        }

        res.render("search-results", {
            results: results,
            category: category,
            query: query
        });
    } catch (err) {
        console.log(err);
        res.status(500).send("Sunucu Hatası");
    }
});

//router, tahmin sağlıyor
router.get("/autocomplete", async function(req, res) {
    const query = req.query.query || "";
    const category = req.query.category || "All"; 
    if (query.length < 3) {
        return res.json([]);
    }

    try {
        let products = [];
        let people = [];

        if (category === "All" || category === "Titles" || category === "Summaries") {
            [products] = await db.execute("SELECT id, name, actor, imageUrl, year FROM products WHERE name LIKE ?", [`%${query}%`]);
        }
        if (category === "All" || category === "Celebs") {
            [people] = await db.execute("SELECT actorId, actorName, actorUrl, nickname FROM people WHERE actorName LIKE ? OR nickname LIKE ?", [`%${query}%`, `%${query}%`]);
        }

        const suggestions = [
            ...products.map(product => ({
                name: product.name,
                actor: product.actor,
                url: `/products/${product.id}`,
                image: `/images/${product.imageUrl}`,
                year: product.year,
                category: 'Products'
            })),
            ...people.map(person => ({
                name: person.actorName,
                title: person.nickname,
                image: `/images/${person.actorUrl}`,
                category: 'People'
            }))
        ].slice(0, 10); 

        res.json(suggestions);
    } catch (err) {
        console.log(err);
        res.status(500).send("Server error");
    }
});

router.get('/trailer/:id', async (req, res) => {
    try {
        const [product] = await db.execute("SELECT videoUrl FROM products WHERE id=?", [req.params.id]);
        if (product.length > 0) {
            res.render('trailer', {
                videoUrl: product[0].videoUrl
            });
        } else {
            res.status(404).send("Video bulunamadı");
        }
    } catch (err) {
        console.log(err);
        res.status(500).send("Sunucu Hatası");
    }
});



router.get("/", async (req, res) => {
    try {
        const [products] = await db.execute("SELECT * FROM products ORDER BY id ASC LIMIT 10");
        const topTenProducts = products.slice(0, 10);
        products.forEach(product => console.log("Product URL: ", product.imageUrl));
        const language = req.cookies.language || 'en';
        res.render("index", {
            urunler: topTenProducts,
            language: language
        });
    } catch (err) {
        console.log(err);
        res.status(500).send("Sunucu Hatası");
    }
});

module.exports = router;
