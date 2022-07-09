const express = require('express');
const app = express();
const fileUpload = require('express-fileupload');
const { Client } = require('pg');
const { response } = require('express');
const fs = require('fs');

const client = new Client({
    user: 'postgres',
    host: 'localhost',
    database: 'cdmaarena',
    password: 'diffa5756',
    port: 5432
});

client.connect((err) =>{
    if (err) {
        console.error(err);
        return;
    }
    console.log('Database Connected');
});
// set the view engine to ejs
app.set('view engine', 'ejs');
// use stylesheet and js in public directory for ejs views 
app.use(express.static(__dirname + '/public'));
app.use(express.urlencoded({ extended: false })); 
app.use(fileUpload());
// use res.render to load up an ejs view file

// index page
app.get('/', function(req, res) {
    const query = `SELECT * FROM produk LIMIT 3`;
    client.query(query , [], (err, results) => {
        if (err) {
            console.error(err);
            return;
        }
        res.render('pages/index', {
            model: results.rows
          });
    });    
});

//display list of all smartphones
app.get('/smartphones', function(req, res) {
    const query = `SELECT * FROM produk`;
    client.query(query , [], (err, results) => {
        if (err) {
            console.error(err);
            return;
        }
        res.render('pages/smartphones', {
            model: results.rows
          });
    });  
});

//display Smartphone detail page
app.get('/details/:id', function(req, res) {
    const id = req.params.id;
    const query = `SELECT * FROM produk a INNER JOIN spesifikasi b ON a.id_produk = b.id_produk 
                   INNER JOIN score c ON b.id_produk = c.id_produk WHERE a.id_produk = $1`;
    client.query(query , [id], (err, results) => {
        if (err) {
            console.error(err);
            return;
        }
        res.render('pages/details', {
            model: results.rows[0]
        });
    });  
  });

//display all smartphone in table with settings options
app.get('/settings', function(req, res) {
    const query = `SELECT * FROM produk`;
    client.query(query , [], (err, results) => {
        if (err) {
            console.error(err);
            return;
        }
        res.render('pages/settings', {
            model: results.rows
          });
    });  
});

//GET and POST for add smartphone
app.get("/create", (req, res) => {
    res.render("pages/create");
});
app.post("/create", (req, res) => {
    if (!req.files || Object.keys(req.files).length === 0) {
        return res.status(400).send('No files were uploaded.');
    }
    let uploadedFile = req.files.gambar;
    let image_name = uploadedFile.name;
    //upload image file to directory public/images/
    uploadedFile.mv(`public/images/${image_name}`, (err ) => {
        if (err) {
            return res.status(500).send(err);
        }
    });
    //execute 3 INSERT query to store new data in 3 tables
    const query = `INSERT INTO produk (id_produk, tipe, merk, waktu_pengumuman, waktu_rilis, gambar) 
                   VALUES ($1, $2, $3, $4, $5, $6)`;
    const produk = [req.body.id, req.body.tipe, req.body.merk, req.body.waktu1, req.body.waktu2, 
                   req.files.gambar.name];
    client.query(query, produk, (err, result) => {
    if (err) {
        console.error(err);
    return;
    }
    });
       
    const query2 = `INSERT INTO spesifikasi (id_produk, sistem_operasi, prosesor, memori, kamera_utama, layar, 
                    baterai, warna) VALUES ($1, $2, $3, $4, $5, $6, $7, $8)`;
    const spesifikasi = [req.body.id, req.body.os, req.body.prosesor, req.body.memori, req.body.kamera, 
                        req.body.layar, req.body.baterai, req.body.warna];
    client.query(query2, spesifikasi, (err, result) => {
      if (err) {
            console.error(err);
            return;
        }
    });

    const query3 = `INSERT INTO score (id_produk, geekbench5_single, geekbench5_multi, dxomark, displaymate, 
                    battery_endurance_rating) VALUES ($1, $2, $3, $4, $5, $6)`;
    const score = [req.body.id, req.body.geekbench1, req.body.geekbench2, req.body.dxomark, req.body.displaymate, 
                  req.body.ber];
    client.query(query3, score, (err, result) => {
      if (err) {
            console.error(err);
            return;
        }
    });
    res.redirect("/settings");
});

//GET and POST for edit smartphone
app.get("/edit/:id", (req, res) => {
    const id = req.params.id;
    const query = `SELECT * FROM produk a INNER JOIN spesifikasi b ON a.id_produk = b.id_produk 
                   INNER JOIN score c ON b.id_produk = c.id_produk WHERE a.id_produk = $1`;
    client.query(query , [id], (err, results) => {
        if (err) {
            console.error(err);
            return;
        }
        res.render('pages/edit', {
            model: results.rows[0]
        });
    });  
});
app.post("/edit/:id", (req, res) => {
    if (!req.files || Object.keys(req.files).length === 0) {
        return res.status(400).send('No files were uploaded.');
    }
    let uploadedFile = req.files.gambar;
    let image_name = uploadedFile.name;
    //upload image file to directory public/images/
    uploadedFile.mv(`public/images/${image_name}`, (err ) => {
        if (err) {
            return res.status(500).send(err);
        }
    });

    const id = req.params.id;
    const query = `UPDATE produk SET id_produk = $1, tipe = $2, merk = $3, waktu_pengumuman = $4, 
                   waktu_rilis = $5, gambar = $6 WHERE id_produk = $7`;
    const produk = [req.body.id, req.body.tipe, req.body.merk, req.body.waktu1, req.body.waktu2, 
                   req.files.gambar.name, id];
    client.query(query , produk, (err, results) => {
        if (err) {
            console.error(err);
            return;
        }
    }); 
    
    const query2 = `UPDATE spesifikasi SET id_produk = $1, sistem_operasi = $2, prosesor = $3, memori = $4, 
                    kamera_utama = $5, layar = $6, baterai = $7, warna = $8 WHERE id_produk = $9`;
    const spesifikasi = [req.body.id, req.body.os, req.body.prosesor, req.body.memori, req.body.kamera, 
                        req.body.layar, req.body.baterai, req.body.warna, id];
    client.query(query2 , spesifikasi, (err, results) => {
        if (err) {
            console.error(err);
            return;
        }
    }); 

    const query3 = `UPDATE score SET id_produk = $1, geekbench5_single = $2, geekbench5_multi = $3, 
                    dxomark = $4, displaymate = $5, battery_endurance_rating = $6 WHERE id_produk = $7`;
    const score = [req.body.id, req.body.geekbench1, req.body.geekbench2, req.body.dxomark, req.body.displaymate, 
                  req.body.ber, id];
    client.query(query3 , score, (err, results) => {
        if (err) {
            console.error(err);
            return;
        }
    }); 
    res.redirect("/settings");
});

//GET and POST for delete smartphone
app.get("/delete/:id", (req, res) => {
    const id = req.params.id;
    const query = `SELECT * FROM produk a INNER JOIN spesifikasi b ON a.id_produk = b.id_produk 
                   INNER JOIN score c ON b.id_produk = c.id_produk WHERE a.id_produk = $1`;
    client.query(query , [id], (err, results) => {
        if (err) {
            console.error(err);
            return;
        }
        res.render('pages/delete', {
            model: results.rows[0]
        });
    });  
});
app.post("/delete/:id", (req, res) => {
    const id = req.params.id;
    const query = `DELETE FROM produk WHERE id_produk = $1`;
    client.query(query , [id], (err, results) => {
        if (err) {
            console.error(err);
            return;
        }
    }); 
    res.redirect("/settings");
});

app.listen(61666, () => {
    console.log('Program berjalan pada port 61666');
});