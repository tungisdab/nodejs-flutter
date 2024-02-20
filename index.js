const express = require("express");
const mongoose = require("mongoose");
const Product = require("./product");
const app = express();

app.use(express.json());
app.use(express.urlencoded({ extended: true }));

const productData = [];

// mongodb+srv://tungisdab:<password>@cluster0.l5gphrz.mongodb.net/?retryWrites=true&w=majority

// connect to mongoose
mongoose.set("strictQuery", true);
mongoose.connect("mongodb+srv://tungisdab:<password>@cluster0.l5gphrz.mongodb.net/flutter_test", (error) => {
    if(!error) {
        console.log("Connected to MongoDB dap trai");
        // post api
        app.post("/api/add_products",async (req, res) => {
            console.log("Result", req.body);

            let data = Product(req.body);
            try {
                let dataToStore = await data.save();
                res.status(200).json(dataToStore);
            } catch (error) {
                res.status(400).json({
                    'status': error.message
                })
            }

            // const pdata = {
            //     "id": productData.length + 1,
            //     "pname": req.body.pname,
            //     "pprice": req.body.pprice,
            //     "pdesc": req.body.pdesc,
            // };

            // productData.push(pdata);
            // console.log("Final", pdata);

            // res.status(200).send({
            //     "status_code": 200,
            //     "message": "Product added successfully",
            //     "product": pdata
            // });
            
        })

        // get api
        app.get("/api/get_products", async (req, res) => {
            try {
                let data = await Product.find();
                res.status(200).json(data);
            } catch (error) {
                res.status(500).json(error.message);
            }

            // if (productData.length > 0) {
            //     res.status(200).send({
            //         "status_code": 200,
            //         "message": "Product list",
            //         "product": productData
            //     });
            // } else {
            //     res.status(200).send({
            //         "status_code": 200,
            //         "message": "Product list",
            //         "product": [],
            //     });
            // }
        })

        //get api by id
        app.get("/api/get_products/:id", async (req, res) => {
            try {
                let data = await Product.findById(req.params.id);
                res.status(200).json(data);
            } catch (error) {
                res.status(500).json(error.message);
            }

            // if (productData.length > 0) {
            //     res.status(200).send({
            //         "status_code": 200,
            //         "message": "Product list",
            //         "product": productData
            //     });
            // } else {
            //     res.status(200).send({
            //         "status_code": 200,
            //         "message": "Product list",
            //         "product": [],
            //     });
            // }
        })

        //update api
        app.patch("/api/update_products/:id", async (req, res) => {

        // app.put("/api/update_products/:id", (req, res) => {

            let id = req.params.id;
            let updateData = req.body;
            let options = {new: true};

            try {
                const data = await Product.findByIdAndUpdate(id, updateData, options);
                res.send(data);
            } catch (error) {
                res.send(error.message);
            }

            // let id = req.params.id * 1;
            // let productUpdate = productData.find(data => data.id === id);
            // let index = productData.indexOf(productUpdate);

            // productData[index] = req.body;
            
            // res.status(200).send({
            //     "status": "success",
            //     "message": "Product updated successfully",
            //     "product": productData[index]
            // });
        })

        // app.post("/api/delete_products/:id", async (req, res) => {
        app.delete("/api/delete_products/:id", async (req, res) => {
            let id = req.params.id;
            try {
                const data = await Product.findByIdAndDelete(id);
                res.json({
                    'status': "DELETED the product ${data.pname} successfully",
                });
            } catch (error) {
                res.json(error.message);
            }

            // let id = req.params.id * 1;
            // let productUpdate = productData.find(data => data.id === id);
            // let index = productData.indexOf(productUpdate);

            // console.log(id);

            // productData.splice(index, 1);
            
            // res.status(204).send({
            //     "status": "success",
            //     "message": "Product deleted successfully",
            // })
        });
    } else {
        console.log(error.message);
    }
});



// start server
app.listen(2000, () => {
    console.log("Server is running on port 2000");
})