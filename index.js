const express = require("express");

const app = express();

app.use(express.json());
app.use(express.urlencoded({ extended: true }));

const productData = [];

app.listen(2000, () => {
    console.log("Server is running on port 2000");
})

// post api
app.post("/api/add_products",(req, res) => {
    console.log("Result", req.body);
    const pdata = {
        "id": productData.length + 1,
        "pname": req.body.pname,
        "pprice": req.body.pprice,
        "pdesc": req.body.pdesc,
    };

    productData.push(pdata);
    console.log("Final", pdata);

    res.status(200).send({
        "status_code": 200,
        "message": "Product added successfully",
        "product": pdata
    });

})

// get api
app.get("/api/get_products", (req, res) => {
    if (productData.length > 0) {
        res.status(200).send({
            "status_code": 200,
            "message": "Product list",
            "product": productData
        });
    } else {
        res.status(200).send({
            "status_code": 200,
            "message": "Product list",
            "product": [],
        });
    }
})

//update api

app.put("/api/update_products/:id", (req, res) => {
    let id = req.params.id * 1;
    let productUpdate = productData.find(data => data.id === id);
    let index = productData.indexOf(productUpdate);

    productData[index] = req.body;
    
    res.status(200).send({
        "status": "success",
        "message": "Product updated successfully",
        "product": productData[index]
    });
})

app.post("/api/delete_products/:id", (req, res) => {
    let id = req.params.id * 1;
    let productUpdate = productData.find(data => data.id === id);
    let index = productData.indexOf(productUpdate);

    console.log(id);

    productData.splice(index, 1);
    
    res.status(204).send({
        "status": "success",
        "message": "Product deleted successfully",
    })
});